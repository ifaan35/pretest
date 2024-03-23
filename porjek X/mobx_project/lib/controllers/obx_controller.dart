// controllers/obx_controller.dart
import 'package:mobx/mobx.dart';

part 'obx_controller.g.dart';

class ObxController = _ObxController with _$ObxController;

abstract class _ObxController with Store {
  @observable
  String text = 'uppercase atau lowercase';

  @action
  void toggleCase() {
    if (text == text.toLowerCase()) {
      text = text.toUpperCase();
    } else {
      text = text.toLowerCase();
    }
  }
}
