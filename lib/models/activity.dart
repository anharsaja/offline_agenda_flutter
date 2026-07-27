class Activity {
  final String name;
  final int point;
  bool done;

  Activity({
    required this.name,
    required this.point,
    this.done = false,
  });
}