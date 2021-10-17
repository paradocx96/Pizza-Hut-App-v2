import 'package:flutter/material.dart';
import 'package:pizzahut/modules/promos/models/promo.dart';
import 'package:pizzahut/modules/promos/screens/promo_single.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Promo> promos = [
    Promo(
      name: 'Triple Treat Box',
      price: 3200,
      description:
          '2 Medium Pan Pizzas\n2 Appetizers\n2 Portions of Cinnamon Rolls',
      flag: 'assets/images/promos/Image1.jpg',
      type: '1',
    ),
    Promo(
      name: 'My Box Lite',
      price: 920,
      description:
          '1 Personal Pan Pizza(Classic)\n1/2 portion of an Appetizer\n1 Sweet Treat\n1 Pet Coke (400ml)',
      flag: 'assets/images/promos/Image2.jpg',
      type: '2',
    ),
    Promo(
      name: 'My Box Pro',
      price: 1030,
      description:
          '1 Personal Pan Pizza(Classic Signature)\n1/2 portion of an Appetizer\n1 Sweet Treat or Lava Cake\n1 Pet Coke (400ml)',
      flag: 'assets/images/promos/Image3.jpg',
      type: '3',
    ),
    Promo(
      name: 'Exclusive Cyber Saving Offer 1',
      price: 3500,
      description: '1 Signature Large Pan Pizza\n1 Classic Large Pan Pizza',
      flag: 'assets/images/promos/Image5.jpg',
      type: '4',
    ),
    Promo(
      name: 'Exclusive Cyber Saving Offer 2',
      price: 1780,
      description: '2 Class Medium Pan Pizza',
      flag: 'assets/images/promos/Image4.jpg',
      type: '5',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(color: Color(0xFFF4EFEF)),
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Container(
                height: 225,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  image: AssetImage('assets/images/home/PizzaHutLogoHome.png'),
                ),
              ),
              Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Text(
                  'MOST POPULAR DEALS',
                  style: TextStyle(height: 1.5, fontSize: 20),
                ),
              ),
              //expanded widget added to fix Galaxy A50S bottom overflow problem
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height - 408,
                  child: ListView.builder(
                      itemCount: promos.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 1.0, horizontal: 5.0),
                          child: Card(
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => PromoSingle(
                                              name: promos[index].name,
                                              price: promos[index].price,
                                              description: promos[index].description,
                                              flag: promos[index].flag,
                                              type: promos[index].type,
                                            )));
                              },
                              title: Text(
                                  '${promos[index].name}\nRs.${promos[index].price}.00'),
                              subtitle: Text(promos[index].description),
                              leading: Image(
                                image: AssetImage(promos[index].flag),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
