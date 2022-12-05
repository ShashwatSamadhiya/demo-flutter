import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.yellow,
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  Widget cservice(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Text(text),
    );
  }

  Widget getcardservices(BuildContext context) {
    return ResponsiveGridList(
      horizontalGridSpacing: 16, // Horizontal space between grid items
      verticalGridSpacing: 16, // Vertical space between grid items
      horizontalGridMargin: 20, // Horizontal space around the grid
      verticalGridMargin: 20, // Vertical space around the grid
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
        cservice("Call recording"),
        cservice("Incoming Call"),
        cservice("Outgoing call"),
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
                child: Row(
              children: [
                Expanded(
                  child: getcardservices(context),
                )

                // Container(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 10,
                //     vertical: 5,
                //   ),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: Colors.grey[200],
                //   ),
                //   child: Text("Call Recording"),
                // ),
                // SizedBox(width: 5),
                // Container(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 10,
                //     vertical: 5,
                //   ),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: Colors.grey[200],
                //   ),
                //   child: Text("Call Recording"),
                // ),
                // SizedBox(width: 5),
                // Container(
                //   padding: const EdgeInsets.symmetric(
                //     horizontal: 10,
                //     vertical: 5,
                //   ),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(10),
                //     color: Colors.grey[200],
                //   ),
                //   child: Text("Call Recording"),
                // ),
                // SizedBox(width: 5),
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
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget col(Color clr) {
    return Container(
        child: CircleAvatar(
      backgroundColor: clr,
    ));
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
        tag("Transaction and otp")
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
      margin: EdgeInsets.only(top: 10, right: 20, bottom: 0),
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
      ], // The list of widgets in the list
    );
    // return Container(
    //   child: ListTile(
    //     title: Padding(
    //         padding: const EdgeInsets.only(bottom: 15.0),
    //         child: Text(
    //           "Color",
    //           style: TextStyle(
    //             fontWeight: FontWeight.bold,
    //             color: Colors.white,
    //           ),
    //         )),
    //     subtitle: Row(children: [
    //       Flexible(
    //           child: CircleAvatar(
    //         backgroundColor: Colors.blue,
    //       )),
    //       SizedBox(width: 8),
    //       Flexible(
    //           child: CircleAvatar(
    //         backgroundColor: Colors.white,
    //       )),
    //       SizedBox(width: 8),
    //       Flexible(
    //           child: CircleAvatar(
    //         backgroundColor: Colors.green,
    //       )),
    //       SizedBox(width: 8),
    //       Flexible(
    //           child: CircleAvatar(
    //         backgroundColor: Colors.red,
    //       )),
    //       SizedBox(width: 8),
    //       Flexible(
    //           child: CircleAvatar(
    //         backgroundColor: Colors.orange,
    //       )),
    //       SizedBox(width: 8),
    //       Flexible(
    //           child: CircleAvatar(
    //         backgroundColor: Colors.grey,
    //       ))
    //     ]),
    //   ),
    // );
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
    // return Container(
    //     width: MediaQuery.of(context).size.width,
    //     padding: const EdgeInsets.only(top: 15.0),
    //     decoration: BoxDecoration(color: Colors.red),
    //     child: Container(
    //         child: Text(
    //       "Tag",
    //       style: TextStyle(
    //         fontWeight: FontWeight.bold,
    //         color: Colors.white,
    //       ),
    //     )));
    return ListView(shrinkWrap: true, children: [
      Text("confirm",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        color: Colors.black,
        child: Column(
          children: [
            _getCard(context),
            gt(context),
            gc(context),
            //getButton(context),
          ],
        ),
      )),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: ListView.separated(
  //       itemCount: 4,
  //       separatorBuilder: (context, index) => const SizedBox(
  //         height: 1,
  //       ),
  //       itemBuilder: (context, index) {
  //         print(index);
  //         if(index==0)
  //         return Container(
  //           color: Colors.grey.withOpacity(0.3),
  //           height: 100 * (index + 1),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //               Card(
  //                 elevation: 5,
  //                 child: Text(
  //                   index.toString(),
  //                   style: const TextStyle(fontSize: 20),
  //                 ),
  //               ),
  //               Card(
  //                 elevation: 5,
  //                 child: Text(index.toString()),
  //               ),
  //               Card(
  //                 elevation: 5,
  //                 child: Text(index.toString()),
  //               ),
  //             ],
  //           ),
  //         );
  //         // return ListTile(
  //         //   title: Text(index.toString()),
  //         //   tileColor: Colors.grey.withOpacity(0.3),
  //         // );
  //       },
  //     ),
  //   ),
  //   else return
  // }

}

// class MyHome extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.separated(
//         itemCount: 4,
//         separatorBuilder: (context, index) => const SizedBox(
//           height: 1,
//         ),
//         itemBuilder: (context, index) {
//           print(index);
//           return Container(
//             color: Colors.grey.withOpacity(0.3),
//             height: 100 * (index + 1),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 Card(
//                   elevation: 5,
//                   child: Text(
//                     index.toString(),
//                     style: const TextStyle(fontSize: 20),
//                   ),
//                 ),
//                 Card(
//                   elevation: 5,
//                   child: Text(index.toString()),
//                 ),
//                 Card(
//                   elevation: 5,
//                   child: Text(index.toString()),
//                 ),
//               ],
//             ),
//           );
//           // return ListTile(
//           //   title: Text(index.toString()),
//           //   tileColor: Colors.grey.withOpacity(0.3),
//           // );
//         },
//       ),
//     );
//   }

// }
