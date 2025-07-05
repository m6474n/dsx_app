// import 'package:dsx_app/controller/home/home_controller.dart';
// import 'package:dsx_app/main.dart';
// import 'package:dsx_app/utils/constants.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder(
//       init: HomeController(),
//       builder: (cont) {
//         return Scaffold(
//           backgroundColor: colorManager.bgColor,
//           body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text("Heading Text", style: defaultHeadingStyle),
//                 Text(
//                   "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
//                   style: defaultParagraphStyle,
//                   textAlign: TextAlign.center,
//                 ),
//                 ElevatedButton(
//                   style: ButtonStyle(
//                   backgroundColor: WidgetStatePropertyAll(colorManager.textColor),
//                   foregroundColor: WidgetStatePropertyAll(colorManager.whiteColor),
                   
//                     shape: WidgetStatePropertyAll(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(
//                           defaultBorderRadius,
//                         ),
//                       ),
//                     ),
//                   ),
//                   onPressed: () {
//                     cont.toggleTheme();
//                   },
//                   child: Text("Change Theme"),
//                 ),
//                 SizedBox(
                 
//                   child: Align(
//                     alignment: Alignment.center,
//                     child: Container(
//                       constraints: BoxConstraints(minWidth: 100, minHeight: 45)
//                       ,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(defaultBorderRadius),
//                         gradient: LinearGradient(colors: [ colorManager.secondaryolor,colorManager.primaryColor,], begin: Alignment.topLeft, end: Alignment.bottomRight)),
//                       child: Center(child: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18),
//                         child: Text("Click Me", style: TextStyle(color: colorManager.whiteColor),),
//                       )),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:dsx_app/bloc/shuffle/shuffle_bloc.dart';
import 'package:dsx_app/bloc/shuffle/shuffle_event.dart';
import 'package:dsx_app/bloc/shuffle/shuffle_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final diceBloc = context.read<ShuffleBloc> ();
    return Scaffold(
      body: BlocBuilder<ShuffleBloc,ShuffleState>(
        builder: (context, state) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  transitionBuilder: (child, anim) => ScaleTransition(scale: anim, child: child),
                  child: Text(
                    '${state.currentNumber}',
                    key: ValueKey(state.currentNumber),
                    style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Total: ${state.total}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Zero Counts: ${state.zeroCount}',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                Text(
                  state.status,
                  style: TextStyle(fontSize: 20, color: Colors.blueAccent),
                ),
                SizedBox(height: 50),
                state.status.isEmpty?
                ElevatedButton(
                  onPressed: state.isShuffling
            ? null
            : () {
                context.read<ShuffleBloc>().add(StartShuffling());
              },
                  child: Text(state.isShuffling ? "Shuffling..." : "Shuffle Dice"),
                ):
                ElevatedButton(onPressed: (){
            context.read<ShuffleBloc>().add(ResetShuffle());
;                }, child: Text('Try Again'))
              ]),
          );

        }
      ),
    );
  }
}
