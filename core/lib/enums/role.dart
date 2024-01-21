import 'package:core/core.dart';

part 'role.g.dart';

@HiveType(typeId: 4)
enum Role {
  @HiveField(0)
  user,
  @HiveField(1)
  admin,
  @HiveField(2)
  undefined,
}
