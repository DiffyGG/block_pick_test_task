import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:block_pick_test_task/presentation/bloc/general_bloc.dart';

class BottomSheetItemWidget extends StatelessWidget {
  const BottomSheetItemWidget({
    super.key,
    required this.value,
  });

  final int value;

  void onTap(BuildContext context) {
    BlocProvider.of<GeneralBloc>(context).add(GeneralEvent(value: value));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
      child: Material(
        clipBehavior: Clip.hardEdge,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        color: Colors.red,
        child: InkWell(
          onTap: () => onTap(context),
          child: SizedBox(
            height: 100,
            width: double.infinity,
            child: Center(
              child: Text(
                value.toString(),
                style: const TextStyle(fontSize: 40),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
