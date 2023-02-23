import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:my_simple_store/data/models/income_expenses_model.dart';
import 'package:my_simple_store/data/services/incomeService.dart';
import 'package:my_simple_store/presentation/components/float_action_button.dart';
import 'package:my_simple_store/presentation/pages/history.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late List<IncomeExpensesModel> _userList = <IncomeExpensesModel>[];
  final _userService = IncomeService();
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController!);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  getAllUserDetails() async {
    var users = await _userService.readAllData();
    _userList = <IncomeExpensesModel>[];
    users.forEach((user) {
      setState(() {
        var userModel = IncomeExpensesModel();
        userModel.id = user['id'];
        userModel.desc = user['desc'];
        userModel.price = user['price'];
        _userList.add(userModel);
      });
    });
  }

  Animation<double>? _animation;
  AnimationController? _animationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
        ),
        title: const Text("Wallefy"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => HistoryPage()));
              },
              icon: Icon(Icons.history))
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(10.r),
        width: double.infinity,
        height: 200.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.teal, borderRadius: BorderRadius.circular(10.r)),
        child: Text('data'),
      ),
      floatingActionButton: FloatActionButton(
          animationController: _animationController, animation: _animation),
    );
  }
}
