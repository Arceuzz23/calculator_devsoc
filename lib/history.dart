import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class ShowData extends StatefulWidget {
  const ShowData({super.key});

  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          'History',
          style: TextStyle(
              fontFamily: 'Lcd',
              fontSize: 40,
              color: Color.fromARGB(255, 180, 175, 175)),
        ),
        centerTitle: true,
        bottom: PreferredSize(
            child: Container(
              color: Colors.amber,
              height: 1.0,
              width: 350,
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),
      body: SafeArea(
        child: Container(
          height: 1000,
          width: 1000,
          padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
          color: Colors.black,
          child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection("calculations")
                  .doc("uid")
                  .collection("history")
                  .orderBy("createdAt", descending: false)
                  .limit(10)
                  .snapshots(),
              builder: (context, snapshot) {
                List<Container> calcWidgets = [];
                if (snapshot.hasData) {
                  final calcs = snapshot.data?.docs.reversed.toList();
                  for (var calculations in calcs!) {
                    final calcWidget = Container(
                      height: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            calculations['Calculations'],
                            style: TextStyle(
                              fontFamily: 'Trito Writter',
                              color: Colors.grey[400],
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            '=' + ' ' + calculations['Result'],
                            style: TextStyle(
                                fontFamily: 'Trito Writter',
                                color: Colors.amber,
                                fontSize: 25),
                          ),
                          // Divider(
                          //   height: 10,
                          // )
                        ],
                      ),
                    );
                    calcWidgets.add(calcWidget);
                  }
                }

                return ListView(
                  children: calcWidgets,
                );
              }),
        ),
      ),
    );
  }
}
//  if (snapshot.connectionState == ConnectionState.active) {
//               if (snapshot.hasData) {
//                 return ListView.builder(
//                   itemBuilder: (context, index) {
//                     ListTile(
//                       leading: CircleAvatar(
//                         child: Text("${index + 1}"),
//                       ),
//                       title: Text("${snapshot.data!.docs[index]["stength"]}"),
//                       subtitle: Text("${snapshot.data!.docs[index]["name"]}"),
//                     );
//                     return null;
//                   },
//                   itemCount: snapshot.data?.docs.length,
//                 );
//               } else if (snapshot.hasError) {
//                 return Center(
//                   child: Text("${snapshot.hasError.toString}"),
//                 );
//               }
//             } else {
//               return Center(
//                 child: Text('No data found'),
//               );
//             }
