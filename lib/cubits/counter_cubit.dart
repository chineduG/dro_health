import 'package:bloc/bloc.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void addPrice() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void reducePrice() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));
}
