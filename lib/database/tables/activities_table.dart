import 'package:drift/drift.dart';

class ActivitiesTable extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  IntColumn get point => integer()();

  BoolColumn get done => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}