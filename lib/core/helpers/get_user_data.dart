import 'dart:convert';

import 'package:fruit_hub/core/services/shared_preferences_singleton.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

UserEntity getUserData() {
  var userDataJson = SharedPreferencesSingleton.getString('userData');
  return UserModel.fromJson(jsonDecode(userDataJson));
}
