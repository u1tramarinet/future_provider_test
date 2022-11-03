import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:future_provider_test/view_model/option_view_model.dart';

class ModalView extends ConsumerStatefulWidget {
  const ModalView({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) => const ModalView(),
    );
  }

  @override
  ConsumerState<ModalView> createState() => ModalState();
}

class ModalState extends ConsumerState<ModalView> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    OptionViewModel viewModel = ref.watch(optionViewModelProvider.notifier);
    int option = ref.watch(optionViewModelProvider);
    return Row(
      children: [
        const Spacer(),
        _button(
          number: 1,
          onPressed: viewModel.updateOption,
          isEnabled: (option != 1),
        ),
        const Spacer(),
        _button(
          number: 2,
          onPressed: viewModel.updateOption,
          isEnabled: (option != 2),
        ),
        const Spacer(),
        _button(
          number: 3,
          onPressed: viewModel.updateOption,
          isEnabled: (option != 3),
        ),
        const Spacer(),
      ],
    );
  }
}

TextButton _button({
  required int number,
  required Function(int) onPressed,
  bool isEnabled = true,
}) {
  return _Button(
    onPressed: () => onPressed(number),
    isEnabled: isEnabled,
    child: Text(
      style: const TextStyle(fontSize: 50),
      '$number',
    ),
  );
}

class _Button extends TextButton {
  const _Button({
    Function()? onPressed,
    required Widget child,
    bool isEnabled = true,
  }) : super(
          onPressed: (isEnabled) ? onPressed : null,
          child: child,
        );
}
