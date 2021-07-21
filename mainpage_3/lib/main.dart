import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',                        
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {

  final PageController _pageController = new PageController(initialPage: 0);
  List<Widget> _page = [];
  final mainColor = Colors.black;

  @override
  void dispose() {    
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {   
     _page = 
    [
      viewComponent(imagePath: "assets/1.png",title: "Welcome"),
      viewComponent(imagePath: "assets/2.png",title: "나는 연수야!", subtitle: "나도 연수야! 비행기를 날리자"),
      viewComponent(imagePath: "assets/3.png",title: "나는 연수야!", subtitle: "나도 연수야!"),      
    ]; 
    return Scaffold(     
      backgroundColor: Colors.white, 
      body: body(context: context, controller: _pageController),
    );
  }
  
  body({required BuildContext context, required PageController controller}){
    return SafeArea(
      child: PageView(
        controller: controller,
        pageSnapping: true,
        scrollDirection: Axis.vertical,
        children: _page,
      ),
    );
  }

  Widget viewComponent({
    required String imagePath,
    required String title,
    String subtitle =" ",    
  })
  {
    final titles = Text(title,style: TextStyle(color: mainColor,fontSize: 20, fontWeight: FontWeight.bold),);
    final subTitles = Text(subtitle,style:TextStyle(color:mainColor));    
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,        
        children: [
          Expanded(child: Container()),
          Image.asset(
            imagePath,
            width: double.infinity,
            height: 250,
            fit: BoxFit.fitWidth,
          ), 
          SizedBox(height: 12,),          
          titles,
          SizedBox(height: 6,),
          subTitles,
          Expanded(child: Container()),
          IconButton(icon: Icon(Icons.keyboard_arrow_down),iconSize: 70, onPressed: (){_pageController.animateToPage(0, duration: Duration(milliseconds:3000), curve: Curves.ease);}),
          // Icon(Icons.keyboard_arrow_down, size:70, color: mainColor,),
        ],
      ),
    );
  }
}

