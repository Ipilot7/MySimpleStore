import 'package:flutter/material.dart';
import 'package:my_simple_store/presentation/widgets/history_widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.grey.withOpacity(0.2),
      child: ListView(
        children: const [
          HistoryWidget(),
          HistoryWidget(),
        ],
      ),
    );
  }
}
