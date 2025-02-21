import 'dart:async';

import 'package:flutter/widgets.dart';

class MyProviderApp with ChangeNotifier{
   int milisecond =0;
   int sec=0;
   List laps=[];
   bool isVisit=false;
  Timer? timer;

   void start(){
   timer=Timer.periodic(Duration(
   milliseconds: 100,
   ),
   (timer){
   milisecond +=100;
   isVisit=true;
   notifyListeners();
   }
   );


   }

   String secondTimer(int  milis ){

     final sec = milis / 1000;
     notifyListeners();
     return '$sec';

   }

   void stop(){
     if (isVisit) {
       timer!.cancel();
       isVisit=false;
       notifyListeners();
     }
   }

   void AddTimer(){
   laps.add(milisecond);
   milisecond=0;
    notifyListeners();
   }

}

