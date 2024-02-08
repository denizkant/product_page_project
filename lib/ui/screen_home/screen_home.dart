import 'package:flutter/material.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            _widgetSearchBar(),
            const Row(
              children: [
                Text('Collection',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              ],
            ),
            _widgetCollectionList(),
            const Row(
              children: [
                Text('Super ofertas',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 5,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                   ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                        child: Column(
                          children: [
                            Image.asset('assets/images/lake.jpg',height: 150,width: 150,)
                          ],
                        ),
                    );
                  }),
            )
          ]),
        ),
      ),
    );
  }

  SizedBox _widgetCollectionList() {
    return SizedBox(
      height: 60,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          width: 25,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                  border: Border.all(width: 0.4),
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: Row(
                children: [
                  icons[index],
                  const SizedBox(width: 8),
                  Text(entries[index])
                ],
              ));
        },
      ),
    );
  }

  Padding _widgetSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
            border: Border.all(width: 0.5),
            borderRadius: const BorderRadius.all(Radius.circular(15))),
        child: TextFormField(
          decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'What are you looking for?',
              suffixIcon: Icon(Icons.sentiment_very_satisfied_rounded),
              prefixIcon: Icon(Icons.search)),
        ),
      ),
    );
  }
}
