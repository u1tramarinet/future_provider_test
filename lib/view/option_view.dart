import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider_test/view/modal_view.dart';

import '../view_model/option_view_model.dart';
import 'completion_modal_view.dart';
import 'widget/stateful_text_button.dart';

class OptionView extends ConsumerStatefulWidget {
  const OptionView({super.key});

  @override
  ConsumerState<OptionView> createState() => _OptionState();
}

class _OptionState extends ConsumerState<OptionView> {
  @override
  void initState() {
    super.initState();
    ref.refresh(optionFutureProvider(true));
  }

  Widget _body(BuildContext context) {
    OptionViewModel viewModel = ref.watch(optionViewModelProvider.notifier);
    int option = ref.watch(optionViewModelProvider);
    final state = ref.watch(optionFutureProvider(false));
    return Column(
      children: [
        const Spacer(),
        if (state.isLoading) ...{
          const CircularProgressIndicator(),
        } else ...{
          Text(
            style: const TextStyle(fontSize: 50),
            '$option',
          ),
        },
        const Spacer(),
        const Icon(
          Icons.arrow_upward,
          size: 100,
        ),
        const Spacer(),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              const Spacer(),
              numberButton(
                number: 1,
                onPressed: viewModel.updateOption,
                isEnabled: (!state.isLoading) && (option != 1),
              ),
              const Spacer(),
              numberButton(
                number: 2,
                onPressed: viewModel.updateOption,
                isEnabled: (!state.isLoading) && (option != 2),
              ),
              const Spacer(),
              numberButton(
                number: 3,
                onPressed: viewModel.updateOption,
                isEnabled: (!state.isLoading) && (option != 3),
              ),
              const Spacer(),
            ],
          ),
        ),
        const Spacer(),
        StatefulTextButton(
          onPressed: () {
            ModalView.show(context);
          },
          isEnabled: !state.isLoading,
          child: const Text('Go to modal'),
        ),
        StatefulTextButton(
          onPressed: () {
            CompletionModalView.show(context);
          },
          isEnabled: !state.isLoading || false,// TODO fix me
          child: const Text('Go to completion modal'),
        ),
        const Spacer(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Screen'),
      ),
      body: Container(
        width: double.infinity,
        alignment: Alignment.center,
        height: double.infinity,
        child: _body(context),
      ),
    );
  }
}
