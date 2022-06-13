import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:studenthelper/models/pdf_model.dart';
import 'package:studenthelper/providers/states.dart';

class AdminCubit extends Cubit<StudentStates> {
  AdminCubit() : super(GetPdfInitialState());

  static AdminCubit get(context) => BlocProvider.of(context);

  // List<CoursesModel> courses = [];
  List<String> coursesNames = [] ;

  bool isNoData = false;

  void getCoursesNames(year)async {
    emit(GetCoursesLoadingState());
    FirebaseFirestore.instance.collection(year).doc('courses').get().then((value)
    {

      List.from(value.data()['coursesNames']).forEach((element){

        coursesNames.add(element);

      });
      if(coursesNames.isEmpty){
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
  List<Map<String,dynamic>> filesPointList = [];
  void getLectures(year,course) {
    if(Files.length > 0){
      null;
    }else {
      FirebaseFirestore.instance.collection(year).doc(course).get().then((value)
      {

        List.from(value.data()['pdfs']).forEach((element){

          Files.add(PdfModel.fromJson(element));

        });
        List.from(value.data()['pdfs']).forEach((element){

          filesPointList.add(element);

        });

        emit(GetPdfSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(GetPdfErrorState(error.toString()));
      });
    }

  }

  void addCourse(year,name){
    List<String> newCourses = [...coursesNames];
    newCourses.add(name);
    FirebaseFirestore.instance.collection('HTI-CS').
    doc(year).update({'coursesNames':newCourses});
    FirebaseFirestore.instance.collection('HTI-CS').doc(name).set({'pdfs': []});
  }


  void addPdf(courseName,file,fileUrl,fileName)async{
    final ref = FirebaseStorage.instance.ref().child('HTI-CS').child(courseName).child("$fileName" + '.pdf');
    await ref.putFile(file);
    fileUrl = await ref.getDownloadURL();
    print(fileUrl);
    List newFiles = [...filesPointList];
    newFiles.add({'name':fileUrl,'file':fileName});
    FirebaseFirestore.instance.collection('HTI-CS').doc(courseName).update({
      'pdfs': newFiles,
    });
  }

}