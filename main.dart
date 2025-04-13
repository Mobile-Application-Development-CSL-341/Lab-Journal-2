// main.dart

// ✅ Task 1: Find the Largest Number in a List
int findLargest(List<int> numbers) {
  if (numbers.isEmpty) throw Exception("List is empty");
  int largest = numbers[0];
  for (int num in numbers) {
    if (num > largest) largest = num;
  }
  return largest;
}

// ✅ Task 2: Merge Sort Implementation
List<int> mergeSort(List<int> list) {
  if (list.length <= 1) return list;

  int middle = list.length ~/ 2;
  List<int> left = mergeSort(list.sublist(0, middle));
  List<int> right = mergeSort(list.sublist(middle));

  return merge(left, right);
}

List<int> merge(List<int> left, List<int> right) {
  List<int> result = [];
  int i = 0, j = 0;

  while (i < left.length && j < right.length) {
    if (left[i] <= right[j]) {
      result.add(left[i]);
      i++;
    } else {
      result.add(right[j]);
      j++;
    }
  }

  result.addAll(left.sublist(i));
  result.addAll(right.sublist(j));
  return result;
}

// ✅ Task 3: Stack Implementation
class Stack<T> {
  final List<T> _stack = [];

  void push(T value) {
    _stack.add(value);
  }

  T pop() {
    if (isEmpty) throw Exception("Stack is empty");
    return _stack.removeLast();
  }

  T peek() {
    if (isEmpty) throw Exception("Stack is empty");
    return _stack.last;
  }

  bool get isEmpty => _stack.isEmpty;

  int get size => _stack.length;
}

void main() {
  // Test Task 1
  List<int> nums1 = [10, 25, 5, 72, 30];
  print("Task 1 - Largest number: ${findLargest(nums1)}");

  // Test Task 2
  List<int> nums2 = [38, 27, 43, 3, 9, 82, 10];
  print("Task 2 - Sorted list: ${mergeSort(nums2)}");

  // Test Task 3
  Stack<int> stack = Stack<int>();
  stack.push(10);
  stack.push(20);
  stack.push(30);
  print("Task 3 - Top of stack: ${stack.peek()}");
  print("Task 3 - Popped: ${stack.pop()}");
  print("Task 3 - Top after pop: ${stack.peek()}");
}
