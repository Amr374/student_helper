import 'package:flutter/material.dart';
import 'package:studenthelper/providers/cubit.dart';
import 'package:studenthelper/screens/courses_screen.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    List<String> names = ['First Level','Second Level','Third Level','Fourth Level'];
    List<String> s= ['yearOne','yearTwo','yearThree','yearFour'];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[900],
          title: Text('Student Helper',style: const TextStyle(color: Colors.white),),
        ),

      body: Padding(
          padding: const EdgeInsets.only(top:10.0),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 4,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    GestureDetector(
                      child: Container(
                        height: 150,
                        width: 175,

                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.purple[900].withOpacity(.9),
                                Colors.purple[500].withOpacity(.6),
                              ]
                          ),
                          borderRadius:const BorderRadius.only(
                            bottomRight: Radius.circular(15.0),
                            bottomLeft:  Radius.circular(110.0),
                            topLeft:  Radius.circular(15.0),
                            topRight: Radius.circular(110.0),
                          ),
                          // shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.white, width: 5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(1),
                              blurRadius: 1.0,
                              spreadRadius: 1.0,
                            )
                          ],
                        ),
                        child: Center(child: Text(names[i], style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w900))),
                      ),

                      onTap: () {
                        if(StudentCubit.get(context).coursesNames.coursesNames != null){
                          StudentCubit.get(context).coursesNames.coursesNames.clear();
                        }
                        StudentCubit.get(context).isNoData = false;
                        StudentCubit.get(context).getCoursesNames(s[i]);
                        Navigator.of(context, ).push(MaterialPageRoute(builder: (BuildContext context) => CoursesScreen(s[i]),),);
                      }
                    ),
                    const SizedBox(height: 10)
                  ]
                );

              }
          ),
        )
    );
  }
}
