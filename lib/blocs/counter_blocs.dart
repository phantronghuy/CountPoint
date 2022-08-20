import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/events/counter_event.dart';

// 2 parameters are event and state
class CounterBlocs extends Bloc<CounterEvent,int>{

  @override
  // TODO: implement initialState
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async*{
    
  }  
}