import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:my_simple_store/config/constants/app_colors.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';
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
  static double fabHeightClosed = 116.h;
  double fabHeight = fabHeightClosed;

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
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            ZoomDrawer.of(context)!.toggle();
          },
        ),
        title: Text(
          'Home',
          style: AppTextStyles.body37w5.copyWith(color: AppColors.white),
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
        body: const Text('home'),
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
