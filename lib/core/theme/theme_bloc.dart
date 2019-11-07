import 'package:bloc/bloc.dart';

import 'package:my_training/core/theme/theme_event.dart';

class ThemeBloc extends Bloc<ThemeEvent, bool> {
  @override
  bool get initialState => false;

  @override
  Stream<bool> mapEventToState(ThemeEvent event) async* {
    switch (event) {
      case ThemeEvent.toggle:
        yield !state;
        break;
    }
  }
}
