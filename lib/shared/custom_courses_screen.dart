import 'package:flutter/material.dart';
import 'package:studenthelper/models/courses_model.dart';
import 'package:studenthelper/providers/cubit.dart';
import 'package:studenthelper/screens/pdfScreen.dart';

class CustomCoursesScreen extends StatelessWidget {
    final CoursesModel Courses;
    final String year;
    const CustomCoursesScreen(this.year,this.Courses);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 20.0,
      child: Stack(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
                image:    DecorationImage(
                    image: AssetImage('assets/focus.jfif'),
                    fit: BoxFit.fill
                )
            ) ,
          ),
          Container(
            child: Positioned(
              top: 150,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepPurple[50],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    topRight: Radius.circular(50.0),
                  ),
                ),
                height: MediaQuery.of(context).size.height,
                width:  MediaQuery.of(context).size.width,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: Courses.coursesNames.length > 16 ?3:2,
                    childAspectRatio: 1.3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,

                    // childAspectRatio: 2,
                  ),

                  padding: EdgeInsets.only(left: 25,right: 25,top: 25),
                  itemCount: Courses.coursesNames.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Colors.purple[900].withOpacity(.9),
                                Colors.purple[700].withOpacity(.6),
                              ]
                          ),
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(45.0),
                            bottomLeft:  Radius.circular(45.0),
                            topLeft:  Radius.circular(45.0),
                            topRight: Radius.circular(45.0),
                          ),
                        ),
                          child: Center(
                            child: Text(Courses.coursesNames[index],
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.white),),
                          ),

                      ),
                        onTap: () async{
                          StudentCubit.get(context).Files.clear();
                          StudentCubit.get(context).isNoFiles = false;
                          StudentCubit.get(context).getLectures(year,Courses.coursesNames[index]);
                          debugPrint(Courses.coursesNames[index]);
                          Navigator.of(context, ).
                          push(MaterialPageRoute(builder: (BuildContext context) => PdfScreen(Courses.coursesNames[index])),);

                        }
                    );
                  }
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30),
            height: 50,
            child:  IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,),onPressed: (){
              Navigator.pop(context);}),
          )
        ],
      ),
    );
  }
}


