import 'package:flutter/material.dart';
import 'package:studenthelper/models/pdf_model.dart';
import 'package:studenthelper/screens/pdf_view.dart';

class CustomLecturesScreen extends StatelessWidget {
  List<PdfModel> Files = [];
   CustomLecturesScreen(this.Files);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Files.length > 16 ?3:2,
              childAspectRatio: .7,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,

              // childAspectRatio: 2,
            ),

            padding: EdgeInsets.only(left: 15,right: 15,top: 25),
            itemCount: Files.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:BorderRadius.circular(25.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: 400,
                          decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(25.0),

                              image: DecorationImage(
                                  image: AssetImage('assets/pdfLogo.png',),
                                  fit: BoxFit.fill
                              )
                          ),
                        ),
                        SizedBox(height: 20,),
                        Center(
                          child: Text(
                            Files[index].name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 25.0,
                              // height: 1.3,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: ()  async{
                    Navigator.of(context, ).
                    push(MaterialPageRoute(builder: (BuildContext context) => PdfS(Files[index].file),),);
                  }
              );
            }
        ),
      ),
    );
  }
}
