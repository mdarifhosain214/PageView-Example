import 'dart:async';

import 'package:flutter/material.dart';

import '../model/page_entry.dart';

class PageEntryWidget extends StatefulWidget {
  final PageEntry entry;
  const PageEntryWidget({Key? key, required this.entry}) : super(key: key);

  @override
  State<PageEntryWidget> createState() => _PageEntryWidgetState();
}

class _PageEntryWidgetState extends State<PageEntryWidget> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollToEnd(1000);

  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context ,OrientationBuilder){
      scrollToEnd(100);
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          controller: controller,
          children: [
            Image.asset(widget.entry.imageUrl,fit: BoxFit.cover,),
            const SizedBox(height: 8.0,),
            Text(widget.entry.title,style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold),),
            const SizedBox(height: 8.0,),
            Text(widget.entry.description,style: TextStyle(fontSize: 20,))


          ],
        ),
      );
    });

  }

  void scrollToEnd(int milliseconds){
    Timer(
        Duration(milliseconds: milliseconds),(){
      if(!controller.hasClients)return;
      controller.jumpTo(controller.position.maxScrollExtent);
    });

  }
}
