import 'package:flutter/material.dart';
import 'dart:io' show Platform;
class FirstPage extends StatelessWidget {
 final forkey= GlobalKey<FormState>();
 final  nameController=TextEditingController();
   FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
     final heightSize= MediaQuery.sizeOf(context).height;
     final widthSize= MediaQuery.sizeOf(context).width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:
      Column(
         //mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           Container(
             height: heightSize*0.30,
             width: widthSize,
            color: Color(0xff872341),
            child: Center(
              child: Text("Log In",
              style: TextStyle(
                color: Color(0xffFFE8B6),
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),),
            ),
                 ),
           SizedBox(height: heightSize*0.18,),
           Form(
             key:forkey,
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(

                 children: [
                   TextFormField(
                     controller: nameController,
                     validator: (data){
                       if(data == null ||  data.isEmpty){
                         return "name Invalid";
                       }
                       return null;
                     },
                     decoration: InputDecoration(
                       label: Text("name"),
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(15),
                       ),
                       enabledBorder: OutlineInputBorder(
                         borderSide: BorderSide(color: Color(0xffFFE8B6),width: 2.0),
                       )
                     ),
                   ),
                   SizedBox(height: heightSize*0.02,),
                   TextFormField(
                     validator: (data){
                       if(data == null ||  data.isEmpty){
                         return "Email Invalid";
                       }
                       final bool emailValid =
                       RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                           .hasMatch(data);
                       if(!emailValid){
                         return "Email Invalid";
                       }
                       return null;
                     },
                     decoration: InputDecoration(
                         label: Text("Email"),
                         border: OutlineInputBorder(
                           borderRadius: BorderRadius.circular(15),
                         ),
                         enabledBorder: OutlineInputBorder(
                           borderSide: BorderSide(color:Color(0xffFFE8B6),width: 2.0),
                         )
                     ),
                   ),
                 ],
               ),
             ),
           ),

           SizedBox(height: heightSize*0.12,),
           GestureDetector(
             onTap: (){
               if(forkey.currentState!.validate()){
                 Navigator.pushNamed(context,"SecondPage",arguments: nameController.text);
               }
             },
             child: Container(
              height: heightSize*0.08,
                width:widthSize*0.5,
               child: Center(
                 child: Text("Get Start",style: TextStyle(
                   fontSize: 20,
                 ),),
               ),
               decoration: BoxDecoration(
                 color: Color(0xffFFE8B6),
                 borderRadius: BorderRadius.circular(20),
               ),
             ),
           )
         ],
       )
    ) ;
  }
}

// class CustomCliper extends CustomClipper<Path>{
//   @override
//   Path getClip(Size size) {
//
//     Path path =Path();
//     path.lineTo(0, 0);
//     //path.lineTo(0, size.height*0.30);
//      // path.cubicTo(0, size.height*0.30, size.width*0.25, size.height*0.20, size.width*0.75, size.height*0.25);
//      // path.cubicTo(size.width*0.75, size.height*0.25, size.width*0.85, size.height*0.30, size.width, size.height*0.20);
//
//     // First curve (left to center)
//     //path.cubicTo(
//       //  size.width * 0.25, size.height * 0.40,
//         //size.width * 0.75, size.height * 0.20,
//         //size.width, size.height * 0.30);
//
//     // Close the p
//     //path.lineTo(size.width, 0);
//
//
//     path.close();
//     return Path();
//   }
//
//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//
//     return false;
//   }
//
//
// }