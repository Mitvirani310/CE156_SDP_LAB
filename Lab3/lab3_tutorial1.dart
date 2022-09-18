import 'package:lab3_tutorial1/lab3_tutorial1.dart' as lab3_tutorial1;
import 'dart:math';
void main(List<String> arguments) {
/*

// While loops :
//syntax

// while (condition) {
// // loop code
// }

// Example of while loop :
  // var sum = 1;
  // while (sum < 10) {
  //   sum += 4;
  //   print(sum);
  // }
// print : 5
//         9
//         13

// Run that to see the result. The loop executes as follows:
// Before 1st iteration: sum = 1, loop condition = true
// After 1st iteration: sum = 5, loop condition = true After
// 2nd iteration: sum = 9, loop condition = true After 3rd
// iteration: sum = 13, loop condition = false

// Do-while loops :
//syntax :
// do {
// // loop code
// } while (condition)

//Example of Do While loop :

// var sum = 1;

// do
// {
// sum += 4;
// print(sum);
// } while (sum < 10);

// print : 5
//         9
//         13

// Comparing while and do-while loops :

// It isn’t always the case that while loops and do-while loops will give the same result.
// For example, here’s a while loop where sum starts at 11:

//In below example while loop condition is not staisfied, so nothing to print :
  // var sum = 11;
  // while (sum < 10) {
  //   sum += 4;
  //   print(sum);
  // }

  //While In given below example loop is executed only once, because in do..while loop first time loop is executed because there is no any condition, so that time it is executed then after while condition is not satisfied so loop is terminated.  
  //Print : 15
  // var sum = 11;
  // do {
  //   sum += 4;
  // } while (sum < 10);
  // print(sum);

//Breaking out of a loop :
// Here, the loop condition is true, so the loop would normally
// iterate forever. However, the break means the while loop
// will exit once the sum is greaterthan 10.

// sum = 1;
// while (true) {
// sum += 4;
// if (sum > 10) {
// break;
// }

//A random interlude :

// nextInt is a method that generates a random integer between 0 and one less than the maximum value you give it,
// final random = Random();
// while (random.nextInt(6) + 1 != 6) {
// print('Not a six!');
// }

// For loops
    // for (var i = 0; i < 5; i++) {
    //   print(i);
    // }

    //  The continue keyword

    // continue keyword will tell the for loop to
    // immediately go on to the next iteration. The rest of the code
    // in the block won’t run on this iteration.

    // for (var i = 0; i < 5; i++) { if
    // (i == 2) {
    // continue;
    // }
    // print(i);
    // }

    // For-in loops

    // When you get the runes from a string, that gives you a collection of Unicode code points.
    // myString.runes is a collection of all the code points in myString.
    // const myString = 'I ❤ Dart';
    // for (var codePoint in myString.runes) {
    // print(String.fromCharCode(codePoint));
    // }
    //Print :
    // I
 
    // ❤

    // D
    // a
    // r
    // t

    // For-each loops
    // const myNumbers = [1, 2, 3];
    // myNumbers.forEach((number) => print(number));
    
    //print : 1 2 3 

*/

/*
  // Mini Exercises
  int counter = 0;
  while(counter < 10){
    print("counter is $counter");
    counter++;
  }

  for(int i = 1; i <= 10; i++)
    print(i*i);

  const numbers = [1, 2, 4, 7];
  for(var n in numbers){
    print(sqrt(n));
  }

  numbers.forEach((n) =>  print(sqrt(n)) );
  */


  /*
  // Challenges
  
  // Challenge-1: Find the Error
  const firstName = 'Bob'; 
  if(firstName == 'Bob') {
    const lastName = 'Smith';
  } else if (firstName == 'Ray') {
    const lastName = 'Wenderlich';
  }
  // No Error: Code will run fine

  // Challenge-2: Boolean challenge
  print(true && true);                              // true
  print(false || false);                            // false
  print((true && 1 != 2) || (4 > 3 && 100 < 1));    // true
  print(((10 / 2) > 3) && ((10 % 2) == 0));         // true

  // Challenge-3: Next power of two
  var n = 36;
  if(n <= 2){
    print(2);
  }else if(n <= 4){
    print(4);
  }else{
    var temp = 8;

    while(temp < n){
      temp *= 2;
    }
    print(temp);    // 64
  }

  // Challenge-4: Fibonacci
  var index = 19;
  if(index == 1 || index == 2){
    print(1);
  }else{
    var ls1 = 1;
    var ls2 = 1;
    for(int i = 3; i <= index; i++){
      int temp = ls1 + ls2;
      ls1 = ls2;
      ls2 = temp;
    }
    print(ls2);     // 4181
  }

  // Challenge-5: How many times?
  var sum = 0;
  for (var i = 0; i <= 5; i++) {
    sum += i;
  }
  print(sum);                     // 15
  print("(5 + 1) iterations");    // (5 + 1) iterations

  // Challenge-6: The final countdown
  for(int i = 10; i >= 0; i--)
    print(i);

  // Challenge 7: Print a sequence
  for(var i = 0.0; i <= 1; i += 0.1)
    print(i.toStringAsFixed(1));
  
  */
  
}

