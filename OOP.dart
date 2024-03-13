import 'dart:io';

// Interface for sound maker
abstract class SoundMaker {
  void makeSound();
}

// Superclass
class Animal implements SoundMaker {
  String name;
  int age;

  Animal(this.name, this.age);
  @override
  void makeSound() {}
}

// Subclass Cat
class Cat extends Animal implements SoundMaker {
  Cat(String name, int age) : super(name, age);

  @override
  void makeSound() {
    print("$name says: Meow!");
  }
}

// Subclass Dog
class Dog extends Animal implements SoundMaker {
  Dog(String name, int age) : super(name, age);

  @override
  void makeSound() {
    print("$name says: Woof!");
  }
}

void main() {
  // Initialize animals from file
  List<Animal> animals = [];
  var file = File('animals.txt');
  var lines = file.readAsLinesSync();

  for (var line in lines) {
    var parts = line.split(',');
    var name = parts[0];
    var species = parts[1];
    var age = int.parse(parts[2]);

    if (species == 'cat') {
      animals.add(Cat(name, age));
    } else if (species == 'dog') {
      animals.add(Dog(name, age));
    }
  }

  // Make the animals produce sounds
  for (var animal in animals) {
    animal.makeSound();
  }
}
