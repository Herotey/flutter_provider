import 'package:development/details.dart';
import 'package:development/drawer.dart';
import 'package:development/list_screen.dart';
import 'package:development/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<IconProvider>(
    child: const MyApp(),
    create: (context) => IconProvider(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Provider State Management'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
// class item 
class Icones {
  String? title;
  String? subtitle;
  Icones({this.title = "", this.subtitle = ""});
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var icons = context.watch<IconProvider>().icons;
    var mylist = context.watch<IconProvider>().mylist;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    // Route screen diplay favorite item
                    MaterialPageRoute(builder: (context) => const ListScreen()));
              },
              icon: const Icon(
                Icons.favorite,
                size: 30,
                color: Colors.red,
              ))
        ],
      ),
      drawer: const DrawerApp(),
      body: Center(
          child: ListView.builder(
        itemCount: icons.length,
        itemBuilder: (context, index) {
          final currentIcon = icons[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.home),
              title: Text(currentIcon.title.toString()),
              subtitle: Text(currentIcon.subtitle.toString()),
              trailing: IconButton(
                  onPressed: () {
                    // condition for add and remove item form list favorite
                    if (!mylist.contains(currentIcon)) {
                      context.read<IconProvider>().addToList(currentIcon);
                    } else {
                      context.read<IconProvider>().removeFromList(currentIcon);
                    }
                  },
                  icon: Icon(
                    // condition for iconbutton favorite 
                    mylist.contains(currentIcon)
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: mylist.contains(currentIcon)
                        ? Colors.red
                        : Colors.black,
                    size: 30,
                  )),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailPage(
                              title: icons[index].title.toString(),
                              subtitle: icons[index].subtitle.toString(),
                            )));
              },
            ),
          );
        },
      )),
    );
  }
}
