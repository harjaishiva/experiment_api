import 'package:hive/hive.dart';

//part 'users.g.dart';

@HiveType(typeId:0)
class Users extends HiveObject{
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String emailid;

  @HiveField(2)
  late String username;

  @HiveField(3)
  late String password;

  Users(this.name, this.emailid, this.username, this.password);
}