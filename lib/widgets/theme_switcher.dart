import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppygo_adminepanel/logic/themebloc/cubit/themechange_cubit.dart';
import 'package:shoppygo_adminepanel/utils/sharedpref.dart';

class theme_switcher extends StatefulWidget {
  const theme_switcher({super.key});

  @override
  State<theme_switcher> createState() => _theme_switcherState();
}

class _theme_switcherState extends State<theme_switcher> {
  @override
  late bool _change;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (CacheData.getData('theme') != null) {
      _change = !CacheData.getData('theme')!;
    } else {
      _change = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _change,
      onChanged: (value) {
        setState(() {
          _change = value;
        });
        BlocProvider.of<ThemechangeCubit>(context).changetheme();
      },
    );
  }
}
