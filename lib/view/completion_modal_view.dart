import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/completion_modal_view_model.dart';
import 'widget/stateful_text_button.dart';

class CompletionModalView extends ConsumerStatefulWidget {
  const CompletionModalView({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => const CompletionModalView(),
    );
  }

  @override
  ConsumerState<CompletionModalView> createState() => ModalState();
}

class ModalState extends ConsumerState<CompletionModalView> {
  @override
  void initState() {
    super.initState();
    ref.refresh(completionModalOptionGetFutureProvider);
    ref.refresh(completionModalOptionCompletionFutureProvider);
  }

  @override
  Widget build(BuildContext context) {
    CompletionModalViewModel viewModel =
        ref.watch(completionModalViewModelProvider.notifier);
    int option = ref.watch(
        completionModalViewModelProvider.select((value) => value.option));
    final completionResult =
        ref.watch(completionModalOptionCompletionFutureProvider);

    // if (!completionResult.isLoading) {
    //   if (completionResult.value == true) {
    //     Navigator.of(context).pop();
    //   } else if (completionResult.value == false) {
    //     Future(() {
    //       viewModel.onUpdateCompletionRequest(false);
    //     });
    //   }
    // }

    return Column(
      children: [
        Row(
          children: [
            const Spacer(),
            numberButton(
              number: 1,
              onPressed: viewModel.onChangeSelectedOption,
              isEnabled: (option != 1),
            ),
            const Spacer(),
            numberButton(
              number: 2,
              onPressed: viewModel.onChangeSelectedOption,
              isEnabled: (option != 2),
            ),
            const Spacer(),
            numberButton(
              number: 3,
              onPressed: viewModel.onChangeSelectedOption,
              isEnabled: (option != 3),
            ),
            const Spacer(),
          ],
        ),
        StatefulTextButton(
            onPressed: () {
              viewModel.onUpdateCompletionRequest(true);
            },
            isEnabled: !completionResult.isLoading,
            child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                child: Column(
                  children: [
                    const Spacer(),
                    if (completionResult.isLoading) ...{
                      const CircularProgressIndicator(),
                    } else ...{
                      const Text(
                        '完了',
                        textAlign: TextAlign.center,
                      ),
                    },
                    const Spacer(),
                  ],
                ))),
      ],
    );
  }
}
