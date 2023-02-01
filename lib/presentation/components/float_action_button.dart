
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:my_simple_store/config/constants/constants.dart';
import 'package:my_simple_store/presentation/routes/routes.dart';

class FloatActionButton extends StatelessWidget {
  const FloatActionButton({
    Key? key,
    required AnimationController? animationController,
    required Animation<double>? animation,
  }) : _animationController = animationController, _animation = animation, super(key: key);

  final AnimationController? _animationController;
  final Animation<double>? _animation;

  @override
  Widget build(BuildContext context) {
    return FloatingActionBubble(
      items: List.generate(
        2,
        (index) => Bubble(
          title: floatListNames[index],
          iconColor: Colors.white,
          bubbleColor: Colors.blue,
          icon: floatListIcons[index],
          titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            switch (index) {
              case 0:
                Navigator.pushNamed(context, Routes.addCategory);
                break;
              case 1:
                Navigator.pushNamed(context, Routes.addProductsPage);
                break;
            }
            _animationController!.reverse();
          },
        ),
      ),
      animation: _animation!,
      onPress: () => _animationController!.isCompleted
          ? _animationController!.reverse()
          : _animationController!.forward(),
      iconColor: Colors.white,
      iconData: Icons.add,
      backGroundColor: Colors.blue,
    );
  }
}
