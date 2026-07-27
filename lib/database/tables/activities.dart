import 'package:drift/drift.dart';

class Activities extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get category => text()();
  IntColumn get point => integer()();
  BoolColumn get isDaily => boolean()();
  DateTimeColumn get createdAt => dateTime()();
  @override
  Set<Column> get primaryKey => {id};
}