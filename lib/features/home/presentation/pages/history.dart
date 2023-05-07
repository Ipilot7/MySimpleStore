import 'package:flutter/material.dart';

import '../widgets/history_widget.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("История"),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return const HistoryWidget();
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
