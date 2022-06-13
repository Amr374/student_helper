import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studenthelper/models/courses_model.dart';
import 'package:studenthelper/models/pdf_model.dart';
import 'package:studenthelper/providers/states.dart';

class StudentCubit extends Cubit<StudentStates> {
  StudentCubit() : super(GetPdfInitialState());

  static StudentCubit get(context) => BlocProvider.of(context);

  // List<CoursesModel> courses = [];
  CoursesModel coursesNames =  CoursesModel() ;

   bool isNoData = false;

  void getCoursesNames(year)async {
    emit(GetCoursesLoadingState());
     FirebaseFirestore.instance.collection(year).doc('courses').get().then((value)
    {

      coursesNames = CoursesModel.fromJson(value.data());

      if(coursesNames.coursesNames.isEmpty){
        isNoData = true;

        print('sf');

      }

      emit(GetCoursesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetCoursesErrorState(error.toString()));
    });

  }


  List<PdfModel> Files = [];
  bool isNoFiles = false;
  void getLectures(year,course) {

    if(Files.length > 0){
      null;
    }else {
      emit(GetPdfLoadingState());
    FirebaseFirestore.instance.collection(year).doc(course).get().then((value)
    {

      List.from(value.data()['pdf']).forEach((element){

        Files.add(PdfModel.fromJson(element));

      });
      if(Files.isEmpty){
        isNoFiles = true;


      }
    emit(GetPdfSuccessState());
    }).catchError((error) {
    print(error.toString());
    emit(GetPdfErrorState(error.toString()));
    });
    }

  }
// void update(){
//   // pointlist.
//   if(CoursesNamess.Lectures != null){
//     CoursesNamess.Lectures[0] = 's';
//     Map<String,List> tes = {"Lectures": CoursesNamess.Lectures,'Links':CoursesNamess.Links};
//     //هنا الابديت مااب ال tes دي ماب /فانت هتبعت كل الليستس ال في ال في الدوكيومنت
//   FirebaseFirestore.instance.collection('yearThree').doc('Lectures').update(tes);
// }}

}