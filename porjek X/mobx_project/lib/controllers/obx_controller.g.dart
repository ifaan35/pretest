// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'obx_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ObxController on _ObxController, Store {
  late final _$textAtom = Atom(name: '_ObxController.text', context: context);

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  late final _$_ObxControllerActionController =
      ActionController(name: '_ObxController', context: context);

  @override
  void toggleCase() {
    final _$actionInfo = _$_ObxControllerActionController.startAction(
        name: '_ObxController.toggleCase');
    try {
      return super.toggleCase();
    } finally {
      _$_ObxControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
text: ${text}
    ''';
  }
}
