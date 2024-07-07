part of 'general_bloc.dart';

final class GeneralState extends Equatable {
  final int lenght;
  final List<int> history;

  static final _random = Random();

  const GeneralState({
    required this.lenght,
    required this.history,
  });

  factory GeneralState.init() {
    return GeneralState(
      lenght: _random.nextInt(19) + 1,
      history: const [], //List.generate(1000, (_) => 1)
    );
  }

  GeneralState addPickedValue(int value) {
    return GeneralState(
      lenght: _random.nextInt(19) + 1,
      history: [value, ...history],
    );
  }

  @override
  List<Object?> get props => [
        lenght,
        history,
      ];
}
