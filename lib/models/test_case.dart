class TestCase {
  final String name;
  final List<String> steps;
  final String expectedOutcome;

  TestCase({
    required this.name,
    required this.steps,
    required this.expectedOutcome,
  });
}
