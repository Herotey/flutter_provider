import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String title;
  final String subtitle;
   const DetailPage({super.key, required this.title, required this.subtitle});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Detail Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topCenter,
            height: 100,
            width: double.infinity,
            child:  Icon(
              Icons.home,
              size: 100,
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            child: Text(
              widget.title.toString(),
              style:const TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
