import 'package:dsx_app/bloc/shuffle/shuffle_bloc.dart';
import 'package:dsx_app/bloc/shuffle/shuffle_event.dart';
import 'package:dsx_app/bloc/shuffle/shuffle_state.dart';
import 'package:dsx_app/components/buttons/gradient_button.dart';
import 'package:dsx_app/components/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LotteryGame extends StatelessWidget {
  const LotteryGame({super.key});

  @override
  Widget build(BuildContext context) {
    final shuffle = context.read<ShuffleBloc>();
 return  BlocBuilder<ShuffleBloc, ShuffleState>(
        builder: (context, state) { return Scaffold(
      appBar: AppBar(title: Text("Lottary Game"),),
      body: 
           Center(
            child: Column(
              spacing: 4,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            
             AnimatedSwitcher(
                    duration: Duration(milliseconds: 200),
                    transitionBuilder:
                        (child, anim) =>
                            ScaleTransition(scale: anim, child: child),
                    child: Text(
                      '${state.currentNumber}',
                      key: ValueKey(state.currentNumber),
                      style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
            
            
                if (state.status.isNotEmpty) Text("${state.status}"),
                Text("${state.currentNumber}"),
                SizedBox(height: 18),
                Text("Total Score: ${state.total}"),
                Text("Chances Left: ${3 - state.zeroCount}"),
                SizedBox(height: 24),
            
                // PrimaryButton(
                //   title:
                //       state.status.isEmpty
                //           ? "Shuffle"
                //           : state.status.contains("lost")
                //           ? "Try Again"
                //           : "Start New Game",
                //   onTap:
                //       state.isShuffling
                //           ? null
                //           : () {
                //               state.status.isEmpty
                //           ?  shuffle.add(StartShuffling())
                //           : 
                //            shuffle.add(ResetShuffle());
                         
                           
                //           },
                // ),
              ],
            ),
         
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32
,          ),
        child: SizedBox(
          height: 50,
          width: double.infinity,
          child: CustomButton(title:     state.status.isEmpty
                          ? "Shuffle"
                          : state.status.contains("lost")
                          ? "Try Again"
                          : "Start New Game",onTap:   state.isShuffling
                          ? null
                          : () {
                              state.status.isEmpty
                          ?  shuffle.add(StartShuffling())
                          : 
                           shuffle.add(ResetShuffle());
                         
                           
                          },)),
      )
    );
  });}
}
