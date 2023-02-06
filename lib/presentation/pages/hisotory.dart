import 'package:flutter/material.dart';
import 'package:my_simple_store/config/constants/local_data.dart';
import 'package:my_simple_store/presentation/widgets/history_widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return hello.isEmpty
        ? ColoredBox(
            color: Colors.grey.withOpacity(0.2),
            child: const Center(
              child: Text('История пуста'),
            ))
        : ColoredBox(
            color: Colors.grey.withOpacity(0.2),
            child: ListView(
              children: const [
                HistoryWidget(),
              ],
            ),
          );
  }
}
