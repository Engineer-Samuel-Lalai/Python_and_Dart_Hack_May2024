// **Sorting Algorithm Implementation**
// Task: Write a Dart function that implements a sorting algorithm (e.g., Quick Sort, Merge Sort, or Bubble Sort) to sort a list of integers. The function should return the sorted list.
// Bonus Points: Implement two different sorting algorithms and compare their performance in terms of execution time.
// Objective: Test understanding of algorithmic complexity and the ability to implement and optimize sorting algorithms.

//import 'dart:io';
import 'dart:core';
import 'dart:math';
//Bubble Sort function
List<int> bubbleSort(List<int> list) {
  int n = list.length;
  bool swapped;

  for (int i = 0; i < n-1; i++) {
    swapped = false;
    for (int j= 0; j <n-i - 1; j++) {
      if(list[j] > list[j + 1]){
        //swap elements
        int temp = list[j];
        list[j] = list[j +1];
        list[j + 1] = temp;
        swapped = true;
      }
    }
    //if no two elements were swapped in the inner loop, then break
    if (!swapped) break;
  }
  return list;
}

//Quick Sort Implementation
List<int> quickSort(List<int> list) {
  if  (list.length <=1) {
    return list;
  }

  int pivot = list[list.length ~/ 2];
  List<int> less = list.where((x) => x < pivot).toList();
  List<int> equal = list.where((x) => x == pivot).toList();
  List<int> greater = list.where((x) => x > pivot).toList();

  return quickSort(less) + equal + quickSort(greater);
}

void main(){
  //Generate a random list of intergers
  List<int> list = List.generate(1000, (index) => Random().nextInt(10000));

  //Measure Bubble Sort time
  Stopwatch stopwatch = Stopwatch()..start();
  List<int> bubbleSortedList = bubbleSort(List.from(list));
  stopwatch.stop();
  print('Bubble Sort Time: ${stopwatch.elapsedMilliseconds} ms');

  //Measure Quick Sort time
  stopwatch.reset();
  stopwatch.start();
  List<int> quickSortedList = quickSort(list);
  stopwatch.stop();
  print('Lists are sorted correctly: ${isSorted(bubbleSortedList) && isSorted(quickSortedList)}');
  print(bubbleSortedList);
  print(quickSortedList);
}

bool isSorted(List<int> list) {
  for (int i = 0; i < list.length -1; i++) {
    if (list[i] > list[i + 1]) return false;
  }
  return true;
}
