import 'package:devcamp_session1/models/data.dart';
import 'package:flutter/material.dart';

import 'detailsPage.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade800,
        title: Text("Travel App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
                "https://img.freepik.com/premium-vector/travel-concept-vector-illustration-with-famous-sights-accessories_95169-98.jpg?w=1800"),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red.shade800,
                    ),
                    child: const Center(
                        child: Text(
                          "Attraction",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red.shade800,
                    ),
                    child: const Center(
                        child: Text(
                          "Places",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red.shade800,
                    ),
                    child: const Center(
                        child: Text(
                          "Hotels",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        )),
                  ),
                )
              ],
            ),
            ///ListView.builder example
            // Container(
            //   height: 80,
            //   child: ListView.builder(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: 3,
            //       itemBuilder: (BuildContext context,index){
            //       return Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Container(
            //           width: 120,
            //
            //
            //           decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(10),
            //             color: Colors.red.shade800,
            //           ),
            //           child: const Center(
            //               child: Text(
            //                 "Attraction",
            //                 style: TextStyle(fontSize: 18, color: Colors.white),
            //               )),
            //         ),
            //       );
            //       }),
            // ),
            const Padding(
              padding: EdgeInsets.only(left: 15,top: 20),
              child: Text("Popular Destination",style: TextStyle(fontSize: 20),),
            ),
            GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: datalist.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (BuildContext context,index){
              return InkWell(
                onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailsPage(city:datalist[index])));
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    color: Colors.red.shade800,
                    child: Column(
                      children: [
                        Image.network(datalist[index].cityImage.toString()),
                        Center(child: Text(datalist[index].cityName.toString(),style: TextStyle(color: Colors.white,fontSize: 20),)),
                      ],
                    ),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
