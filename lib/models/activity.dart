// import 'package:uuid/uuid.dart';
// import 'activity_category.dart';

// const uuid = Uuid();

// class Activity {

//   final String id;
//   final String name;
//   final ActivityCategory category;
//   final int point;
//   final bool isDaily;
//   bool isCompleted;
//   final DateTime createdAt;

//   Activity({
//     String? id,
//     required this.name,
//     required this.category,
//     required this.point,
//     this.isDaily = true,
//     this.isCompleted = false,
//     DateTime? createdAt,
//   }) : id = id ?? uuid.v4(),
//         createdAt = createdAt ?? DateTime.now();
// }

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