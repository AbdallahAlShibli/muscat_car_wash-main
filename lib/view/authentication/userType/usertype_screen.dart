
import 'package:flutter/material.dart';
import 'package:muscat_car_wash/res/colors.dart';
import 'package:muscat_car_wash/res/components/round_button.dart';
import 'package:muscat_car_wash/view/authentication/login_view.dart';




class UserType extends StatefulWidget {
  const UserType({Key? key}) : super(key: key);

  @override
  State<UserType> createState() => _UserTypeState();
}

class _UserTypeState extends State<UserType> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      resizeToAvoidBottomInset: false,
      body:  Container(
        width: size.width,
        height: size.height,
        decoration: new BoxDecoration(
          color: Colors.white,

        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
              children: [

                Center(
                  child: Container(
                    height: size.height*0.35,
                    width: size.width,
                    // color: AppColors.greenColor2,
                    decoration: BoxDecoration(

                      gradient: LinearGradient(
                          colors: [
                            AppColors.lightBlueColor,
                            AppColors.lightBlueColor3,
                          ],
                          stops: [
                            0.0,
                            1.0
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          tileMode: TileMode.repeated),

                    ),
                    child: SizedBox(
                      width: 10.0,
                      height: 10.0,
                      child: Padding(
                        padding: const EdgeInsets.all(100.0),
                        child: Container(
                          width: 10.0,
                          height: 10.0,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset('assets/images/logo.png',),
                        ),

                      ),
                    ),

                  ),
                ),
              ],
            ),

            SingleChildScrollView(
              child: Container(
                //            height: size.height,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(30),
                              topLeft: Radius.circular(30)
                          )
                      ),
                      child: Column(
                        children: [

                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Container(
                              width: size.width,
                              alignment: Alignment.center,
                              child:  Padding(
                                padding: EdgeInsets.only(left: 0),
                                child: Text(
                                  'Welcome',


                                  style: TextStyle(
                                      fontSize: 27,
                                      //color: AppColors.blackColor,
                                      fontWeight: FontWeight.bold,
                                      foreground: Paint()..shader = LinearGradient(
                                        colors: <Color>[AppColors.lightBlueColor, AppColors.darkRedColor],
                                      ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))
                                  ),

                                ),
                              )),
                          SizedBox(
                            height: size.height * 0.015,
                          ),

                          Container(
                              width: size.width,
                              alignment: Alignment.center,
                              child:  Padding(
                                padding: EdgeInsets.only(left: 0),
                                child: Text(
                                  'Muscat Car Wash',
                                  style: TextStyle(
                                      fontSize: 25,
                                      //color: AppColors.blackColor,
                                      fontWeight: FontWeight.w300,

                                      foreground: Paint()..shader = LinearGradient(
                                        colors: <Color>[AppColors.lightBlueColor, AppColors.darkRedColor],
                                      ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))
                                  ),

                                ),
                              )
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap:() {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                      LoginView(userType: 'Admin',)));
                                },
                                child: Container(
                                    width: size.width*0.3,
                                    height: size.height*0.15,
                                    alignment: Alignment.center,
                                    decoration:

                                    BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.green.shade200,
                                            Colors.green,
                                          ],
                                          stops: [
                                            0.0,
                                            1.0
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          tileMode: TileMode.repeated),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0, 1),
                                            blurRadius: 5.0)
                                      ],
                                      color: AppColors.whiteColor,
                                      //border: Border.all(color: AppColors.purpleColor,width: 1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child:
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/images/admin.png',
                                          color: Colors.white,
                                          fit: BoxFit.scaleDown,width: size.width*0.3,height: 40,),
                                        Padding(
                                          padding: EdgeInsets.only(left: 0, top: 10),
                                          child: Text(
                                            'Admin',


                                            style: TextStyle(
                                                fontSize: 20,
                                                //color: AppColors.blackColor,
                                                fontWeight: FontWeight.bold,
                                                foreground: Paint()..shader = LinearGradient(
                                                  colors: <Color>[AppColors.whiteColor, AppColors.whiteColor],
                                                ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))
                                            ),

                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ),
                              GestureDetector(
                                onTap:() {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                      LoginView(userType: 'Owner',)));
                                },
                                child: Container(
                                    width: size.width*0.3,
                                    height: size.height*0.15,
                                    alignment: Alignment.center,
                                    decoration:

                                    BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.red.shade200,
                                            Colors.red,
                                          ],
                                          stops: [
                                            0.0,
                                            1.0
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          tileMode: TileMode.repeated),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0, 1),
                                            blurRadius: 5.0)
                                      ],
                                      color: AppColors.whiteColor,
                                      //border: Border.all(color: AppColors.purpleColor,width: 1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child:
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/images/admin.png',
                                          color: Colors.white,
                                          fit: BoxFit.scaleDown,width: size.width*0.3,height: 40,),
                                        Padding(
                                          padding: EdgeInsets.only(left: 0, top: 10),
                                          child: Text(
                                            'Car Wash Owner',


                                            style: TextStyle(
                                                fontSize: 16,
                                                //color: AppColors.blackColor,
                                                fontWeight: FontWeight.bold,

                                                foreground: Paint()..shader = LinearGradient(
                                                  colors: <Color>[AppColors.whiteColor, AppColors.whiteColor],
                                                ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                                            ),
                                            textAlign: TextAlign.center,

                                          ),
                                        ),
                                      ],
                                    )
                                ),
                              ),
                              GestureDetector(
                                onTap:() {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                      LoginView(userType: 'Users',)));

                                },
                                child: Container(
                                    width: size.width*0.3,
                                    height: size.height*0.15,
                                    alignment: Alignment.center,
                                    decoration:

                                    BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            AppColors.lightBlueColor,
                                            AppColors.lightBlueColor3,
                                          ],
                                          stops: [
                                            0.0,
                                            1.0
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          tileMode: TileMode.repeated),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0, 1),
                                            blurRadius: 5.0)
                                      ],
                                      color: AppColors.whiteColor,
                                   //   border: Border.all(color: AppColors.purpleColor,width: 1),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child:  Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Image.asset('assets/images/user.png',
                                          color: Colors.white,
                                          fit: BoxFit.scaleDown, width: size.width*0.3,height: 40,),
                                        Padding(
                                          padding: EdgeInsets.only(left: 0, top: 10),
                                          child: Text(
                                            'User',


                                            style: TextStyle(
                                                fontSize: 20,
                                                //color: AppColors.blackColor,
                                                fontWeight: FontWeight.bold,
                                                foreground: Paint()..shader = LinearGradient(
                                                  colors: <Color>[AppColors.whiteColor, AppColors.whiteColor],
                                                ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))
                                            ),

                                          ),
                                        ),
                                      ],
                                    )),
                              ),
                            ],
                          ),



                          SizedBox(
                            height: size.height * 0.05,
                          ),





                        ],
                      ),

                    ),

                    SizedBox(
                      height: size.height * 0.3,
                    ),


                  ],),
              ),
            ),


          ],),




      ),


    );
  }
}

class WaveClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

    var path = new Path();
    path.lineTo(0, size.height); //start path with this if you are making at bottom

    var firstStart = Offset(size.width / 5, size.height);
    //fist point of quadratic bezier curve
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    //second point of quadratic bezier curve
    path.quadraticBezierTo(firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart = Offset(size.width - (size.width / 3.24), size.height - 105);
    //third point of quadratic bezier curve
    var secondEnd = Offset(size.width, size.height - 10);
    //fourth point of quadratic bezier curve
    path.quadraticBezierTo(secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);

    path.lineTo(size.width, 0); //end with this path if you are making wave at bottom
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}
