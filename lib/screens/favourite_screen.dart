// import 'package:fashion/models/favourite_model.dart';
// import 'package:fashion/providers/cubit.dart';
// import 'package:fashion/providers/states.dart';
// import 'package:fashion/screens/favourites_details.dart';
// import 'package:fashion/screens/product_details.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:studenthelper/providers/favourtie_cubit.dart';
//
//
//
// class Favourites extends StatelessWidget {
//
//
//   @override
//
//   Widget build(BuildContext context) {
//
//     return BlocConsumer<FavouritesCubit, StudentStates>(
//       listener: (context, state) {
//
//       },
//       builder: (context, state) {
//         return FashionCubit.get(context).user != null? Scaffold(
//           backgroundColor: Colors.white,
//           body : FashionCubit.get(context).favourites != null? buildFavourites(FashionCubit.get(context).favourites,context):
//
//
//           FashionCubit.get(context).isNoDataFavourites == false ? Center(child: CircularProgressIndicator()):
//           Center(child: Text('لا يوجد مفضلات حاليا')),
//
//         ):Scaffold(
//           appBar:  AppBar(
//             leading: Text(''),
//             backgroundColor: Colors.purple,
//             title: Text('المفضلات',style: TextStyle(
//                 fontFamily: 'Cairo',
//                 color: Colors.white,
//                 fontSize: 23.0,
//                 fontWeight: FontWeight.w900)),
//           ),
//           backgroundColor: Colors.white,
//           body: ListView(
//             children: [
//               Container(
//                 height: MediaQuery.of(context).size.height/2 ,
//                 width: MediaQuery.of(context).size.width-100 ,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage('assets/sign.jpg'),
//                         fit: BoxFit.cover
//                     )
//                 ),
//               ),
//               Container(
//                 // height: MediaQuery.of(context).size.height-100 ,
//                 width: MediaQuery.of(context).size.width-100 ,
//
//                 child: Center(
//                   child: Text('انت غير مسجل دخول نحتاج تسجيل دخولك',style: TextStyle(
//                       fontFamily: 'Cairo',
//                       color: Colors.black,fontSize: 20),),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//
//
//   }
//
//
//
//
//
//   Widget buildFavourites(List<FavouriteModel> favourites,context) {
//     return Scaffold(
//         appBar:  AppBar(
//           leading: Text(''),
//           backgroundColor: Colors.purple,
//           title: Text('المفضلات',style: TextStyle(
//               fontFamily: 'Cairo',
//               color: Colors.white,
//               fontSize: 23.0,
//               fontWeight: FontWeight.w900)),
//         ),
//         backgroundColor: Colors.white,
//         body: ListView.builder(
//           // shrinkWrap: true,
//           // physics: NeverScrollableScrollPhysics(),
//             scrollDirection: Axis.vertical,
//             itemCount: favourites.length,
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 child: Container(
//                   height: MediaQuery.of(context).size.height * 0.20,
//                   child: Stack(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top:15,right: 10.0,left: 10),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               border: Border.all(color: Colors.white,width: 5),
//                               gradient: LinearGradient(
//                                   colors: [
//                                     Colors.purple[700].withOpacity(0.9),
//                                     Colors.purple[700].withOpacity(.3),
//                                   ]
//                               ),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Colors.grey,
//                                     blurRadius: 2,
//                                     offset: Offset(5.5,5.5)
//                                 )
//                               ]
//
//
//                           ),
//
//                           height: MediaQuery.of(context).size.height * 0.15,
//
//
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 8.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               textDirection: TextDirection.rtl,
//                               children: [
//                                 Container(
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       // border: Border.all(color: Colors.black38),
//                                       // color: Colors.white,
//                                       image: DecorationImage(
//                                           image: NetworkImage(favourites[index].imageUrl[0],)
//                                           ,fit: BoxFit.fill
//                                       )
//
//
//
//                                   ),
//                                   height: MediaQuery.of(context).size.height * 0.15,width: 100,
//                                 ),
//                                 Text(favourites[index].name,style: TextStyle(
//                                     fontFamily: 'Cairo',
//                                     color: Colors.white,
//                                     fontSize: 15.0,
//                                     fontWeight: FontWeight.w900)),
//                                 // SizedBox(width: 50,),
//                                 Text(favourites[index].price.toString(),style: TextStyle(
//                                     fontFamily: 'Cairo',
//                                     color: Colors.white,
//                                     fontSize: 15.0,
//                                     fontWeight: FontWeight.w900)) ,
//                                 // SizedBox(width: 50,),
//                                 Text(favourites[index].shopName,style: TextStyle(
//                                     fontFamily: 'Cairo',
//                                     color: Colors.white,
//                                     fontSize: 15.0,
//                                     fontWeight: FontWeight.w900)),
//                               ],
//
//
//
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         child: GestureDetector(
//                             child: Container(
//                               width: 50,
//                               height: 30,
//                               color: Colors.red[900],
//                               child: Center(child: Text('حذف',style: TextStyle(fontFamily: 'Cairo',color: Colors.white),)),
//                             ),
//                             onTap: ()async{
//                               await FashionCubit.get(context).removeFavouriteDirect(index);
//                               for(var product in FashionCubit.get(context).products){
//                                 if(product.Desc == favourites[index].Desc){
//                                   product.isFav = false;
//                                 }
//                               }
//                               FashionCubit.get(context).favourites.clear();
//                               FashionCubit.get(context).favouritespointlist.clear();
//                               FashionCubit.get(context).isNoDataFavourites = false;
//                               FashionCubit.get(context).getFavourites();
//
//                             }
//                         ),
//                         left: 10,
//                         top: 5,
//                       )
//                     ],
//                   ),
//                 ),
//                 onTap: (){
//                   Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => FavouriteDetails(favourites[index])));
//
//                 },
//               );
//
//             }
//         )
//     );
//   }
// }
