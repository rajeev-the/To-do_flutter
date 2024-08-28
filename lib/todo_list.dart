import 'package:flutter/material.dart';

class MYTODO extends StatefulWidget {
  const MYTODO({super.key});

  @override
  State<MYTODO> createState() => _MYTODOState();
}

class _MYTODOState extends State<MYTODO> {
  List<String> todolist = [];
  TextEditingController controller1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO-List"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: todolist.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(" ${index+1} . ${todolist[index]} "),
                ),
              ),
            ),
            TextField(
              controller: controller1,
              decoration: InputDecoration(
                hintText: 'Enter a task',
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        todolist.add(controller1.text);
                        controller1.clear();
                      });
                    },
                    child: Text("Add"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (todolist.isNotEmpty) {
                           int? index = int.tryParse(controller1.text);
                          if (index != null && index > 0 && index <= todolist.length) {
                            todolist.removeAt(index - 1); // Adjusting for 1-based index
                          }
                        }
                      });
                    },
                    child: Text("Remove"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
