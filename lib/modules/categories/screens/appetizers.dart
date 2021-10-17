import 'package:flutter/material.dart';
import 'package:pizzahut/modules/atc/screens/appetizer_food.dart';
import 'package:pizzahut/modules/categories/models/appetizer.dart';

class Appetizers extends StatefulWidget {
  const Appetizers({Key? key}) : super(key: key);

  @override
  _AppetizersState createState() => _AppetizersState();
}

class _AppetizersState extends State<Appetizers> {
  List<Appetizer> appetizers = [
    Appetizer(
        name: 'Wing It - BBQ',
        startPrice: 'Starting from Rs.490.00',
        size: ['6Pcs', '12Pcs', '24Pcs'],
        price: [490, 940, 1750],
        description:
            'Succulent chicken wings tossed in our famous BBQ sauce & baked to perfection.',
        type: 'advanced',
        flag: 'appetizerImage1.jpg'),
    Appetizer(
        name: 'Wing It - Garlic Parmesan',
        startPrice: 'Starting from Rs.490.00',
        size: ['6Pcs', '12Pcs', '24Pcs'],
        price: [490, 940, 1750],
        description:
            'Succulent chicken wings tossed in our creamy Garlic Parmesan sauce & baked to perfection.',
        type: 'advanced',
        flag: 'appetizerImage2.jpg'),
    Appetizer(
        name: 'Wing It - Peri Peri',
        startPrice: 'Starting from Rs.490.00',
        size: ['6Pcs', '12Pcs', '24Pcs'],
        price: [490, 940, 1750],
        description:
            'Succulent chicken wings tossed in our flavourful Peri Peri sauce & baked to perfection.',
        type: 'advanced',
        flag: 'appetizerImage3.jpg'),
    Appetizer(
        name: 'Wing It - Sriracha',
        startPrice: 'Starting from Rs.490.00',
        size: ['6Pcs', '12Pcs', '24Pcs'],
        price: [490, 940, 1750],
        description:
            'Succulent chicken wings tossed in our spicy Sriracha sauce & baked to perfection.',
        type: 'advanced',
        flag: 'appetizerImage4.jpg'),
    Appetizer(
        name: 'Garlic Bread',
        startPrice: 'Rs.300.00',
        size: [''],
        price: [300],
        description:
            'Sliced & spread with garlic buttery goodness.',
        type: 'normal',
        flag: 'appetizerImage5.jpg'),
    Appetizer(
        name: 'Cheesy Garlic Bread Supreme',
        startPrice: 'Rs.480.00',
        size: [''],
        price: [480],
        description:
            'Layered with garlic butter & mozzarella cheese.',
        type: 'normal',
        flag: 'appetizerImage6.jpg'),
    Appetizer(
        name: 'Potato Wedges',
        startPrice: 'Rs.440.00',
        size: [''],
        price: [440],
        description:
            'Our delicious wedges are soft on the inside, crunchy on the outside and is the perfect snack to take delight in.',
        type: 'normal',
        flag: 'appetizerImage7.jpg'),
    Appetizer(
        name: 'Spicy Chicken & Cheese Balls',
        startPrice: 'Rs.440.00',
        size: [''],
        price: [440],
        description:
            'Chicken and cheese are two things that go so well together, and with this delectable appetizer.',
        type: 'normal',
        flag: 'appetizerImage8.jpg'),
    Appetizer(
        name: 'Baked Chicken Wings in  BBQ Sauce',
        startPrice: 'Rs.490.00',
        size: [''],
        price: [490],
        description:
            'Everyone’s favourite wings, baked just the right amount and given the tangy flavor of BBQ sauce to tantalize your taste-buds.',
        type: 'normal',
        flag: 'appetizerImage9.jpg'),
    Appetizer(
        name: 'Chicken Sausage Roll',
        startPrice: 'Rs.190.00',
        size: [''],
        price: [190],
        description:
            'Chicken sausage roll 1pc.',
        type: 'normal',
        flag: 'appetizerImage10.jpg')
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
              /*Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
              ),*/
              Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Text('APPETIZERS',
                  style: TextStyle(height: 1.5, fontSize: 20),
                ),
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height - 210,
                  child: ListView.builder(
                      itemCount: appetizers.length,
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
                                        builder: (_) => AppetizerFood(
                                            name: appetizers[index].name,
                                            size: appetizers[index].size,
                                            price: appetizers[index].price,
                                            description: appetizers[index].description,
                                            type: appetizers[index].type,
                                            flag: appetizers[index].flag)));
                              },
                              title: Text(appetizers[index].name),
                              subtitle: Text(appetizers[index].startPrice),
                              leading: Image(
                                image: AssetImage(
                                    'assets/images/appetizers/${appetizers[index].flag}'),
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
