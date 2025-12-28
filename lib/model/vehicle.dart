import 'package:flutter/material.dart';

class Vehicle {
  final String? name;
  final String? url;
  final String? description;
  final Color? cardColor;
  final int? price;

  Vehicle({this.name, this.url, this.description, this.cardColor, this.price});
}

//get items
List<Vehicle> get getCars => _cars;
List<Vehicle> get getBigCars => _bigCars;
List<Vehicle> get getBikes => _bikes;

final List<Vehicle> _cars = [
  Vehicle(
    name: "maintenance",
    url: "assets/images/Battery/car1.png",
    description: "We provide you with all the repairs necessary to maintain it",
    cardColor: const Color(0xFFE89E74),
    price:100,
  ),
  Vehicle(
    name: "subscription",
    url: "assets/images/Battery/car2.png",
    description: "It is a cable that is connected to a dead battery and a full battery temporarily to fill the empty battery",
    cardColor: const Color(0xFF60B5F4),
    price: 50,
  ),
  Vehicle(
    name: "Change the battery",
    url: "assets/images/Battery/car1.png",
    description: "It gives a new life to your car and increases its lifespan, giving you high performance",
    cardColor: const Color(0xFF8382C2),
    price: 250,
  ),
  Vehicle(
    name: "Pre-check battery life",
    url: "assets/images/Battery/car3.png",
    description: "Checking the car battery at least once a year helps you avoid sudden malfunction",
    cardColor: const Color(0xFF2A3640),
    price: 40,
  ),
];

final List<Vehicle> _bigCars = [
  Vehicle(
    name: "Tire inflation",
    url: "assets/images/Tires/car1.png",
    description:
        "You must ensure that the appropriate pressure is provided in your car tires periodically to maintain tire performance.",
    cardColor: const Color(0xFF7EB0AA),
    price: 30,
  ),
  Vehicle(
    name: "Tire change in shop",
    url: "assets/images/Tires/car2.png",
    description:
        "The shelf life of car tires depends on the distance traveled by the car.",
    cardColor: const Color(0xFFAD8E73),
    price: 100,
  ),
  Vehicle(
    name: "Spare Change",
    url: "assets/images/Battery/car1.png",
    description:
        "For your safety and the safety of the car, repair the spare tire in case of sudden breakdowns.",
    cardColor: const Color(0xFFB7615C),
    price: 50,
  ),
  Vehicle(
    name: "Tire Fix",
    url: "assets/images/Tires/car3.png",
    description:
        "We are ready to repair damaged car tires and install new tires of the same type, size and brand.",
    cardColor: const Color(0xFFE4C970),
    price: 70,
  ),
];

final List<Vehicle> _bikes = [
  Vehicle(
    name: "maintenance",
    url: "assets/images/Battery/car1.png",
    description:
        "We provide you with all the repairs necessary to maintain it.",
    cardColor: const Color(0xFFE8B48F),
    price: 100,
  ),
  Vehicle(
    name: "subscription",
    url: "assets/images/Battery/car2.png",
    description:
        "It is a cable that is connected to a dead battery and a full battery temporarily to fill the empty battery.",
    cardColor: const Color(0xFFDF7588),
    price: 50,
  ),
  Vehicle(
    name: "Change the battery",
    url: "assets/images/Battery/car1.png",
    description:
        "It gives a new life to your car and increases its lifespan, giving you high performance.",
    cardColor: const Color(0xFF60C1DC),
    price: 250,
  ),
  Vehicle(
    name: "Pre-check battery life",
    url: "assets/images/Battery/car3.png",
    description:
        "Checking the car battery at least once a year helps you avoid sudden malfunction.",
    cardColor: const Color(0xFF6C6363),
    price: 40,
  ),
];
