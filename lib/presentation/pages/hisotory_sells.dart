import 'package:flutter/material.dart';
import 'package:my_simple_store/presentation/widgets/history_widget.dart';

class HistorySellsPage extends StatefulWidget {
  const HistorySellsPage({super.key});

  @override
  State<HistorySellsPage> createState() => _HistorySellsPageState();
}

class _HistorySellsPageState extends State<HistorySellsPage> {
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
