import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:block_pick_test_task/presentation/bloc/general_bloc.dart';
import 'package:block_pick_test_task/presentation/widgets/history/history_item_widget.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<GeneralBloc, GeneralState>(
          buildWhen: (prev, cur) {
            return prev.history.isEmpty;
          },
          builder: (_, state) {
            return Visibility(
              visible: state.history.isNotEmpty,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'История',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
        Expanded(
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              child: BlocBuilder<GeneralBloc, GeneralState>(
                builder: (_, state) {
                  final historyList = state.history;
                  return Wrap(
                    alignment: WrapAlignment.start,
                    children: List.generate(historyList.length, (i) => HistoryItemWidget(value: historyList[i])),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
