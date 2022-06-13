import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:studenthelper/admin_cubit/admin_cubit.dart';
import 'package:studenthelper/models/pdf_model.dart';
import 'package:studenthelper/providers/cubit.dart';
import 'package:studenthelper/providers/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studenthelper/shared/arguments_class.dart';

class AddPdfScreen extends StatelessWidget {
  String arg;
  String name;
  AddPdfScreen(this.arg,this.name);
  File file;
  String fileUrl;
  String fileName;
  void getFileFromDevice(context) async{
    FilePickerResult result = await FilePicker.platform.pickFiles();
     fileName = result.files.first.name;
    if (result != null) {
       file = File(result.files.single.path);
      // Navigator.pop(context);

    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    ArgModel arg =  ModalRoute.of(context).settings.arguments;
    return BlocConsumer<AdminCubit, StudentStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(backgroundColor: Colors.white,
              elevation: 5,
              leading: IconButton(icon: Icon(Icons.arrow_back,color: Color(0xff9e58b1),),onPressed: (){
                Navigator.pop(context);}),
              title: Text('pOP',style: TextStyle(fontSize: 25 ,fontFamily: 'Montserrat',color: Color(0xff9e58b1))),
            ),

            body :
            // builderWidget(AdminCubit.get(context).Files,context,arg)
            AdminCubit.get(context).Files.length != null ? builderWidget(AdminCubit.get(context).Files,context,arg): Center(
                child: CircularProgressIndicator())
        );
      },
    );
  }

  Widget builderWidget(List<PdfModel> model, context,ArgModel arg) =>
      Padding(
        padding: const EdgeInsets.only(top:10.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Container(
                // color: Colors.grey[300],
                child: GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0,
                  childAspectRatio: 1 / 1.58,
                  children: List.generate(
                    model.length,
                        (index) =>
                        buildGridProduct(model[index], context,arg),
                  ),
                ),
              ),
          GestureDetector(
          child: Container(
          child: Text('Add PDF'),
                                   ),
              onTap: () async{
                await getFileFromDevice(context);
                AdminCubit.get(context).addPdf(arg.courseName, file, fileUrl, fileName);

              }
              )

            ],
          ),
        ),
      );


  Widget buildGridProduct(PdfModel model, context,ArgModel arg) => GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              // Image(
              //   image: NetworkImage(model.file),
              //   width: double.infinity,
              //   height: 200.0,
              // ),
              Container(
                child:Image(
                  image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/final-app-c339e.appspot.com/o/catedories%2Fmonit.jfif?alt=media&token=84c84917-3d50-4007-9817-3348089bdc9a'),
                  width: double.infinity,
                  height: 200.0,
                ),
              ),

            ],
          ),
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.0,
                        height: 1.3,
                      ),
                    ),


                  ]))
        ],
      ),
      onTap: ()  async{

      }
  );
}