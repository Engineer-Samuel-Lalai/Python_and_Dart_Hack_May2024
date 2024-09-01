import 'package:flutter/material.dart';
import 'dart:math';

class SortingAlgorithmsScreen extends StatefulWidget {
  @override
  _SortingAlgorithmsScreenState createState()  => _SortingAlgorithmsScreenState();
}

class _SortingAlgorithmsScreenState extends State<SortingAlgorithmsScreen> {
  List<int> _list = [];
  List<int> _bubbleSortedList = [];
  List<int> _quickSortedList = [];
  String _bubbleSortTime = '';
  String _quickSortTime = '';

  void _generateAndSort() {
    _list = List.generate(1000, (index) => Random().nextInt(10000));

    final stopwatch = Stopwatch()..start();
    _bubbleSortedList = bubbleSort(List.from(_list));
    stopwatch.stop();
    _bubbleSortTime = '${stopwatch.elapsedMilliseconds} ms';

    stopwatch.reset();
    stopwatch.start();
    _quickSortedList = quickSort(_list);
    stopwatch.stop();
    _quickSortTime = '${stopwatch.elapsedMilliseconds} ms';

    setState(() {});
  }

  List<int> bubbleSort(List<int> list) {
    int n = list.length;
    bool swapped;

    for (int i = 0; i <n- i; i++) {
      swapped =false;
      for (int j =0; j < n - i - 1; j++) {
        if(list[j] > list[j + 1]) {
          int temp = list[j];
          list[j] = list[j + 1];
          list[j + 1] = temp;
          swapped = true;
        }
      }
      if(!swapped) break;
    }
    return list;
  }

  List<int> quickSort(List<int> list) {
    if (list.length <= 1) {
      return list;
    }

    int pivot = list[list.length ~/ 2];
    List<int> less = list.where((x) => x < pivot).toList();
    List<int> equal = list.where((x) => x == pivot).toList();
    List<int> greater = list.where((x) => x > pivot).toList();

    return quickSort(less) + equal + quickSort(greater);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sorting Algorithms'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _generateAndSort,
              child: const Text('Generate and Sort'),
              ),
              const SizedBox(height: 20),
              Text('Bubble Sort Time: $_bubbleSortTime'),
              Text('Quick Sort Time: $_quickSortTime'),
              Text('Bubble Sorted List: ${_bubbleSortedList.take(10).toList()}...'),
              Text('Quick Sorted List: ${_quickSortedList.take(10).toList()}...'),
          ],
        ),
      ),
      );
    }
}