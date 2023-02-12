import 'package:flutter/material.dart';
import 'package:my_simple_store/presentation/components/float_action_button.dart';
import 'package:my_simple_store/presentation/pages/hisotory.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  PanelController panelController = PanelController();
  ScrollController scrollcontroler = ScrollController();
  Animation<double>? _animation;
  AnimationController? _animationController;

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

  @override
  Widget build(BuildContext context) {
    var panelHeightOpen = MediaQuery.of(context).size.height * 0.8;
    var panelHeightClosed = MediaQuery.of(context).size.height * 0.1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Home',
        ),
      ),
      body: SlidingUpPanel(
          maxHeight: panelHeightOpen,
          minHeight: panelHeightClosed,
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18), topRight: Radius.circular(18)),
          parallaxEnabled: true,
          parallaxOffset: .5,
          body: const Text('home'),
          panelBuilder: (sc) => HistorPage(
                controller: scrollcontroler,
                panelController: panelController,
              )),
      floatingActionButton: FloatActionButton(
          animationController: _animationController, animation: _animation),
    );
  }

  // _showMessage(String text, {bool isError = true}) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       backgroundColor: isError ? Colors.red : Colors.green[400],
  //       content: Text(
  //         text,
  //         // style: kTextStyle(size: 15, fontWeight: FontWeight.w500),
  //       ),
  //     ),
  //   );
  // }
}
