import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stop_watch_app/provider/my_provider_app.dart';
import 'package:stop_watch_app/screens/first_page.dart';

class SecondPage extends StatelessWidget {
   SecondPage({super.key});
  ScrollController controllerListView=ScrollController();
  final heightListTitle= 35.0;

  @override
  Widget build(BuildContext context) {
    final sendData= ModalRoute.of(context)!.settings.arguments as String;
    final provider= Provider.of<MyProviderApp>(context);
    final heightSize= MediaQuery.sizeOf(context).height;
    final widthSize= MediaQuery.sizeOf(context).width;
    final appBar= AppBar(
      backgroundColor:Color(0xff872341),
      title: Text("${sendData}",
        style: TextStyle(
          color: Color(0xffFFE8B6),
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),),
    );
    final bodyHeight=heightSize-appBar.preferredSize.height- MediaQuery.of(context).padding.top;
   // final bodyWidth=widthSize-appBar.preferredSize.width- MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children:[
                Container(
                  height: bodyHeight*0.4,
                  width: widthSize,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 50,
                    sigmaY: 50,
                  ),
                  child: Container(
                    height: bodyHeight*0.4,
                    width: widthSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${provider.secondTimer(provider.milisecond)} Second", style: TextStyle(
                        color: Color(0xff872341),
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),),
                      //  SizedBox(height: 15,),
                        Text("Lap 1", style: TextStyle(
                        color: Color(0xff872341),
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),),
                         // SizedBox(height: bodyHeight*0.1,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: (){
                                 provider.isVisit? null:provider.start();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff872341),
                                    borderRadius: BorderRadius.circular(100),
                                  ),

                                padding:EdgeInsets.all(10),
                                child:  Text("Start", style: TextStyle(
                                  color: Color(0xffFFE8B6),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),),
                                                            ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  provider.AddTimer();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xff872341),
                                      borderRadius: BorderRadius.circular(100),
                                ),
                                  padding:EdgeInsets.all(10),
                                child:  Text("Lap", style: TextStyle(
                                  color: Color(0xffFFE8B6),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),),
                                                            ),
                              ),
                            GestureDetector(
                              onTap: (){
                                provider.isVisit?provider.stop():null;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color:Color(0xff872341),
                                    borderRadius: BorderRadius.circular(100),
                              ),
                                padding:EdgeInsets.all(10),
                                child:  Text("Stop", style: TextStyle(
                                  color:Color(0xffFFE8B6),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),),
                              ),
                            ),
                          ],)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(height: bodyHeight*0.02,),


          Container(
            child: Expanded(
              child: SizedBox(
                height: bodyHeight*0.8,
                width: widthSize,
                child: Scrollbar(
                  child: ListView.builder(

                    itemExtent: heightListTitle,
                      itemBuilder: (BuildContext, index)=>
                          ListTile(
                         leading: Text("lap ${index}" ,style: TextStyle(
                                   color:Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                 ),),
                         trailing: Text("${provider.secondTimer(provider.laps[index])} Second",style: TextStyle(
                                     color: Colors.red,
                                fontWeight: FontWeight.bold,
                              fontSize: 20,
                             ),),),
                    itemCount: provider.laps.length,
                          ),
                ),
              ),

                  )

              ),

        ],
      ),
    );
  }
}
