import 'package:flutter/material.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            Text('Socialive',style: TextStyle(
              fontSize: 24, // Appropriate size for text
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,// Semi-bold
              color: Color(0xff101828), // Text color
            ),),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                // Add your functionality here
                print("Create Account tapped");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff4478FF), // Exact color from your screenshot
                minimumSize: Size(345, 36), // Width: 200, Height: 50
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4), // Rounded corners
                ),
                elevation: 2, // Slight shadow for depth
              ),
              child: Text(
                'Create Account',
                style: TextStyle(
                  fontSize: 16, // Appropriate size for text
                  fontWeight: FontWeight.w600, // Semi-bold
                  color: Colors.white, // Text color
                ),
              ),
            ),

            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){},
              child: RichText(text: TextSpan(
                text: 'Log In',style: TextStyle(
               color: Color(0xff4478FF),
                fontSize: 14,
                fontWeight: FontWeight.w700,
                
              ),
                children:[ WidgetSpan(
                  child: Icon(Icons.keyboard_arrow_down,
                  size: 20,color:Color(0xff4478FF) ,)
                )]
              
              
              )),
            )


          ],
        ),
      ),
    );
  }
}
