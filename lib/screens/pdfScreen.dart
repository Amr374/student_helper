import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studenthelper/providers/cubit.dart';
import 'package:studenthelper/providers/states.dart';
import 'package:studenthelper/shared/custom_lectures_screen.dart';

class PdfScreen extends StatelessWidget {
   String courseName ;

   PdfScreen(this.courseName);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StudentCubit, StudentStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              elevation: 5,
              title: Text(courseName, style: TextStyle(
                  fontSize: 20, fontFamily: 'Montserrat', color: Colors.white)),
            ),

            body: state is !GetPdfLoadingState ? StudentCubit.get(context).isNoFiles == false ?
            CustomLecturesScreen(StudentCubit.get(context).Files) :
            Center(child: Text('There is No Data'),):
            Center(child: CircularProgressIndicator())
        );
      },
    );
  }
}