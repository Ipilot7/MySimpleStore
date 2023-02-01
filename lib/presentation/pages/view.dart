import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_simple_store/config/constants/app_text_styles.dart';
import 'package:my_simple_store/config/constants/assets.dart';
import 'package:my_simple_store/config/constants/constants.dart';
import 'package:my_simple_store/presentation/components/float_action_button.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage>
    with SingleTickerProviderStateMixin {
  Animation<double>? _animation;
  AnimationController? _animationController;

  PageController controller = PageController();

  int _selectedPage = 0;

  List<bool> indexes = [true, false, false, false];

  void select(int index) {
    indexes.clear();
    indexes = List.generate(4, (i) => i == index);
    setState(() {
      _selectedPage = index;
    });
    controller.jumpToPage(_selectedPage);
  }

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

  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue.shade400, Colors.blue.shade500],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter),
            ),
          ),
          SafeArea(
            child: Container(
              width: 200,
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          child: Image.asset(Assets.images.defAvatar),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Baxtiyor',
                          style: AppTextStyles.body20w5,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: const [Text('Info')],
                  )
                ],
              ),
            ),
          ),
          TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: value),
              curve: Curves.easeInExpo,
              duration: const Duration(milliseconds: 500),
              builder: (_, double val, __) {
                return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..setEntry(0, 3, 200 * val)
                      ..rotateY((pi / 6) * val),
                    child: Scaffold(
                      appBar: AppBar(
                        elevation: 0,
                        title: Text(
                          menuNames[_selectedPage],
                        ),
                      ),
                      body: PageView(
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        reverse: true,
                        controller: controller,
                        children: getPages(),
                      ),
                      floatingActionButton: _selectedPage == 0
                          ? FloatActionButton(
                              animationController: _animationController,
                              animation: _animation)
                          : null,
                      bottomNavigationBar: BottomNavigationBar(
                        currentIndex: _selectedPage,
                        onTap: (index) {
                          select(index);
                        },
                        selectedItemColor: Colors.blue,
                        unselectedItemColor: Colors.black,
                        items: List.generate(
                          menuIcons.length,
                          (index) => BottomNavigationBarItem(
                            icon: menuIcons[index],
                            label: menuNames[index],
                          ),
                        ),
                      ),
                    ));
              }),
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },
          )
        ],
      ),
    );
  }
}
