import 'package:flutter/material.dart';
import 'package:block_pick_test_task/presentation/widgets/bottom_sheet/bottom_sheet_activation_button_widget.dart';
import 'package:block_pick_test_task/presentation/widgets/history/history_widget.dart';

class GeneralPage extends StatelessWidget {
  const GeneralPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            HistoryWidget(),
            Align(
              child: BottomSheetActivationButtonWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
