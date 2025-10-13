import 'test_case.dart';

class TestReport {
  final List<TestCase> testCases;
  final Map<String, bool> results;

  TestReport({required this.testCases, required this.results});
}
