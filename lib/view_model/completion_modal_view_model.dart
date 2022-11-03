import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider_test/model/option_model.dart';
import 'package:future_provider_test/view_model/option_view_model.dart';

import '../model/completion_modal_state.dart';

class CompletionModalViewModel extends StateNotifier<CompletionModalState> {
  CompletionModalViewModel() : super(const CompletionModalState());

  void onChangeSelectedOption(int option) {
    state = state.copyWith(option: option);
  }

  void onUpdateCompletionRequest(bool isRequesting) {
    state = state.copyWith(isCompletionRequesting: isRequesting);
  }
}

final completionModalViewModelProvider =
    StateNotifierProvider<CompletionModalViewModel, CompletionModalState>(
        (ref) => CompletionModalViewModel());

final completionModalOptionGetFutureProvider =
    FutureProvider<void>((ref) async {
  debugPrint('[PROVIDER]optionGetFutureProvider');
  OptionModel model = OptionModel();
  int option = await model.restoreOption();
  CompletionModalViewModel viewModel =
      ref.watch(completionModalViewModelProvider.notifier);
  viewModel.onChangeSelectedOption(option);
});

final completionModalOptionCompletionFutureProvider =
    FutureProvider<bool>((ref) async {
  bool isRequesting = ref.watch(completionModalViewModelProvider
      .select((value) => value.isCompletionRequesting));
  int option = ref
      .watch(completionModalViewModelProvider.select((value) => value.option));
  if (!isRequesting) {
    return false;
  }
  OptionModel model = OptionModel();
  if (await model.saveOptionRandomly(option)) {
    OptionViewModel viewModel = ref.watch(optionViewModelProvider.notifier);
    viewModel.updateOption(option);
    return true;
  } else {
    return false;
  }
});
