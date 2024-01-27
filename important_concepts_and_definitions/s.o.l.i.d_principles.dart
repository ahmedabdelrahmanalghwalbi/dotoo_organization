/*
The SOLID principles are a set of five design principles that help in designing maintainable and scalable software. These principles can be applied to Dart code as well. Let's go through each principle in detail with examples:

1. Single Responsibility Principle (SRP):
A class should have only one reason to change, i.e., it should have only one responsibility. This principle promotes modular and cohesive code.

Example:
dart
class UserManager {
  void addUser(User user) {
    // Code to add user to the database
  }

  void deleteUser(User user) {
    // Code to delete user from the database
  }
}

class User {
  String name;
  int age;
  
  // Getters and setters
}

In the above example, the `UserManager` class is responsible for managing users (adding and deleting). It follows the SRP as it has a single responsibility related to user management.

2. Open-Closed Principle (OCP):
Classes should be open for extension but closed for modification. This principle encourages the use of inheritance and interfaces to allow adding new functionality without changing the existing code.

Example:
dart
abstract class Shape {
  void draw();
}

class Circle implements Shape {
  @override
  void draw() {
    // Code to draw a circle
  }
}

class Square implements Shape {
  @override
  void draw() {
    // Code to draw a square
  }
}

class ShapeDrawer {
  void drawShape(Shape shape) {
    shape.draw();
  }
}

In the above example, the `Shape` class is open for extension as new shapes can be added by implementing the `Shape` interface. The `ShapeDrawer` class is closed for modification as it can draw any shape without changing its code.

3. Liskov Substitution Principle (LSP):
Subtypes must be substitutable for their base types. This principle ensures that derived classes can be used interchangeably with their base classes without affecting the correctness of the program.

Example:
dart
abstract class Animal {
  void makeSound();
}

class Dog implements Animal {
  @override
  void makeSound() {
    print("Woof!");
  }
}

class Cat implements Animal {
  @override
  void makeSound() {
    print("Meow!");
  }
}

void makeAnimalSound(Animal animal) {
  animal.makeSound();
}

In the above example, the `makeAnimalSound` function can accept any subtype of `Animal` (e.g., `Dog`, `Cat`) without affecting the behavior of the function.

4. Interface Segregation Principle (ISP):
Clients should not be forced to depend on interfaces they do not use. This principle promotes the creation of specific interfaces for each client instead of having a large and general-purpose interface.

Example:
dart
abstract class Printer {
  void print();
}

mixin Scan {
  void scan();
}

class BasicPrinter implements Printer {
  @override
  void print() {
    // Code to print
  }
}

class MultifunctionPrinter implements Printer, Scan {
  @override
  void print() {
    // Code to print
  }
  
  @override
  void scan() {
    // Code to scan
  }
}

In the above example, the `Printer` interface is segregated into smaller interfaces (`Printer` and `Scan`). Clients can then depend on the specific interfaces they need.

5. Dependency Inversion Principle (DIP):
High-level modules should not depend on low-level modules. Both should depend on abstractions. This principle promotes loose coupling and allows for easier testing, maintenance, and flexibility.

Example:
dart
class UserService {
  final UserRepository userRepository;

  UserService(this.userRepository);

  void addUser(User user) {
    userRepository.addUser(user);
  }
}

class UserRepository {
  void addUser(User user) {
    // Code to add user to the database
  }
}

class User {
  String name;
  int age;
  
  // Getters and setters
}

In the above example, the `UserService` depends on the `UserRepository` abstraction instead of a concrete implementation. This allows for easy swapping of different implementations of the `UserRepository` without changing the `UserService` code.

By following these SOLID principles, you can create code that is easier to understand, maintain, and extend. It helps in building robust and scalable Dart applications.
*/