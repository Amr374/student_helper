class PdfModel {
  String name;
  String file;


  PdfModel({
    this.name,
    this.file,

  });

  PdfModel.fromJson(Map<String, dynamic> json)
  {

    name = json['name'];
    file = json['file'];

  }

  Map<String, dynamic> toMap()
  {
    return {
      'name':name,
      'file':file,

    };
  }
}
class CoursesNamesModel {
  String name;



  CoursesNamesModel({
    this.name,


  });

  CoursesNamesModel.fromJson(Map<String, dynamic> json)
  {

    name = json['name'];


  }

  Map<String, dynamic> toMap()
  {
    return {
      'name':name,


    };
  }
}
class CoursesNames {

  List<String> Lectures = [];
  List<String> Links = [];


  CoursesNames({

    this.Lectures,
    this.Links


  });

  CoursesNames.fromJson(Map<String, dynamic> json)
  {
    json['Lectures'].forEach((element) {
      Lectures.add((element));
    });
     json['Links'].forEach((element) {
      Links.add((element));
    });
  }
}
  //
  // Map<String, dynamic> toMap()
  // {
  //   return {
  //     'name':name,
  //
  //
  //   };
  // }
// }
// class ProductModel
// {
//
//   String name;
//
//
//   ProductModel.fromJson(Map<String, dynamic> json)
//   {
//     name = json['name'];
//
//   }
