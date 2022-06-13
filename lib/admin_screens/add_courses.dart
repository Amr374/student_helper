import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studenthelper/admin_cubit/admin_cubit.dart';
import 'package:studenthelper/admin_screens/add_pdf.dart';
import 'package:studenthelper/models/courses_model.dart';
import 'package:studenthelper/models/pdf_model.dart';
import 'package:studenthelper/providers/cubit.dart';
import 'package:studenthelper/providers/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studenthelper/shared/arguments_class.dart';
import 'package:studenthelper/shared/components.dart';

class AddCoursesScreen extends StatelessWidget {
  String arg;
  AddCoursesScreen(@required this.arg);
  var nameController = TextEditingController();
  var formKey =   GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // String arg = ModalRoute.of(context).settings.arguments;
    return BlocConsumer<AdminCubit, StudentStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(backgroundColor: Colors.pink[200],
              elevation: 5,
            //   leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,),onPressed: (){
            //     // Navigator.pushNamed(context, 'ProductScreen');}),
            //   title: Text('Return',style: TextStyle(fontSize: 25 ,fontFamily: 'Montserrat',color: Colors.white)),
            // ),
            ),
            body : AdminCubit.get(context).coursesNames !=null ?
            builderWidget(AdminCubit.get(context).coursesNames,arg,context): Center(
                child: CircularProgressIndicator())
        );
      },
    );
  }

  Widget builderWidget(List<String> coursesNames,String arg, context) =>
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
                    coursesNames.length,
                        (index) =>
                        buildGridProduct(coursesNames[index], context,arg),
                  ),
                ),
              ),
              GestureDetector(
                child: Container(
                  child: Text('Add Course'),
                ),
                onTap: (){
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 200,
                          color: Colors.amber,
                          child: Center(
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  defaultFormField(controller: nameController,
                                      type: TextInputType.text,
                                      validate: (String value){
                                        if (value.isEmpty){
                                          return 'name must be not empty';
                                        }else{
                                          return null;
                                        }

                                      },
                                      label: "Course Name",
                                      prefix: Icons.title),
                                  SizedBox(
                                    height: 15,
                                  ),

                                  const Text('Modal BottomSheet'),
                                  ElevatedButton(
                                    child: const Text('Add'),
                                    onPressed: () {
                                      if(formKey.currentState.validate()) {
                                        AdminCubit.get(context).addCourse(arg,nameController.text.toString());

                                      } else{
                                        print('sfsf');
                                      }
                                      Navigator.pop(context);
                                    }
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                  );


                },
              )
            ],
          ),
        ),
      );


  Widget buildGridProduct(String model, context,String arg) => GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Container(
                child:Image(
                  image: NetworkImage('https://firebasestorage.googleapis.com/v0/b/student-helper-5b9ac.appspot.com/o/download.jfif?alt=media&token=20a7a168-d063-4178-8367-4aac8ed500c0'),
                  width: 100,
                  height: 100.0,

                ),
              ),

            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left:35.0),
            child:Text(
              model,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 25.0,
                height: 1.3,

              ),
            ),)
        ],
      ),
      onTap: () async{
        AdminCubit.get(context).Files.clear();
        AdminCubit.get(context).getLectures(arg,model);
        print(model);
        Navigator.of(context, ).push(MaterialPageRoute(builder: (BuildContext context) => AddPdfScreen(arg,model),),);

        // Navigator.pushNamed(context, 'AddPdfScreen',arguments: ArgModel(arg, model.name) );
        // getFileFromUrl(model.file);
      }
  );
}