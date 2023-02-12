import 'package:flutter/material.dart';
import 'package:my_simple_store/presentation/widgets/history_widget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HistorPage extends StatelessWidget {
  const HistorPage(
      {super.key, required this.controller, required this.panelController});
  final ScrollController controller;
  final PanelController panelController;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ListView(
      shrinkWrap: true,
      controller: controller,
      padding: EdgeInsets.zero,
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            width: size.width * 0.5,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text('Баланс: 350000000000'),
          ),
        ),
        const HistoryWidget(),
      ],
    );
  }
}
