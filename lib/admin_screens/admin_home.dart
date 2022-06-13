import 'package:flutter/material.dart';
import 'package:studenthelper/admin_cubit/admin_cubit.dart';
import 'package:studenthelper/admin_screens/add_courses.dart';
import 'package:studenthelper/providers/cubit.dart';
import 'package:studenthelper/screens/pdfScreen.dart';

class AdminHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    List<String> s= ['Year One','Year Two','Year Three','Year Four'];
    return Scaffold(
        appBar: AppBar(
          title: Text('Student Helper',style: TextStyle(color: Colors.white),),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top:60.0),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 4,
              itemBuilder: (context, i) {
                return Column(
                  children: [
                    GestureDetector(
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.pink[900].withOpacity(.9),
                                  Colors.pink[500].withOpacity(.6),
                                ]
                            ),
                            shape: BoxShape.circle,
                            border : Border.all(
                                color: Colors.white, width: 4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(1),
                                blurRadius: 1.0,
                                spreadRadius: 1.0,
                              )
                            ],
                          ),
                          child: Center(child: Text(s[i], style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.normal))),
                        ),

                        onTap: () {
                          if(AdminCubit.get(context).coursesNames != null){
                            AdminCubit.get(context).coursesNames.clear();
                          }
                          AdminCubit.get(context).isNoData = false;
                          AdminCubit.get(context).getCoursesNames(s[i]);
                          // Navigator.of(context, ).push(MaterialPageRoute(builder: (BuildContext context) => AddCoursesScreen(s[i]),),);

                          Navigator.of(context, ).push(
                            MaterialPageRoute(
                              builder: (BuildContext context) => AddCoursesScreen(s[i]),),);

                          // Navigator.pushNamed(
                          //     context, 'AddCoursesScreen', arguments: s[i]);
                        }
                    ),
                    SizedBox(height: 10)
                  ],
                );

              }
          ),
        )
    );
  }
}
