import 'package:flutter_my_demo/model/message_bean_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "MessageBeanEntity") {
      return MessageBeanEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}