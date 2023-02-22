// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:todo1/screens/task_list_screen.dart';

// class newTestScreen extends StatefulWidget {
//   const newTestScreen({super.key});

//   @override
//   State<newTestScreen> createState() => _newTestScreenState();
// }

// class _newTestScreenState extends State<newTestScreen> {
//   int initial_id = 0;
//   List<Map> list1 = [];

//   int genetateId() {
//     setState(() {
//       initial_id = initial_id + 1;
//     });
//     return initial_id;
//   }

//   addNewItem(String content) {
//     int newid = genetateId();
//     list1.add({"id": newid, "content": content, "checked_sts": false});
//     print(list1);
//   }

//   on_icon_tapped(item_id) {
//     // print("icon prssed");
//     // print("this is the item id $item_id");
//     for (int i = 0; i < list1.length; i++) {
//       // print("loop running");
//       if (list1[i]["id"] == item_id) {
//         // print("first if condition (main)");
//         if (list1[i]["checked_sts"] == false) {
//           // print("set as true");
//           setState(() {
//             list1[i]["checked_sts"] = true;
//           });
//         } else if (list1[i]["checked_sts"] == true) {
//           // print("set as false");
//           setState(() {
//             list1[i]["checked_sts"] = false;
//           });
//         } else {
//           // print("this is the status 1 ${list1[i]["checked_sts"]}");
//           // print("item not found");
//         }
//       } else {
//         // print("NO MATCH FOUND");
//       }
//     }
//   }

//   slideRightBackground() {
//     return Container(
//       alignment: Alignment.centerRight,
//       // margin: EdgeInsets.fromLTRB(300, 0, 18, 20),
//       margin: EdgeInsets.only(bottom: 20),
//       decoration: BoxDecoration(color: Colors.red),
//       child: Center(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Icon(Icons.delete, color: Colors.white),
//           // SizedBox(height: 5),
//           Text(
//             "Delete",
//             style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
//           )
//         ],
//       )),
//     );
//   }

//   delete_confirmed(int item_id) {
//     setState(() {
//       list1.removeWhere((map) => map["id"] == item_id);
//     });

//     print(list1);
//     print("$item_id is the item id");
//     print("item removed");
//   }

//   @override
//   Widget build(BuildContext context) {
//     ///
//     ///
//     ///
//     ///
//     ///

//     // Map map1 = {"id": 121212, "content": "sampl content"};

//     // addNewItem("print this as content");
//     // addNewItem("print this as new content");
//     // addNewItem("brand new content");

//     // print(list1);

//     ///
//     ///
//     ///
//     ///
//     ///
//     ///

//     return Scaffold(
//       body: Stack(
//         children: [
//           SafeArea(
//               child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 ListView.builder(
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: list1.length,
//                     itemBuilder: (context, index) {
//                       return Dismissible(
//                         confirmDismiss: ((direction) async {
//                           if (direction == DismissDirection.endToStart ||
//                               direction == DismissDirection.endToStart) {
//                             showDialog(
//                                 context: context,
//                                 builder: (context) {
//                                   return AlertDialog(
//                                     content: Container(
//                                       child: Column(
//                                         children: [
//                                           Text(
//                                               "Are you sure you want to delete the task? "),
//                                           Row(
//                                             children: [
//                                               ElevatedButton(
//                                                   onPressed: () {
//                                                     Navigator.pop(context);
//                                                   },
//                                                   child: Text("No")),
//                                               ElevatedButton(
//                                                   onPressed: () {
//                                                     delete_confirmed(
//                                                         list1[index]["id"]);
//                                                     Navigator.pop(context);
//                                                   },
//                                                   child: Text("yes"))
//                                             ],
//                                           )
//                                         ],
//                                       ),
//                                     ),
//                                   );
//                                 });
//                           }
//                         }),
//                         background: slideRightBackground(),
//                         key: Key(list1[index]["id"].toString()),
//                         child: InkWell(
//                           onTap: () {
//                             print("item id ${list1[index]["id"]}is clicked");
//                           },
//                           child: Container(
//                             padding: EdgeInsets.symmetric(horizontal: 20),
//                             margin: EdgeInsets.only(bottom: 20),
//                             decoration: BoxDecoration(
//                               color: Colors.red.shade100,
//                             ),
//                             child: Row(
//                               children: [
//                                 Expanded(child: Text(list1[index]["content"])),
//                                 IconButton(
//                                     onPressed: () {
//                                       on_icon_tapped(list1[index]["id"]);
//                                     },
//                                     icon: Icon(Icons.check_box_rounded,
//                                         color:
//                                             list1[index]["checked_sts"] == false
//                                                 ? Colors.red
//                                                 : Colors.green)),
//                                 Text(list1[index]["id"].toString())
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     }),
//                 SizedBox(height: 40),
//                 ElevatedButton(
//                     onPressed: () {
//                       return on_outer_add_button_pressed(context);
//                     },
//                     child: Text("Add item"))
//               ],
//             ),
//           )),
//           // Positioned(child: Positioned_Button())
//         ],
//       ),
//     );
//   }

//   on_outer_add_button_pressed(context) async {
//     var text_to_pass = TextEditingController();
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             content: Form(
//                 child: Column(
//               children: [
//                 TextField(
//                   controller: text_to_pass,
//                   decoration: InputDecoration(hintText: "write here"),
//                 ),
//                 ElevatedButton(
//                     onPressed: () {
//                       addNewItem(text_to_pass.text);
//                       Navigator.pop(context);
//                     },
//                     child: Text("Add task"))
//               ],
//             )),
//           );
//         });
//   }
// }
