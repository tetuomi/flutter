import 'package:freezed_annotation/freezed_annotation.dart';

part 'User.freezed.dart';

@freezed
abstract class User with _$User{
  const factory User({
    @Default("Anonymous") String name,
    @Default("余白が足りない") String text,
  }) = _User;
}