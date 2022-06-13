import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studenthelper/providers/cubit.dart';
import 'package:studenthelper/providers/states.dart';
import 'package:studenthelper/shared/custom_courses_screen.dart';

class CoursesScreen extends StatelessWidget {
  String arg;

  CoursesScreen(this.arg);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentCubit, StudentStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
            body: state is! GetCoursesLoadingState ? StudentCubit.get(context).isNoData == true ?
            Center(child: Text('There is No Data', style: TextStyle(fontSize: 15,),)) :
            CustomCoursesScreen(arg,StudentCubit.get(context).coursesNames) :
            Center(child: CircularProgressIndicator())
        );
      },
    );
  }
}
