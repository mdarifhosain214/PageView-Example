import 'package:flutter/material.dart';
import 'package:pageview/widgets/page_circle_indicator.dart';
import 'package:pageview/widgets/page_entry_widget.dart';

import 'data/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:const MainPage()
    );
  }
}
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ValueNotifier currentPageNotifier =ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('PageView',style: TextStyle(fontSize: 24),),
      ),
      body: Stack(
        children: [
          PageView.builder(
            itemCount: pages.length,
              itemBuilder: (context,index){
            return PageEntryWidget(entry: pages[index],);
          }),
          // PageCircleIndicators(
          //     currentPageNotifier: currentPageNotifier,
          //     itemCount: pages.length)
        ],
      ),
    );
  }
}


