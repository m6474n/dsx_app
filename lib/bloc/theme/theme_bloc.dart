import 'package:dsx_app/bloc/theme/theme_event.dart';
import 'package:dsx_app/bloc/theme/theme_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent,ThemeState>{
ThemeBloc(): super(const LightMode()){
  on<ToggleTheme>((event, emit) {
    if(event.isDark){
      emit(const DarkMode());
    }else{
      emit(const LightMode());
    }
  },);
}
}