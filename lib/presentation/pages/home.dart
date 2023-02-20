import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:my_simple_store/config/constants/app_colors.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';
import 'package:my_simple_store/data/data_providers/db_handler.dart';
import 'package:my_simple_store/data/models/income_expenses_model.dart';
import 'package:my_simple_store/presentation/components/float_action_button.dart';
import 'package:my_simple_store/presentation/pages/hisotory.dart';
import 'package:my_simple_store/presentation/widgets/history_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  static double fabHeightClosed = 116.h;
  double fabHeight = fabHeightClosed;

  PanelController panelController = PanelController();
  ScrollController scrollcontroler = ScrollController();
  Animation<double>? _animation;
  AnimationController? _animationController;

/////////
  DBHelper? dbHelper;
  late Future<List<IncomeExpensesModel>> dataList;
  final _fromKey = GlobalKey<FormState>();

  final price = TextEditingController();
  final descInput = TextEditingController();

  String text = '';
/////////
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

     dbHelper = DBHelper();
    loadData();
  }
    loadData() async {
    dataList = dbHelper!.getDataList();
  }

  @override
  Widget build(BuildContext context) {
    var panelHeightOpen = MediaQuery.of(context).size.height * 0.8;
    var panelHeightClosed = MediaQuery.of(context).size.height * 0.1;
    return Scaffold(
      backgroundColor: AppColors.lightBgClr,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
        ),
        title: Text(
          'Wallefy',
          style: AppTextStyles.body26w5.copyWith(color: AppColors.white),
        ),
      ),
      body: SlidingUpPanel(
        controller: panelController,
        backdropTapClosesPanel: false,
        maxHeight: panelHeightOpen,
        minHeight: panelHeightClosed,
        color: AppColors.lightBgClr,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(18), topRight: Radius.circular(18)),
        parallaxEnabled: true,
        parallaxOffset: .5,
        body: Column(
          // shrinkWrap: true,
          // physics: const BouncingScrollPhysics(),
          children: [
            Container(
              height: 200.h,
              margin: EdgeInsets.all(10.r),
              padding: EdgeInsets.all(10.r),
              decoration: BoxDecoration(
                  color: AppColors.indigo,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.indigo,
                        blurRadius: 10,
                        offset: const Offset(5, 7))
                  ]),
              child: Column(
                children: const [
                  Text('data'),
                  Text('data'),
                ],
              ),
            ),
            Expanded(
          child: FutureBuilder(
            future: dataList,
            builder:
                (context, AsyncSnapshot<List<IncomeExpensesModel>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.data!.isEmpty) {
                return const Center(
                  child: Text('Данных нет'),
                );
              } else {
                List<List<IncomeExpensesModel>> filterList = [];
                List<IncomeExpensesModel> newData = [...snapshot.data!];
                for (int i = 0; i < snapshot.data!.length; i++) {
                  var a = snapshot.data![i].datatime;
                  List<IncomeExpensesModel> set = [];
                  for (int j = 0; j < newData.length; j++) {
                    if (a == newData[j].datatime) {
                      set.add(newData[j]);
                      newData[j] = IncomeExpensesModel(datatime: '');
                    }
                  }
                  if (set.isNotEmpty) {
                    filterList.add(set);
                  }
                }
                return ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  // controller: widget.controller,
                  itemCount: filterList.length,
                  itemBuilder: (_, index) =>
                      HistoryWidget(dataList: filterList[index]),
                );
              }
            },
          ),
        ),
          ],
        ),
        panelBuilder: (scrollcontroler) => HistoryPage(
          controller: scrollcontroler,
          panelController: panelController,
        ),
        onPanelSlide: (position) => setState(() {
          final panelMaxScrolExtent = panelHeightOpen - panelHeightClosed;
          fabHeight = position * panelMaxScrolExtent + fabHeightClosed;
        }),
      ),
      floatingActionButton: fabHeight <= 116.h
          ? Padding(
              padding: EdgeInsets.only(bottom: fabHeight.h),
              child: FloatActionButton(
                  animationController: _animationController,
                  animation: _animation),
            )
          : null,
    );
  }
}
