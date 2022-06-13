class CoursesModel {

  List<String> coursesNames = [];


  CoursesModel({

    this.coursesNames,



  });

  CoursesModel.fromJson(Map<String, dynamic> json)
  {
    json['coursesNames'].forEach((element) {
      coursesNames.add((element));
    });


  }
}

