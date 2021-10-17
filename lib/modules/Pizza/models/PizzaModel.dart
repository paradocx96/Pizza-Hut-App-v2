class PizzaModel{
  late String name;
  late String range;
  late String flag;
  late String description;
  late String size;
  late String crust;
  late String topping;
  late String extras;

  PizzaModel({required this.name, required this.range, required this.flag, required this.description});

  factory PizzaModel.fromjson(Map<String, dynamic> json){
    return PizzaModel(
      name:json['name'],
      range:json['range'],
      flag:json['flag'],
      description:json['description'],
    );
  }
}