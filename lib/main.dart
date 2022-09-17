import 'dart:math';

import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Puzzle game',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key,}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  Tween<double> _scaleTween = Tween<double>(begin: 1,end: 2);

  late int moveCount;
  late int hover_ ;
  late String themeColor;




  Color? getColor (String color,int value) {
   var _color = Colors.red[value];  
   switch(color) {
      case "pink": { 
         _color = Colors.pink[value];
      } 
      break; 
  
      case "purple": { 
         _color = Colors.purple[value]; 
      } 
      break; 

      case "teal": { 
         _color = Colors.teal[value]; 
      } 
      break; 

       case "orange": { 
         _color = Colors.orange[value]; 
      } 
      break; 
      
      default: { 
         _color = Colors.yellow[value];  
      }
      break; 
   } 
   return _color;
}

Color getColor2 (String color) {
   var _color = Color(0xFF00897B);  
   switch(color) {
      case "pink": { 
         _color = Color(0xFFD81B60);
      } 
      break; 
  
      case "purple": { 
         _color = Color(0xFF8E24AA); 
      } 
      break; 

       case "orange": { 
         _color = Color(0xFFFB8C00); 
      } 
      break;

      case "teal": { 
         _color = Color(0xFF00897B); 
      } 
      break; 
      
      default: { 
         _color =  Color(0xFF00897B); ;  
      }
      break; 
   } 
   return _color;
}



  
   List<String> count_ = [  
    "1",  
    "2",  
    "3",  
    "4",
    "5",  
    "6",
    "7",  
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16" 
  ];

  List<String> items = [  
    "1",  
    "2",  
    "3",  
    "4",
    "5",  
    "6",
    "7",  
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16" 
  ];
  List<int> colors_ =[
    100,
    200,
    200,
    300,
    300,
    400,
    400,
    500,
    500,
    600,
    600,
    700,
    700,
    800,
    800,
    900,


  ];

  List shuffle(List items) {
  var random = new Random();

  for (var i = items.length - 2; i > 0; i--) {

    var n = random.nextInt(i + 1);

    var temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }

  return items;
}

   @override
  void initState() {
    shuffle(items);
    moveCount = 0;
    hover_ = 0;
    themeColor = "teal";
    
    
    super.initState();
  }

  int itemCount = 16;
  int w_control = 16;

  void Swap ( int a, int b)
  {
    int c = a; 
    a = b; 
    b = c;
  }
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: getColor(themeColor, 200),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 70,),
            RichText(
              text: TextSpan(
                  style: const TextStyle(color: Colors.black, fontSize: 36),
                  children: <TextSpan>[
                    TextSpan(text: moveCount.toString(), style: TextStyle(color: getColor(themeColor, 900), shadows: [
                    Shadow(
                        blurRadius: 10.0,
                        color: getColor2(themeColor),
                        offset: const Offset(5.0, 5.0),
                        ),
                    ],)),
                    TextSpan(text: ' moves ',style: TextStyle(fontSize: 20,color:  getColor(themeColor, 800),

                    shadows: [
                      Shadow(
                          blurRadius: 5.0,
                          color: getColor2(themeColor),
                          offset: const Offset(1.0, 5.0),
                          ),
                      ],
                      )),
                    //TextSpan(text: 'com', style: TextStyle(decoration: TextDecoration.underline))
                  ],
              ),
            ),
            //RichText(moveCount.toString()+" moves"),
            const SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                Column(
                  children: [
                    RichText(text:TextSpan(
                      style: const TextStyle(color: Colors.black, fontSize: 80),
                      children: <TextSpan>[
                        TextSpan(text: "Puzzle", style: TextStyle(color: getColor(themeColor, 900), shadows: [
                        Shadow(
                            blurRadius: 10.0,
                            color: getColor2(themeColor),
                            offset: const Offset(5.0, 5.0),
                            ),
                        ],)),
                        
                        
                      ],
                    ),
                    ),
                    Text("with fun",style: TextStyle(fontSize: 20,color:  getColor(themeColor, 800),
                        shadows: [
                          Shadow(
                              blurRadius: 5.0,
                              color: getColor2(themeColor),
                              offset: const Offset(1.0, 5.0),
                              ),
                          ],
                          )),
                  ],
                ),
              

                const SizedBox(width: 100,),

                items != [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15] ? Center(
                  child: Container(
                    height: 450,
                    width: 450,
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                        color:  getColor(themeColor, 200),
                        boxShadow: [
                          BoxShadow(
                            color: getColor2(themeColor),
                            blurRadius: 25.0, // soften the shadow
                            spreadRadius: 5.0, //extend the shadow
                            offset: const Offset(
                              1,
                              1,
                              
                            ),
                          )
                        ],
                    ),
                    child: Container(  
                          height: 400,
                          width: 400,
                         
                          padding: const EdgeInsets.all(14.0),  
                          child: GridView.builder(  
                            itemCount: count_.length,  
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(  
                                crossAxisCount: 4,  
                                crossAxisSpacing: 8.0,  
                                mainAxisSpacing: 8.0  
                            ),  
                            itemBuilder: (BuildContext context, int index){
                              var ind = index+1;
                              
                             return InkWell(
                                
                                onTap: (){
                                  

                                  print(count_[index]);
                                  var cnt = int.parse(count_[index]);
                                  if((cnt + 4) == w_control){
                                     w_control = cnt;
      
                                     var temp = items[w_control-1];
                                     items[w_control-1] = items[(w_control - 1 ) + 4];
                                     items[(w_control - 1 ) + 4] = temp;
      
                                     print(items);
      
                                    
                                  }
                                  if((cnt - 4) == w_control){
                                     w_control = cnt;
                                     
                                     
                                   var temp = items[w_control-1];
                                    items[w_control-1] = items[w_control-5];
                                    items[w_control-5] = temp;
      
                                    print(items);
                                   
                                  }
                                  if((cnt + 1) == w_control){
                                    w_control = cnt;
                                    var temp = items[w_control-1];
                                    items[w_control-1] = items[w_control];
                                    items[w_control] = temp;
                                    print(items);
      
                                  }
                                  if((cnt - 1) == w_control){
                                    w_control = cnt;
      
                                    print("label -- >"+items[w_control-2]+"  index "+(w_control-2).toString());
                                    print("label -- >"+items[w_control-1]+"  index "+(w_control-1).toString());
      
                                    var temp = items[w_control-2];
                                    items[w_control-2] = items[w_control-1];
                                    items[w_control-1] = temp;
                                    print(items);
      
                                  }
                                  setState(() {
                                    w_control;
                                    items;
                                    (int.parse(count_[index]) == w_control) ?moveCount++:moveCount;
                                    
                                  });
                                  print("control $w_control");
                                  print(items);
                                  print("moves $moveCount");
      
                                },
                                onHover: (isHovering) {
                                  if (isHovering) {
                                    setState(() {
                                      hover_ = index;
                                    });
                                  
                                   print("hovering $isHovering");
                                   
                                  } else {
                                    setState(() {
                                       hover_ = index;
                                    });
                                   
                                    print("hovering $isHovering   $index");
                                  }
                                },
                                child: AnimatedContainer(
                                  padding: const EdgeInsets.all(10.0),
                                  duration: const Duration(milliseconds: 300),
                                  decoration: BoxDecoration(
                                    // image: DecorationImage(
                                    //   image: AssetImage("images/bird.jpg"),
                                    //   fit: BoxFit.cover,
                                    // ), 
                                    borderRadius: items[hover_] == items[index] ? BorderRadius.circular(21):BorderRadius.circular(10),
                                    color: (int.parse(count_[index]) == w_control) ? Colors.white:getColor(themeColor, colors_[int.parse(items[index])-1]),
                                    //Colors.teal[colors_[int.parse(items[index])-1]],
                                    boxShadow:(int.parse(count_[index]) == w_control) ? [
                                      const BoxShadow(color: Colors.white, blurRadius: 5.0, offset: Offset.zero),
                                    ] : [
                                      BoxShadow(color: getColor2(themeColor), blurRadius: 5.0, offset: Offset.zero),
                                    ],
                                  ),
      
                                  child: Center(
                                    child: Text(
                                    items[index],
                                    style: TextStyle(fontSize: (int.parse(count_[index]) == w_control) ? 1:30,color: (int.parse(count_[index]) == w_control) ? Colors.white:Colors.white,),
                                    
                                  )),
                                  //child: Image.network(images[index])
                                ),
                              ); 
                            },  
                          )),
                  ),
                ):Center(
                  child: Container(
                    height: 450,
                    width: 450,
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                        color:  getColor(themeColor, 200),
                        boxShadow: [
                          BoxShadow(
                            color: getColor2(themeColor),
                            blurRadius: 25.0, // soften the shadow
                            spreadRadius: 5.0, //extend the shadow
                            offset: const Offset(
                              1,
                              1,
                              
                            ),
                          )
                        ],
                    ),
                    child: Center(
                      child: RichText(text:TextSpan(
                      style: const TextStyle(color: Colors.black, fontSize: 75),
                      children: <TextSpan>[
                        TextSpan(text: "Winner!!", style: TextStyle(color: getColor(themeColor, 900), shadows: [
                        Shadow(
                            blurRadius: 10.0,
                            color: getColor2(themeColor),
                            offset: const Offset(5.0, 5.0),
                            ),
                        ],)),
                        
                        
                      ],
                    ),
                    ),
                    ),
                  ),
                ),

                const SizedBox(width: 100,),

                //restart button
                GestureDetector(
                onTap: (){
                  setState(() {
                    
                    moveCount = 0;
                    itemCount = 16;
                    w_control = 16;
                    shuffle(items);

                  });
                  
                },
                child: Container(
                  
                  width: 150,
                  height: 70,
                  decoration: BoxDecoration(
                    color: getColor(themeColor,400),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: getColor2(themeColor),
                        blurRadius: 10.0, // soften the shadow
                        spreadRadius: 3.0, //extend the shadow
                        offset: const Offset(
                          1,1// Move to bottom 10 Vertically
                        ),
                      )
                    ],

                  ),
                  child: Center(child: Text("Restart",style: TextStyle(fontSize: 20,color: Colors.white,
                    shadows: [
                      Shadow(
                          blurRadius: 10,
                          color: getColor2(themeColor),
                          offset: const Offset(5.0, 5.0),
                          ),
                      ],
                  ),)),),
              )


              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      themeColor = "teal";
                    });
                  },
                  child: Container(
                    width: themeColor == "teal" ? 90:70,
                    height: themeColor == "teal" ? 90:70,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                      color: Colors.teal,
                      boxShadow: [
                        BoxShadow(
                          color:  getColor2(themeColor),
                         blurRadius: themeColor == "teal" ? 5:15.0, // soften the shadow
                          spreadRadius: themeColor == "teal" ? 2:5.0,
                          offset: const Offset(
                            1,
                            1,
                            
                          ),
                        )
                      ],
                  ),
                    
                  ),
                ),
                const SizedBox(width:30.0,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      themeColor = "purple";
                    });
                  },
                  child: Container(
                    width: themeColor == "purple" ? 90:70,
                    height: themeColor == "purple" ? 90:70,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                      color: Colors.purple,
                      boxShadow: [
                        BoxShadow(
                          color: getColor2(themeColor),
                          blurRadius: themeColor == "purple" ? 5:15.0, // soften the shadow
                          spreadRadius: themeColor == "purple" ? 2:5.0,//extend the shadow
                          offset: const Offset(
                            1,
                            1,
                            
                          ),
                        )
                      ],
                  ),),
                ),
                const SizedBox(width:30.0,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      themeColor = "orange";
                    });
                  },
                  child: Container(
                    width: themeColor == "orange" ? 90:70,
                    height: themeColor == "orange" ? 90:70,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                      color: Colors.orange,
                      boxShadow: [
                        BoxShadow(
                          color:  getColor2(themeColor),
                          blurRadius: themeColor == "orange" ? 5:15.0, // soften the shadow
                          spreadRadius: themeColor == "orange" ? 2:5.0,//extend the shadow
                          offset: const Offset(
                            1,
                            1,
                            
                          ),
                        )
                      ],
                  ),),
                ),
                const SizedBox(width:30.0,),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      themeColor = "pink";
                    });
                  },
                  child: Container(
                   width: themeColor == "pink" ? 90:70,
                    height: themeColor == "pink" ? 90:70,
                    decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                      color: Colors.pink,
                      boxShadow: [
                        BoxShadow(
                          color:  getColor2(themeColor),
                          blurRadius: themeColor == "pink" ? 5:15.0, // soften the shadow
                          spreadRadius: themeColor == "pink" ? 2:5.0, //extend the shadow
                          offset: const Offset(
                            1,
                            1,
                            
                          ),
                        )
                      ],
                  ),),
                ),
                const SizedBox(width: 30.0,)
               

              ],

            ),
            
      
          
          ],
      
        ),
      ),  
      ); 
    
  }
}


enum ConfirmAction { Cancel, Accept}  
Future<Future<ConfirmAction?>> _asyncConfirmDialog(BuildContext context) async {  
  return showDialog<ConfirmAction>(  
    context: context,  
    barrierDismissible: false, // user must tap button for close dialog!  
    builder: (BuildContext context) {  
      return AlertDialog(  
        title: const Text('Delete This Contact?'),  
        content: const Text(  
            'This will delete the contact from your device.'),  
        actions: <Widget>[  
          FlatButton(  
            child: const Text('Cancel'),  
            onPressed: () {  
              Navigator.of(context).pop(ConfirmAction.Cancel);  
            },  
          ),  
          FlatButton(  
            child: const Text('Delete'),  
            onPressed: () {  
              Navigator.of(context).pop(ConfirmAction.Accept);  
            },  
          )  
        ],  
      );  
    },  
  );  
}  