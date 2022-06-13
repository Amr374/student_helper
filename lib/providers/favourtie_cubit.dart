// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:studenthelper/models/courses_model.dart';
// import 'package:studenthelper/models/favourites_model.dart';
// import 'package:studenthelper/models/pdf_model.dart';
// import 'package:studenthelper/providers/states.dart';
//
// class FavouritesCubit extends Cubit<StudentStates> {
//   FavouritesCubit() : super(GetPdfInitialState());
//
//   static FavouritesCubit get(context) => BlocProvider.of(context);
//
//
//   var user =FirebaseAuth.instance.currentUser ;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   List<String> favourites = [];
//
//   bool isNoDataFavourites = false;
//   void getFavourites()async {
//     emit(GetFavoritesLoadingState());
//     await  FirebaseFirestore.instance.collection('users').doc(user.uid).get().then((value)
//     {
//       List.from(value.data()['favourites']).forEach((element){
//
//         favourites.add(element);
//
//       });
//       if(favourites.isEmpty){
//         isNoDataFavourites = true;
//         emit(IsNoFavoritesDataSuccessState());
//       }
//
//
//       emit(GetFavoritesSuccessState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(GetFavoritesErrorState(error.toString()));
//     });
//     // print(favourites[0].name);
//
//   }
//   void addFavourite(String course)async{
//     emit(AddFavoritesLoadingState());
//
//     List<String> newFavourites= [...favourites];
//     newFavourites.add(course);
//
//     products[index].isFav = true;
//
//     Map<String, dynamic> tes = {
//
//       'favourites': newFavourites,
//     };
//
//     try {
//       await FirebaseFirestore.instance.collection('users').doc(user.uid).update(tes);
//       emit(AddFavoritesSuccessState());
//
//     }
//     catch (error) {
//       print(error.toString());
//
//     }
//
//   }
//
//
// }