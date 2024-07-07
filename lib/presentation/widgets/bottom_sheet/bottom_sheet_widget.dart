import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:block_pick_test_task/presentation/bloc/general_bloc.dart';
import 'package:block_pick_test_task/presentation/widgets/bottom_sheet/bottom_sheet_item_widget.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<GeneralBloc>(context);

    return LayoutBuilder(
      builder: (_, constrains) {
        final Widget listView;

        if (constrains.maxHeight < (bloc.state.lenght + 1) * 100) {
          listView = Expanded(
            child: ListView.builder(
              clipBehavior: Clip.hardEdge,
              itemCount: bloc.state.lenght,
              itemBuilder: (_, index) {
                return BottomSheetItemWidget(value: index);
              },
            ),
          );
        } else {
          listView = ListView.builder(
            clipBehavior: Clip.hardEdge,
            shrinkWrap: true,
            itemCount: bloc.state.lenght,
            itemBuilder: (_, index) {
              return BottomSheetItemWidget(value: index);
            },
          );
        }

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Выберите число из списка:',
                style: TextStyle(fontSize: 25),
              ),
            ),
            ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: listView,
            ),
          ],
        );
      },
    );
  }
}
