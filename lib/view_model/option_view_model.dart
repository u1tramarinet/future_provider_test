import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider_test/model/option_model.dart';

class OptionViewModel extends StateNotifier<int> {
  OptionViewModel() : super(-1);

  void updateOption(int option) {
    state = option;
  }
}

final optionViewModelProvider =
    StateNotifierProvider<OptionViewModel, int>((ref) {
  debugPrint('[PROVIDER]optionViewModelProvider');
  return OptionViewModel();
});

final optionFutureProvider =
    FutureProvider.family<int, bool>((ref, forceGet) async {
  debugPrint('[PROVIDER]optionFutureProvider forceGet=$forceGet');
  OptionModel model = OptionModel();
  if (!forceGet) {
    debugPrint('[PROVIDER]optionFutureProvider if !forceGet');
    int option = ref.watch(optionViewModelProvider);
    if (await model.saveOption(option)) {
      debugPrint('[PROVIDER]optionFutureProvider if result');
      return option;
    }
  }
  debugPrint('[PROVIDER]optionFutureProvider restore');
  int option = await model.restoreOption();
  OptionViewModel viewModel = ref.watch(optionViewModelProvider.notifier);
  viewModel.updateOption(option);
  return option;
});
