import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> entries = <String>[
    'Headphone',
    'Earphone',
    'Telephone',
    'Watch',
    'Camera',
    'Drone'
  ];
  final List<Icon> icons = <Icon>[
    Icon(Icons.headphones),
    Icon(Icons.earbuds_sharp),
    Icon(Icons.phone_android),
    Icon(Icons.watch),
    Icon(Icons.camera),
    Icon(Icons.done_rounded)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: 375,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(width: 0.3),
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: 'What are you looking for?',
                  suffixIcon: Icon(Icons.sentiment_very_satisfied_rounded),
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
        ),
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text('Collection',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        Expanded(
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(8),
            itemCount: entries.length,
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              width: 25,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                decoration: BoxDecoration(border: Border.all(width: 0.3),borderRadius: BorderRadius.all(Radius.circular(8))),
                width: 100,
                height: 100,
                child: ListTile(
                  leading: icons[index],
                  title: Text(entries[index],style: TextStyle(fontSize: 10),),
                ),
              );
            },
          ),
        ),
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text('Superofertas',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        SizedBox(height: 600,)
      ]),
    );
  }
}
