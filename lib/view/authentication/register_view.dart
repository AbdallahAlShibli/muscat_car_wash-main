import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:muscat_car_wash/model/firebase_auth.dart';
import 'package:muscat_car_wash/model/input_validator.dart';
import 'package:muscat_car_wash/res/colors.dart';
import 'package:muscat_car_wash/res/components/app_text.dart';
import 'package:muscat_car_wash/res/components/round_button.dart';
import 'package:muscat_car_wash/utils/routes/routes_name.dart';
import 'package:muscat_car_wash/utils/utils.dart';
import 'package:muscat_car_wash/view/authentication/login_view.dart';
import 'package:muscat_car_wash/view/authentication/userType/usertype_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterView extends StatefulWidget {
  final String userType;
  const RegisterView({super.key, required this.userType});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  ValueNotifier obsecurePassword = ValueNotifier(true);

  MethodsHandler _methodsHandler = MethodsHandler();
  InputValidator _inputValidator = InputValidator();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = false;
  bool _isVisible = false;
  bool _isVisibleC = false;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      _isVisible = false;
      _isVisibleC = false;
      _isLoading = false;
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailAddressController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final authViewModel = Provider.of<AuthViewModel>(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
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
                    height: size.height*0.4,
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
                            height: size.height * 0.04,
                          ),
                          Container(
                              width: size.width,
                              alignment: Alignment.centerLeft,
                              child: const Padding(
                                padding: EdgeInsets.only(left: 20),
                                child: Text(
                                  'Sign up',
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: AppColors.blackColor,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),


                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: AppColors.lightGreyColor,
                                border: Border.all(color:AppColors.lightGreyColor, )
                            ),
                            margin:

                            const EdgeInsets.only(left: 20, right: 20, top: 0),
                            child: TextFormField(
                              controller: _fullNameController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.name,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              onChanged: (value) {
                                // if(EmailValidator.validate(value)) {
                                //   setState(() {
                                //     isValid = true;
                                //   });
                                // } else {
                                //   setState(() {
                                //     isValid = false;
                                //   });
                                // }
                              },
                              decoration: InputDecoration(
                                focusColor: Colors.white,
                                fillColor: Colors.grey,
                                hintText: 'Full Name',
                                prefixIcon: Icon(Icons.person_outline_sharp,color: AppColors.darkRedColor,),

                                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

                                //add prefix icon

                                // errorText: "Error",

                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color:  AppColors.lightGreyColor,
                                    width: 1,
                                  ),
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color:  AppColors.lightGreyColor,
                                    width: 1,
                                  ),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: AppColors.lightGreyColor, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelStyle: const TextStyle(
                                  color: AppColors.greyColor,
                                  fontSize: TextStylesData.smallFontSize,
                                  fontFamily: "verdana_regular",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: AppColors.lightGreyColor,
                                border: Border.all(color:AppColors.lightGreyColor, )
                            ),
                            margin:

                            const EdgeInsets.only(left: 20, right: 20, top: 0),
                            child: TextFormField(
                              controller: _emailAddressController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              onChanged: (value) {
                                // if(EmailValidator.validate(value)) {
                                //   setState(() {
                                //     isValid = true;
                                //   });
                                // } else {
                                //   setState(() {
                                //     isValid = false;
                                //   });
                                // }
                              },
                              decoration: InputDecoration(
                                focusColor: Colors.white,
                                fillColor: Colors.grey,
                                hintText: 'Email',
                                prefixIcon: Icon(Icons.email_outlined,color: AppColors.darkRedColor,),
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      //  obsecurePassword.value = !obsecurePassword.value;
                                    },
                                    child: const Icon(
                                      Icons.verified_outlined,
                                      // color: Colors.,
                                      size: 20,
                                    )),
                                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

                                //add prefix icon

                                // errorText: "Error",

                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color:  AppColors.lightGreyColor,
                                    width: 1,
                                  ),
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color:  AppColors.lightGreyColor,
                                    width: 1,
                                  ),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: AppColors.lightGreyColor, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelStyle: const TextStyle(
                                  color: AppColors.greyColor,
                                  fontSize: TextStylesData.smallFontSize,
                                  fontFamily: "verdana_regular",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                color: AppColors.lightGreyColor,
                                border: Border.all(color:AppColors.lightGreyColor, )
                            ),
                            margin:

                            const EdgeInsets.only(left: 20, right: 20, top: 0),
                            child: TextFormField(
                              controller: _phoneController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.phone,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              onChanged: (value) {
                                // if(EmailValidator.validate(value)) {
                                //   setState(() {
                                //     isValid = true;
                                //   });
                                // } else {
                                //   setState(() {
                                //     isValid = false;
                                //   });
                                // }
                              },
                              decoration: InputDecoration(
                                focusColor: Colors.white,
                                fillColor: Colors.grey,
                                hintText: 'Phone',
                                prefixIcon: Icon(Icons.phone_outlined,color: AppColors.darkRedColor,),

                                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),

                                //add prefix icon

                                // errorText: "Error",

                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color:  AppColors.lightGreyColor,
                                    width: 1,
                                  ),
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color:  AppColors.lightGreyColor,
                                    width: 1,
                                  ),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: AppColors.lightGreyColor, width: 1.0),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelStyle: const TextStyle(
                                  color: AppColors.greyColor,
                                  fontSize: TextStylesData.smallFontSize,
                                  fontFamily: "verdana_regular",
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          ValueListenableBuilder(
                              valueListenable: obsecurePassword,
                              builder: (context, value, child) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: AppColors.lightGreyColor,
                                  ),

                                  margin:

                                  const EdgeInsets.only(left: 20, right: 20, top: 0),
                                  child: TextFormField(
                                    autofocus: true,
                                    keyboardType: TextInputType.text,
                                    controller: _passwordController,
                                    obscureText: obsecurePassword.value ? true : false,
                                    textInputAction: TextInputAction.done,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                    decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      prefixIcon: Icon(Icons.lock_outline,color: AppColors.darkRedColor,),
                                      suffixIcon: GestureDetector(
                                          onTap: () {
                                            obsecurePassword.value = !obsecurePassword.value;
                                          },
                                          child: Icon(
                                            obsecurePassword.value
                                                ? Icons.visibility_off_outlined
                                                : Icons.visibility,
                                            size: 20,
                                            color: AppColors.greyColor.withOpacity(0.5),
                                          )),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color:  AppColors.lightGreyColor,
                                          width: 1,
                                        ),
                                      ),

                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          color:  AppColors.lightGreyColor,
                                          width: 1,
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: AppColors.lightGreyColor, width: 1.0),
                                        borderRadius: BorderRadius.circular(10.0),
                                      ),
                                      fillColor: Colors.grey,
                                      //labelText: 'Password',
                                      hintText: 'Password',
                                      labelStyle: const TextStyle(
                                        color: AppColors.greyColor,
                                        fontSize: TextStylesData.smallFontSize,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                          SizedBox(
                            height: size.height * 0.025,
                          ),


                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          _isLoading ? Center(child: CircularProgressIndicator(color: AppColors.darkRedColor,)) :

                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: RoundButton(
                              width: size.width,
                              //isLoading: authViewModel.loading,
                              round: 30.0,
                              color: AppColors.greenColor2,
                              title: 'Register',
                            onPress: ()async{

                              if (_inputValidator.validateName(
                                  _fullNameController.text) !=
                                  'success' &&
                                  _fullNameController.text.isNotEmpty) {
                                Utils.flushBarErrorMessage("Invalid User Name",
                                    context, AppColors.darkRedColor, 'Error', 2);
                              } else if (_inputValidator.validateEmail(
                                  _emailAddressController.text) !=
                                  'success' &&
                                  _emailAddressController.text.isNotEmpty) {
                                Utils.flushBarErrorMessage("Wrong email address",
                                    context, AppColors.darkRedColor, 'Error', 2);
                              } else if (_inputValidator.validateMobile(
                                  _phoneController.text) !=
                                  'success' &&
                                  _phoneController.text.isNotEmpty) {
                                Utils.flushBarErrorMessage(
                                    "Phone Number Starts with + followed by code then number (Hint +923346567876)",
                                    context,
                                    AppColors.darkRedColor,
                                    'Error',
                                    2);
                              } else if ((_passwordController.text.length < 7 &&
                                  _passwordController.text.isNotEmpty)
                              // &&
                              // (_confirmPasswordControoler.text.length < 7 &&
                              // _confirmPasswordControoler
                              //     .text.isNotEmpty)
                              ) {
                                Utils.flushBarErrorMessage(
                                    "Password length must be greater than 6",
                                    context,
                                    AppColors.darkRedColor,
                                    'Error',
                                    2);
                              } else {
                                if (_fullNameController.text.isEmpty) {
                                  Utils.flushBarErrorMessage(
                                      "User Name is required",
                                      context,
                                      AppColors.darkRedColor,
                                      'Error',
                                      2);
                                } else if (_emailAddressController.text.isEmpty) {
                                  Utils.flushBarErrorMessage(
                                      "Email Address is required",
                                      context,
                                      AppColors.darkRedColor,
                                      'Error',
                                      2);
                                } else if (_phoneController.text.isEmpty) {
                                  Utils.flushBarErrorMessage(
                                      "Phone number is required",
                                      context,
                                      AppColors.darkRedColor,
                                      'Error',
                                      2);
                                } else if (_passwordController.text.isEmpty) {
                                  Utils.flushBarErrorMessage(
                                      "Password is required",
                                      context,
                                      AppColors.darkRedColor,
                                      'Error',
                                      2);
                                }  else {
                                  setState(() {
                                    _isLoading = true;
                                    print('We are in loading');
                                    //  state = ButtonState.loading;
                                  });

                                  //createAccount();
                                  //_methodsHandler.createAccount(name: _controllerClinic.text, email: _controller.text, password: _controllerPass.text, context: context);
                                  SharedPreferences prefs =
                                  await SharedPreferences.getInstance();

                                  FirebaseFirestore.instance
                                      .collection(widget.userType.toString())
                                      .where("email",
                                      isEqualTo:
                                      _emailAddressController.text.trim())
                                      .get()
                                      .then((value) async {
                                    if (value.docs.isNotEmpty) {
                                      setState(() {
                                        _isLoading = false;
                                      });
                                      Utils.flushBarErrorMessage(
                                          "Sorry email account already exists",
                                          context,
                                          AppColors.darkRedColor,
                                          'Error',
                                          2);
                                    } else {
                                      try {
                                        User? result1 = (await _auth
                                            .createUserWithEmailAndPassword(
                                            email: _emailAddressController
                                                .text
                                                .trim(),
                                            password: _passwordController
                                                .text
                                                .trim()))
                                            .user;

                                        if (result1 != null) {
                                          var user = result1;

                                          FirebaseFirestore.instance
                                              .collection(
                                              widget.userType.toString())
                                              .doc()
                                              .set({
                                            "email": _emailAddressController.text
                                                .trim(),
                                            "password":
                                            _passwordController.text.trim(),
                                            "uid": user.uid,
                                            "name": _fullNameController.text,
                                            "phone": _phoneController.text,
                                            "userType":
                                            widget.userType.toString(),

                                          }).then((value) => print('success'));

                                          prefs.setString('userType',
                                              widget.userType.toString());
                                          prefs.setString(
                                              'userEmail',
                                              _emailAddressController.text
                                                  .trim());
                                          prefs.setString('userPassword',
                                              _passwordController.text.trim());
                                          prefs.setString('name',
                                              _fullNameController.text.trim());
                                          prefs.setString('userId', user.uid);
                                          print('Account creation successful');
                                          setState(() {
                                            _isLoading = false;
                                          });

                                          Navigator.pushReplacement(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder: (c, a1, a2) =>
                                                  LoginView(
                                                    userType: widget.userType,
                                                  ),
                                              transitionsBuilder:
                                                  (c, anim, a2, child) =>
                                                  FadeTransition(
                                                      opacity: anim,
                                                      child: child),
                                              transitionDuration:
                                              Duration(milliseconds: 100),
                                            ),
                                          );

                                          Utils.flushBarErrorMessage(
                                              "Account Created Successfully",
                                              context,
                                              AppColors.greenColor2,
                                              'Success',
                                              4);
                                        } else {
                                          setState(() {
                                            _isLoading = false;
                                          });
                                          print('error');
                                        }
                                      } on FirebaseAuthException catch (e) {
                                        setState(() {
                                          _isLoading = false;
                                        });
                                        if (e.code == 'email-already-in-use') {
                                          _methodsHandler.showAlertDialog(
                                              context,
                                              'Sorry',
                                              'The email address is already in use by another account.');
                                        }
                                        print(e.message);
                                        print(e.code);
                                      }

                                      await Future.delayed(Duration(seconds: 1));
                                    }
                                  });
                                }
                              }

                            },
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),


                          GestureDetector(
                            onTap: () {
                              print("Registe");
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) => LoginView(userType: widget.userType),
                                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                    const begin = Offset(1.0, 0.0);
                                    const end = Offset.zero;
                                    const curve = Curves.easeIn;
                                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                    var offsetAnimation = animation.drive(tween);

                                    return SlideTransition(position: offsetAnimation, child: child);
                                  },
                                ),
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppText.registerLine,
                                  style: TextStyle(
                                      color: AppColors.blackColor,
                                      fontSize: TextStylesData.smallFontSize,
                                      fontWeight: FontWeight.w300),
                                ),
                                Text(
                                  " Sign In",
                                  style: TextStyle(
                                      color: AppColors.lightBlueColor,
                                      fontSize: TextStylesData.smallFontSize,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          ),


                        ],
                      ),

                    ),

                    SizedBox(
                      height: size.height * 0.025,
                    ),


                  ],),
              ),
            ),


          ],),




      ),


     
    );
  }
}
