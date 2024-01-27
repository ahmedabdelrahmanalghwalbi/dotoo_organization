/*
In a Flutter Bloc app, "dartz" refers to a functional programming library that provides tools and utilities for working with Dart language. It introduces concepts like Option, Either, and Try to handle common scenarios in a more concise and expressive way.

Here are some key concepts of dartz with examples:

1. Option: Option represents a value that can be either present or absent. It is useful when dealing with nullable values. For example:

   
dart
   import 'package:dartz/dartz.dart';

   Option<int> getNumber(bool present) {
     if (present) {
       return Some(10);
     } else {
       return None();
     }
   }

   void main() {
     final number = getNumber(true);
     number.fold(
       () => print('Number is absent'),
       (value) => print('Number is $value')
     );
   }
   
   In this example, the `getNumber` function returns an Option based on the boolean parameter. If `present` is true, it returns Some(10), otherwise it returns None(). The `fold` function is used to handle both cases.

2. Either: Either represents a value that can be of one of two different types. It is useful when dealing with multiple possible outcomes. For example:

   
dart
   import 'package:dartz/dartz.dart';

   Either<String, int> divide(int a, int b) {
     if (b == 0) {
       return Left('Cannot divide by zero');
     } else {
       return Right(a ~/ b);
     }
   }

   void main() {
     final result = divide(10, 2);
     result.fold(
       (error) => print('Error: $error'),
       (value) => print('Result: $value')
     );
   }
   
   In this example, the `divide` function returns an Either based on the divisor. If the divisor is zero, it returns Left('Cannot divide by zero'), otherwise it returns Right(a ~/ b). The `fold` function is used to handle both cases.

3. Try: Try represents a computation that can either succeed or throw an exception. It is useful for handling exceptions in a more functional way. For example:

   
dart
   import 'package:dartz/dartz.dart';

   Try<int> parseNumber(String input) {
     try {
       return Success(int.parse(input));
     } catch (e) {
       return Failure('Invalid number');
     }
   }

   void main() {
     final result = parseNumber('10');
     result.fold(
       (error) => print('Error: $error'),
       (value) => print('Number: $value')
     );
   }
   
   In this example, the `parseNumber` function attempts to parse a string input to an integer. If successful, it returns Success(int.parse(input)), otherwise it returns Failure('Invalid number'). The `fold` function is used to handle both cases.

These are just a few examples of how dartz can be used in a Flutter Bloc app to handle common scenarios in a more functional and expressive way. It provides powerful tools for working with nullable values, multiple possible outcomes, and exception handling.
*/