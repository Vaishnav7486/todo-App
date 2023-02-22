import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:todo1/constatnt%20styles/constant_styles.dart';
import 'package:sizer/sizer.dart';
import 'package:todo1/provider%20data/provider_data.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: primary_dark_blue,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("my tasks", style: TextStyle(fontWeight: FontWeight.w600)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
          SizedBox(width: defaultPadding_w_5 / 4)
        ],
        elevation: 0,
      ),
      body: Stack(
        children: [
          SafeArea(
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding_w_5 / 2),
              child: Consumer<ProviderData>(
                builder: (BuildContext context, value, child) {
                  return Column(
                    children: [
                      Consumer<ProviderData>(
                        builder: (BuildContext context, value, Widget? child) {
                          return ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: value.listitems.length,
                              itemBuilder: (context, index) {
                                return ListItem_Card(
                                    theItemMap: value.listitems[index]);
                              });
                        },
                      )
                    ],
                  );
                },
              ),
            ),
          )),
          Positioned_Button()
        ],
      ),
    );
  }
}

class ListItem_Card extends StatefulWidget {
  ListItem_Card({
    Key? key,
    required this.theItemMap,
  }) : super(key: key);

  // final String theItemMap;
  Map theItemMap;

  @override
  State<ListItem_Card> createState() => _ListItem_CardState();
}

class _ListItem_CardState extends State<ListItem_Card> {
  bool item_clicked = false;

  // final int item_index = item_ind;
  ProviderData object1 = ProviderData();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print("this $the item have been clicked ");
        setState(() {
          item_clicked = !item_clicked;
        });
      },
      child: AnimatedContainer(
        decoration:
            BoxDecoration(color: primary_light, borderRadius: default_br_16),
        margin: EdgeInsets.only(bottom: defaultPadding_h_5 / 4),
        duration: const Duration(milliseconds: 2200),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.theItemMap["title"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: defaultPadding_h_5 / 3),
                  Text(
                    // widget.text_content,
                    widget.theItemMap["text_content"],
                    maxLines: item_clicked == false ? 5 : 1000,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            )),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: IconButton(
                onPressed: () {
                  Provider.of<ProviderData>(context, listen: false)
                      .checkIcontapped(widget.theItemMap["item_id"]);
                },
                icon: Icon(
                  Icons.check_circle_sharp,
                  // color: icon_green_1,
                  // color: Color(0xffC1CED9),
                  color: widget.theItemMap["checked_sts"] == false
                      ? Color(0xffC1CED9)
                      : icon_green_1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future onAddTaskButtonTapped(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding:
              EdgeInsets.symmetric(horizontal: defaultPadding_w_5 / 1.5),
          insetPadding:
              EdgeInsets.symmetric(horizontal: defaultPadding_w_5 / 1.5),
          // actionsPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: default_br_16 * 2),
          content: SizedBox(
            width: 100.w,
            child: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(height: defaultPadding_h_5 / 2),
                Text(
                  "Add task",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: primary_dark_blue),
                ),
                SizedBox(height: defaultPadding_h_5 / 2),
                Custom_Textfield_Title(),
                SizedBox(height: defaultPadding_h_5 / 3),
                Custom_Textfield_contextText(),
                SizedBox(height: defaultPadding_h_5 / 1.5),
                AddTask_BarButton(),
                SizedBox(height: defaultPadding_h_5 / 1.5),
              ]),
            ),
          ),
        );
      });
}

class AddTask_BarButton extends StatelessWidget {
  const AddTask_BarButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
            style: TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class Custom_Textfield_Title extends StatelessWidget {
  const Custom_Textfield_Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: primary_dark_blue,
      maxLines: null,
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w600, color: primary_dark_blue),
      decoration: InputDecoration(
          hintText: "Title",
          hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: primary_dark_blue),
          filled: true,
          fillColor: primary_light,
          border: OutlineInputBorder(
              borderRadius: default_br_16, borderSide: BorderSide.none)),
    );
  }
}

class Custom_Textfield_contextText extends StatelessWidget {
  const Custom_Textfield_contextText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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

class Positioned_Button extends StatelessWidget {
  const Positioned_Button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 5.h,
        right: 8.w,
        child: GestureDetector(
          onTap: () {
            onAddTaskButtonTapped(context);
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
        ));
  }
}


// UNCOMMENT ALL THE THINGS