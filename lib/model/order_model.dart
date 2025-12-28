class OrderModel {
  final String id;
  final String username;
  final String category;
  final String processname;
  final String processDiscription;
  final String price;
  final String long;
  final String lat;
  final String image;
  final String paymethod;
  final String phone;


  OrderModel({
    required this.phone,
    required this.id,
    required this.username,
    required this.category,
    required this.processname,
    required this.processDiscription,
    required this.price,
    required this.long,
    required this.lat,
    required this.image,
    required this.paymethod,
  });

  factory OrderModel.fromjson(jsonData) {
    return OrderModel(
      phone: jsonData['phone'],
      id: jsonData['id'],
      username: jsonData['username'],
      category: jsonData['category'],
      processname: jsonData['processname'],
      processDiscription: jsonData['processDiscription'],
      price: jsonData['price'],
      long: jsonData['long'],
      lat: jsonData['lat'],
      image:jsonData ['image'],
      paymethod:jsonData ['paymethod'],
    );
  }
}
