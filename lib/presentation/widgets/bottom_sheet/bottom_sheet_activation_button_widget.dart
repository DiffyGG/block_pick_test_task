import 'package:flutter/material.dart';
import 'package:block_pick_test_task/presentation/widgets/bottom_sheet/bottom_sheet_widget.dart';

class BottomSheetActivationButtonWidget extends StatelessWidget {
  const BottomSheetActivationButtonWidget({super.key});

  void _openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true, //TODO: if don't need to display the bottom sheet up to the max height, then remove it
      constraints: const BoxConstraints(
        maxWidth: double.infinity,
      ),
      builder: (_) {
        return const BottomSheetWidget();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _openBottomSheet(context),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
      ),
      child: const Text(
        'Выбрать квадратик',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
