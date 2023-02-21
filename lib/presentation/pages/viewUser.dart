import 'package:flutter/material.dart';
import 'package:my_simple_store/data/models/income_expenses_model.dart';

class ViewUser extends StatefulWidget {
  final IncomeExpensesModel user;

  const ViewUser({Key? key, required this.user}) : super(key: key);

  @override
  State<ViewUser> createState() => _ViewUserState();
}

class _ViewUserState extends State<ViewUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("SQLite CRUD"),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Full Details",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.blueGrey,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text('Name',
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(widget.user.desc ?? '', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text('Contact',
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text((widget.user.price ?? 0) as String, style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     const Text('Description',
              //         style: TextStyle(
              //             color: Colors.teal,
              //             fontSize: 16,
              //             fontWeight: FontWeight.w600)),
              //     const SizedBox(
              //       height: 20,
              //     ),
              //     Text(widget.user.description ?? '', style: const TextStyle(fontSize: 16)),
              //   ],
              // )
            ],
          ),
        ));
  }
}
