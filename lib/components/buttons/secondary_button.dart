import 'package:dsx_app/bloc/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondaryButton extends StatelessWidget {
    final String title;
  final VoidCallback? onTap;
  const SecondaryButton({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = context.read<ThemeBloc>();
    return  ElevatedButton(
                  style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(onTap!=null?  theme.state.textColor: Colors.grey ),
                  foregroundColor: WidgetStatePropertyAll(  theme.state.btnTextColor),

                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                      theme.state.   defaultBorderRadius,
                        ),
                      ),
                    ),
                  ),
                  onPressed: onTap
,                   child: Text(title),
                );
  }
}
