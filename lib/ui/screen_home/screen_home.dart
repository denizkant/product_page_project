import 'package:flutter/material.dart';
import 'package:products_page_project/models/models_products.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> entries = <String>[
    'All',
    'Headphone',
    'Earphone',
    'Telephone',
    'Watch',
    'Camera',
    'Drone'
  ];
  final List<Icon?> icons = [
    null,
    Icon(Icons.headphones),
    Icon(Icons.earbuds_sharp),
    Icon(Icons.phone_android),
    Icon(Icons.watch),
    Icon(Icons.camera),
    Icon(Icons.done_rounded)
  ];
  final List<Products> products = <Products>[
    Products(
        image: 'assets/images/headphone.jpeg',
        description: 'Razer BlackShark V2 Pro',
        discount: 'Free Shipping',
        prize: 29.999),
    Products(
        image: 'assets/images/watch.jpeg',
        description: 'RYison Celebrat SW2Pro',
        discount: '40% Off',
        prize: 30.999),
    Products(
        image: 'assets/images/camera.jpeg',
        description: 'Corsair Elgato Facecam',
        discount: '10% Off',
        prize: 49.9),
    Products(
        image: 'assets/images/drone.jpeg',
        description: 'A9002 4K HD Toy Drone',
        discount: 'Free Shipping',
        prize: 29.999),
    Products(
        image: 'assets/images/earphone.jpeg',
        description: 'Earphone',
        discount: 'Free Shipping',
        prize: 29.999),
    Products(
        image: 'assets/images/telephone.jpeg',
        description: 'Telephone',
        discount: '20% Off',
        prize: 29.999),
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
            _widgetProducts()
          ]),
        ),
      ),
    );
  }

  Expanded _widgetProducts() {
    return Expanded(
      child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.9
          ),
          itemBuilder: (BuildContext context, int index) {
            var item = products[index];
            return Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white, 
                  borderRadius: BorderRadius.circular(16)),
              child: Column(
                children: [
                  Image.asset(
                    '${item.image}',
                    height: 120,
                    width: 140,
                  ),
                  Text('${item.description}'),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('${item.prize}'),
                          Spacer(),
                          FittedBox(
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: item.discount.contains('Free') ?  Colors.blue.shade900 : Colors.red,
                                borderRadius: BorderRadius.circular(8)
                              ),
                              child: 
                                Text('${item.discount}',style: TextStyle(color: Colors.white),)),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
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
                  if(icons[index]!= null)...[
                  icons[index]!,
                  const SizedBox(width: 8),
                  ],
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
