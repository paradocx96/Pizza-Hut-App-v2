import 'package:flutter/material.dart';
import 'package:pizzahut/modules/atc/screens/normal_food.dart';
import 'package:pizzahut/modules/categories/models/pasta.dart';

class Pastas extends StatefulWidget {
  const Pastas({Key? key}) : super(key: key);

  @override
  _PastasState createState() => _PastasState();
}

class _PastasState extends State<Pastas> {
  List<Pasta> pastas = [
    Pasta(
        name: 'Spaghetti Bolognaise - Chicken',
        price: 770,
        description:
            'The famed Italian spaghetti with minced chicken complemented by delicious mozzarella cheese baked to perfection, served with 2 slices of garlic bread.',
        flag: 'assets/images/pastas/Image1.jpg'),
    Pasta(
        name: 'Spaghetti with Chicken & Sausage Meat',
        price: 770,
        description:
            'Spaghetti with a tandoori chicken and kotchchi chicken sausage meat along with a spicy Italian sauce and mozzarella cheese, with 2 slices of garlic bread.',
        flag: 'assets/images/pastas/Image2.jpg'),
    Pasta(
        name: 'Macaroni & Cheese',
        price: 880,
        description:
            'Macaroni elbow pasta mixed with cheese sauce, accompanied by grilled onions and layered with mozzarella cheese, served with 2 slices of garlic bread.',
        flag: 'assets/images/pastas/Image3.jpg'),
    Pasta(
        name: 'Chicken Lasagna',
        price: 880,
        description:
            'A true classic with layers of pasta chicken slathered with cheese sauce and mozzarella cheese, served with 2 slices of garlic bread.',
        flag: 'assets/images/pastas/Image4.jpg'),
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
                child: Text(
                  'PASTAS',
                  style: TextStyle(height: 1.5, fontSize: 20),
                ),
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height - 210,
                  child: ListView.builder(
                      itemCount: pastas.length,
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
                                        builder: (_) => NormalFood(
                                            name: pastas[index].name,
                                            price: pastas[index].price,
                                            description:
                                                pastas[index].description,
                                            flag: pastas[index].flag)));
                              },
                              title: Text(pastas[index].name),
                              subtitle: Text(
                                  'Rs.' + pastas[index].price.toString() + '.00'),
                              leading: Image(
                                image: AssetImage(pastas[index].flag),
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
