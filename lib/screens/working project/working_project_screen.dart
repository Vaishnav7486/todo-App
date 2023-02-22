import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo1/constatnt%20styles/constant_styles.dart';
import 'package:todo1/screens/task_list_screen.dart';
import 'package:sizer/sizer.dart';

class WorkingProjectScreen extends StatefulWidget {
  const WorkingProjectScreen({super.key});

  @override
  State<WorkingProjectScreen> createState() => _WorkingProjectScreenState();
}

class _WorkingProjectScreenState extends State<WorkingProjectScreen> {
  int initial_id = 0;
  List<Map> list1 = [];

  int genetateId() {
    setState(() {
      initial_id = initial_id + 1;
    });
    return initial_id;
  }

  addNewItem(String title, String content) {
    int newid = genetateId();
    list1.add({
      "id": newid,
      "title": title,
      "content": content,
      "checked_sts": false
    });
    // print(list1);
  }

  on_icon_tapped(item_id) {
    // print("icon prssed");
    // print("this is the item id $item_id");
    for (int i = 0; i < list1.length; i++) {
      // print("loop running");
      if (list1[i]["id"] == item_id) {
        // print("first if condition (main)");
        if (list1[i]["checked_sts"] == false) {
          // print("set as true");
          setState(() {
            list1[i]["checked_sts"] = true;
          });
        } else if (list1[i]["checked_sts"] == true) {
          // print("set as false");
          setState(() {
            list1[i]["checked_sts"] = false;
          });
        } else {
          // print("this is the status 1 ${list1[i]["checked_sts"]}");
          // print("item not found");
        }
      } else {
        // print("NO MATCH FOUND");
      }
    }
  }

  slideRightBackground() {
    return Container(
      alignment: Alignment.centerRight,
      // margin: EdgeInsets.fromLTRB(300, 0, 18, 20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: default_br_16,
        color: Colors.red,
      ),
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.delete, color: Colors.white),
          // SizedBox(height: 5),
          Text(
            "Delete",
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
          )
        ],
      )),
    );
  }

  delete_confirmed(int item_id) {
    setState(() {
      list1.removeWhere((map) => map["id"] == item_id);
    });

    print(list1);
    print("$item_id is the item id");
    print("item removed");
  }

  bool item_clicked = false;

  @override
  Widget build(BuildContext context) {
    ///
    ///
    ///
    ///
    ///

    // Map map1 = {"id": 121212, "content": "sampl content"};

    // addNewItem("print this as content");
    // addNewItem("print this as new content");
    // addNewItem("brand new content");

    // print(list1);

    ///
    ///
    ///
    ///
    ///
    ///

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            foregroundColor: primary_dark_blue,
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: Text("My tasks"),
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding_w_5 / 4),
            child: Column(
              children: [
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: list1.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        confirmDismiss: ((direction) async {
                          if (direction == DismissDirection.endToStart ||
                              direction == DismissDirection.endToStart) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: defaultPadding_w_5 / 1.5),
                                    insetPadding: EdgeInsets.symmetric(
                                        horizontal: defaultPadding_w_5 / 1.5),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: default_br_16 * 2),
                                    content: SizedBox(
                                      width: 100.w,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                              height: defaultPadding_h_5 / 2),
                                          Text(
                                            "Are you sure you want to delete the task? ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: primary_dark_blue),
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(
                                              height: defaultPadding_h_5 / 2),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GestureDetector(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            primary_dark_blue,
                                                        borderRadius:
                                                            default_br_16 /
                                                                1.2),
                                                    child: Center(
                                                      child: Text(
                                                        "NO",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                                  )),
                                              GestureDetector(
                                                  onTap: () {
                                                    delete_confirmed(
                                                        list1[index]["id"]);
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    width: 80,
                                                    decoration: BoxDecoration(
                                                        color: icon_green_1,
                                                        borderRadius:
                                                            default_br_16 /
                                                                1.2),
                                                    child: Center(
                                                      child: Text(
                                                        "YES",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          SizedBox(
                                              height: defaultPadding_h_5 / 2),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          }
                        }),
                        background: slideRightBackground(),
                        key: Key(list1[index]["id"].toString()),
                        child: InkWell(
                          focusColor: Colors.white,
                          hoverColor: Colors.white,
                          onTap: () {
                            setState(() {
                              item_clicked = !item_clicked;
                            });
                          },
                          child: Container(
                            margin:
                                EdgeInsets.only(bottom: defaultPadding_h_5 / 4),
                            decoration: BoxDecoration(
                                color: primary_light,
                                borderRadius: default_br_16),
                            child: Row(
                              children: [
                                Expanded(
                                    child: Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      defaultPadding_w_5 / 2,
                                      defaultPadding_w_5 / 2,
                                      defaultPadding_w_5 * 0,
                                      defaultPadding_w_5 / 2),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(list1[index]["title"],
                                          // maxLines: 1,
                                          // overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              decoration: list1[index]
                                                          ["checked_sts"] ==
                                                      false
                                                  ? null
                                                  : TextDecoration.lineThrough,
                                              decorationColor: Colors.red,
                                              fontWeight: FontWeight.w700)),
                                      SizedBox(height: defaultPadding_h_5 / 3),
                                      Text(list1[index]["content"],

                                          //  remove the maxlines thing whenever wanted, but make it in corresoindant to the item id,
                                          // now while clicking all the containers are expanding all the containers are expanding at the same time
                                          // which is not good thing - to know how this works, run the code

                                          // maxLines:
                                          //     item_clicked == false ? 5 : 1000,
                                          // overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 14,
                                              decoration: list1[index]
                                                          ["checked_sts"] ==
                                                      false
                                                  ? null
                                                  : TextDecoration.lineThrough,
                                              decorationColor: Colors.red)),
                                    ],
                                  ),
                                )),
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: IconButton(
                                      onPressed: () {
                                        on_icon_tapped(list1[index]["id"]);
                                      },
                                      icon: Icon(Icons.check_circle_sharp,
                                          color: list1[index]["checked_sts"] ==
                                                  false
                                              ? Color(0xffC1CED9)
                                              : icon_green_1)),
                                ),
                                // Text(list1[index]["id"].toString(),)
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                SizedBox(height: 40),
                // ElevatedButton(
                //     onPressed: () {
                //       return on_outer_add_button_pressed(context);
                //     },
                //     child: Text("Add item"))
              ],
            ),
          )),
        ),
        Positioned(
            bottom: 5.h,
            right: 8.w,
            child: GestureDetector(
              onTap: () {
                return on_outer_add_button_pressed(context);
              },
              child: Container(
                height: 7.h,
                width: 7.h,
                decoration: BoxDecoration(
                  borderRadius: default_br_16,
                  color: icon_green_1,
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ))
      ],
    );
  }

  on_outer_add_button_pressed(context) async {
    var text_to_pass = TextEditingController();
    var title_to_pass = TextEditingController();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding:
                EdgeInsets.symmetric(horizontal: defaultPadding_w_5 / 1.5),
            insetPadding:
                EdgeInsets.symmetric(horizontal: defaultPadding_w_5 / 1.5),
            shape: RoundedRectangleBorder(borderRadius: default_br_16 * 2),
            content: SizedBox(
              width: 100.w,
              child: Form(
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: defaultPadding_h_5 / 2),
                    Text(
                      "Add task",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: primary_dark_blue),
                    ),
                    SizedBox(height: defaultPadding_h_5 / 2),
                    custom_text_field_W2(title_to_pass: title_to_pass),
                    SizedBox(height: defaultPadding_h_5 / 3),
                    custom_textfield_title_W2(text_to_pass: text_to_pass),
                    SizedBox(height: defaultPadding_h_5 / 1.5),
                    // ElevatedButton(
                    //     onPressed: () {
                    //       addNewItem(title_to_pass.text, text_to_pass.text);
                    //       Navigator.pop(context);
                    //     },
                    //     child: Text("Add task"))
                    GestureDetector(
                      onTap: () {
                        addNewItem(title_to_pass.text, text_to_pass.text);
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: default_br_16,
                          color: primary_dark_blue,
                        ),
                        child: Center(
                          child: Text(
                            "Add",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: defaultPadding_h_5 / 1.5),
                  ],
                ),
              )),
            ),
          );
        });
  }
}

class custom_textfield_title_W2 extends StatelessWidget {
  const custom_textfield_title_W2({
    Key? key,
    required this.text_to_pass,
  }) : super(key: key);

  final TextEditingController text_to_pass;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: text_to_pass,
      cursorColor: primary_dark_blue,
      maxLines: null,
      style: TextStyle(fontSize: 16, color: primary_dark_blue),
      decoration: InputDecoration(
          hintText: "content",
          hintStyle: TextStyle(fontSize: 16, color: primary_dark_blue),
          filled: true,
          fillColor: primary_light,
          border: OutlineInputBorder(
              borderRadius: default_br_16, borderSide: BorderSide.none)),
    );
  }
}

class custom_text_field_W2 extends StatelessWidget {
  const custom_text_field_W2({
    Key? key,
    required this.title_to_pass,
  }) : super(key: key);

  final TextEditingController title_to_pass;

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: title_to_pass,
        cursorColor: primary_dark_blue,
        maxLines: null,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: primary_dark_blue),
        decoration: InputDecoration(
            hintText: "Title",
            hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: primary_dark_blue),
            filled: true,
            fillColor: primary_light,
            border: OutlineInputBorder(
                borderRadius: default_br_16, borderSide: BorderSide.none)));
  }
}
