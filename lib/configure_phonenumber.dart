import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

class PhoneNumberConfigureScreen extends StatefulWidget {
  final String phoneNumber;
  final bool isDefaultCallerId;
  final Map<String, Color> tags;
  final List<Color> colors;

  const PhoneNumberConfigureScreen({
    required this.phoneNumber,
    required this.isDefaultCallerId,
    required this.tags,
    required this.colors,
    super.key,
  });

  @override
  State<PhoneNumberConfigureScreen> createState() =>
      _PhoneNumberConfigureScreenState();
}

class _PhoneNumberConfigureScreenState
    extends State<PhoneNumberConfigureScreen> {
  bool? isStillDefault;
  String? isTag;
  Color? isColor;

  Widget cservice(String text, Icon ic) {
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[200],
        ),
        child: Wrap(children: [
          ic,
          Text(text),
        ]));
  }

  Widget getcardservices(BuildContext context) {
    return ResponsiveGridList(
      horizontalGridSpacing: 16, // Horizontal space between grid items
      verticalGridSpacing: 16, // Vertical space between grid items
      horizontalGridMargin: 20, // Horizontal space around the grid
      verticalGridMargin: 0, // Vertical space around the grid
      minItemWidth:
          140, // The minimum item width (can be smaller, if the layout constraints are smaller)
      minItemsPerRow: 1,
      // The minimum items to show in a single row. Takes precedence over minItemWidth
      maxItemsPerRow:
          5, // The maximum items to show in a single row. Can be useful on large screens
      listViewBuilderOptions: ListViewBuilderOptions(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
      ), // Options that are getting passed to the ListView.builder() function
      children: [
        //tags.map((t) => tag(t)).toList(),
        cservice("Call recording", Icon(Icons.fiber_manual_record)),
        cservice(
            "Incoming Call",
            Icon(
              Icons.phone_callback,
            )),
        cservice(
            "Outgoing call",
            Icon(
              Icons.call_made,
            )),
      ], // The list of widgets in the list
    );
  }

  Widget _getCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 15.0),
      margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const ListTile(
            leading: FlutterLogo(),
            title: Text(
              "+1 111 111 1111",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text("India"),
          ),
          Container(
            color: Colors.grey,
            child: const ListTile(
              title: Text(
                "+1 111 111 1111",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text("India"),
              trailing: FlutterLogo(),
            ),
          ),
          ListTile(
            title: const Text(
              "Services",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Container(
                margin: EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 0),
                child: Row(
                  children: [
                    Expanded(
                      child: getcardservices(context),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget tag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        // horizontal: 5,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[850],
      ),
      child: TextButton(
          onPressed: () {
            setState(() {
              isColor = widget.tags[text];
            });
          },
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
            ),
          )),
    );
  }

  Widget col(Color clr) {
    return Container(
        margin: EdgeInsets.only(top: 10, left: 0, right: 0, bottom: 0),
        child: TextButton(
            onPressed: () {
              setState(() {
                isColor = clr;
              });
            },
            child: CircleAvatar(
              child: isColor == clr ? Icon(Icons.check_outlined) : null,
              backgroundColor: clr,
            )));
  }

  Widget getTags(BuildContext context) {
    return ResponsiveGridList(
      horizontalGridSpacing: 8, // Horizontal space between grid items
      verticalGridSpacing: 16, // Vertical space between grid items
      horizontalGridMargin: 5, // Horizontal space around the grid
      verticalGridMargin: 10, // Vertical space around the grid
      minItemWidth:
          100, // The minimum item width (can be smaller, if the layout constraints are smaller)
      minItemsPerRow: 1,
      // The minimum items to show in a single row. Takes precedence over minItemWidth
      maxItemsPerRow:
          5, // The maximum items to show in a single row. Can be useful on large screens
      listViewBuilderOptions: ListViewBuilderOptions(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
      ), // Options that are getting passed to the ListView.builder() function
      children: [
        //tags.map((t) => tag(t)).toList(),
        tag("Personal"),
        tag("family"),
        tag("stranger"),
        tag("Transaction and otp"),
        tag("Add new+")
      ], // The list of widgets in the list
    );
    // return Container(
    //   child: ListTile(
    //       title: Padding(
    //           padding: const EdgeInsets.only(bottom: 15.0),
    //           child: Text(
    //             "Tag",
    //             style: TextStyle(
    //               fontWeight: FontWeight.bold,
    //               color: Colors.white,
    //             ),
    //           )),
    //       subtitle: Flexible(
    //         child: Row(children: [
    //           Flexible(
    //               flex: 24,
    //               child: Container(
    //                 padding: const EdgeInsets.symmetric(
    //                   horizontal: 10,
    //                   vertical: 5,
    //                 ),
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(10),
    //                   color: Colors.red,
    //                 ),
    //                 child: Text("Bussiness & work"),
    //               )),
    //           SizedBox(width: 5),
    //           Flexible(
    //               flex: 12,
    //               child: Container(
    //                 padding: const EdgeInsets.symmetric(
    //                   horizontal: 10,
    //                   vertical: 5,
    //                 ),
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(10),
    //                     color: Colors.red),
    //                 child: Text("Personal"),
    //               )),
    //           SizedBox(width: 5),
    //           Flexible(
    //               flex: 12,
    //               child: Container(
    //                 padding: const EdgeInsets.symmetric(
    //                   horizontal: 10,
    //                   vertical: 5,
    //                 ),
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(10),
    //                     color: Colors.red),
    //                 child: Text("family"),
    //               )),
    //           SizedBox(width: 5),
    //           Flexible(
    //               flex: 12,
    //               child: Container(
    //                 padding: const EdgeInsets.symmetric(
    //                   horizontal: 10,
    //                   vertical: 5,
    //                 ),
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(10),
    //                     color: Colors.red),
    //                 child: Text("Stranger"),
    //               )),
    //           SizedBox(width: 5),
    //           Flexible(
    //               flex: 12,
    //               child: Container(
    //                 padding: const EdgeInsets.symmetric(
    //                   horizontal: 10,
    //                   vertical: 5,
    //                 ),
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(10),
    //                     color: Colors.red),
    //                 child: Text("Transaction and otp"),
    //               )),
    //           SizedBox(width: 5),
    //           Flexible(
    //               flex: 12,
    //               child: Container(
    //                 padding: const EdgeInsets.symmetric(
    //                   horizontal: 10,
    //                   vertical: 5,
    //                 ),
    //                 decoration: BoxDecoration(
    //                     borderRadius: BorderRadius.circular(10),
    //                     color: Colors.red),
    //                 child: Text("+Add New"),
    //               ))
    //         ]),
    //       )),
    // );
  }

  Widget gt(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 10, bottom: 0, left: 10),
      child: ListTile(
          title: Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Text(
                "Tag",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
          subtitle: Container(child: getTags(context))),
    );
  }

  Widget getColor(BuildContext context) {
    return ResponsiveGridList(
      horizontalGridSpacing: 16, // Horizontal space between grid items
      verticalGridSpacing: 16, // Vertical space between grid items
      horizontalGridMargin: 20, // Horizontal space around the grid
      verticalGridMargin: 20, // Vertical space around the grid
      minItemWidth:
          80, // The minimum item width (can be smaller, if the layout constraints are smaller)
      minItemsPerRow:
          1, // The minimum items to show in a single row. Takes precedence over minItemWidth
      maxItemsPerRow:
          10, // The maximum items to show in a single row. Can be useful on large screens
      listViewBuilderOptions: ListViewBuilderOptions(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
      ), // Options that are getting passed to the ListView.builder() function
      children: ([
        col(Color(0xffb74093)),
        col(Color(0xFFFFFFFF)),
        col(Color(0xFFFFFFFF)),
        col(Color(0xFFFFFFFF)),
        col(Color(0xFFFFFFFF)),
        col(Color(0xFFF44336)),
        col(Color.fromARGB(255, 186, 39, 29)),
        col(Color.fromARGB(255, 90, 10, 4)),
        col(Color.fromARGB(255, 117, 51, 129)),
        col(Color.fromARGB(255, 194, 178, 184)),
        col(Color.fromARGB(255, 188, 156, 17)),
        col(Color.fromARGB(255, 12, 152, 150)),
        col(Color.fromARGB(255, 54, 235, 244)),
        col(Color.fromARGB(255, 40, 16, 162)),
        col(Color.fromARGB(255, 227, 44, 15)),
      ]), // The list of widgets in the list
    );
  }

  Widget gc(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 0),
      child: ListTile(
          title: Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Text(
                "Color",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              )),
          subtitle: Container(child: getColor(context))),
    );
  }

  Widget getButton(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () {
              setState(() {
                isStillDefault = !isStillDefault!;
              });
            },
            child: const Text("Make/Unmake default caller ID",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                )))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print('i m building');
    isStillDefault = widget.isDefaultCallerId;

    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        color: Colors.black,
        child: Column(
          children: [
            _getCard(context),
            gt(context),
            gc(context),
            getButton(context),
          ],
        ),
      )),
    );
  }
}
