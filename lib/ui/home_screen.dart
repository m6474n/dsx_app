import 'package:dsx_app/bloc/shuffle/shuffle_bloc.dart';
import 'package:dsx_app/bloc/shuffle/shuffle_event.dart';
import 'package:dsx_app/bloc/shuffle/shuffle_state.dart';
import 'package:dsx_app/bloc/theme/theme_bloc.dart';
import 'package:dsx_app/bloc/theme/theme_event.dart';
import 'package:dsx_app/bloc/theme/theme_state.dart';
import 'package:dsx_app/components/buttons/primary_button.dart';
import 'package:dsx_app/components/buttons/secondary_button.dart';
import 'package:dsx_app/ui/game/lottery_game.dart';
import 'package:dsx_app/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final diceBloc = context.read<ShuffleBloc>();
    final theme = context.theme;
    return Scaffold(
      appBar: AppBar(title: Text("DSX App"),leading: IconButton (onPressed: () {  },
      
      icon: Icon(Icons.menu)),),
      // drawer: Drawer(
      //   backgroundColor: theme.bgColor,
      //   child: ListView(children: [

      //   DrawerHeader(child: Text(
      //     "This is Drawer header",
      //   )),
      //   Text("HEllo"), 

      // ],),),
      body: BlocBuilder<ShuffleBloc, ShuffleState>(
        builder: (context, state) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedContainer(duration:Duration(milliseconds: 400),
                
                decoration: BoxDecoration(color: theme.textColor), height: 200, width: double.infinity,),
                // AnimatedSwitcher(
                //   duration: Duration(milliseconds: 200),
                //   transitionBuilder:
                //       (child, anim) =>
                //           ScaleTransition(scale: anim, child: child),
                //   child: Text(
                //     '${state.currentNumber}',
                //     key: ValueKey(state.currentNumber),
                //     style: TextStyle(
                //       fontSize: 100,
                //       fontWeight: FontWeight.bold,
                //     ),
                //   ),
                // ),
                // SizedBox(height: 20),
                // Text(
                //   'Total: ${state.total}',
                //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                // ),
                // Text(
                //   'Zero Counts: ${state.zeroCount}',
                //   style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                // ),
                // SizedBox(height: 10),
                // Text(
                //   state.status,
                //   style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                // ),
                // SizedBox(height: 50),
                // state.status.isEmpty
                //     ? ElevatedButton(
                //       onPressed:
                //           state.isShuffling
                //               ? null
                //               : () {
                //                 context.read<ShuffleBloc>().add(
                //                   StartShuffling(),
                //                 );
                //               },
                //       child: Text(
                //         state.isShuffling ? "Shuffling..." : "Shuffle Dice",
                //       ),
                //     )
                //     : ElevatedButton(
                //       onPressed: () {
                //         context.read<ShuffleBloc>().add(ResetShuffle());
                        
                //       },
                //       child: Text('Try Again'),
                //     ),
                // BlocBuilder<ThemeBloc, ThemeState>(
                //   builder: (context, state) {
                //     final isDark = state is DarkMode;
                //     return ElevatedButton(
                //       onPressed: () {
                //         context.read<ThemeBloc>().add(
                //           ToggleTheme(isDark: !isDark),
                //         );
                //         ;
                //       },
                //       child: Text('Switch Theme'),
                //     );
                //   },
                // ),

                Text("Heading Text Style", style: theme.headingStyle),
                Text(
                  'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum"',
                  style: theme.paragraphStyle,
                ),
                PrimaryButton(title: theme is DarkMode? 'Light Mode': 'Dark Mode', onTap: () {
                  final isDark = theme is DarkMode;
                  context.themeController.add(ToggleTheme(isDark:!isDark ));
                }),
                SecondaryButton(title: "Go To Lottary Screen",onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (_)=> LotteryGame() ));
                },),

                //  SizedBox(
                //   width: 200,
                //   child: GradientButton())
              ],
            ),
          );
        },
      ),
    );
  }
}
