import 'package:freezed_annotation/freezed_annotation.dart';

part 'completion_modal_state.freezed.dart';

@freezed
abstract class CompletionModalState with _$CompletionModalState {
  const factory CompletionModalState({
    @Default(-1) int option,
    @Default(false) isCompletionRequesting,
  }) = _CompletionModalState;
}
