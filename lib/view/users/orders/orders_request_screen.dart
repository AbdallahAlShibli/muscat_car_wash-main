import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:muscat_car_wash/res/colors.dart';
import 'package:muscat_car_wash/res/constants.dart';
import 'package:muscat_car_wash/view/carOwner/reports/report_detail_screen.dart';
import 'package:muscat_car_wash/view/carServices/service_detail_screen.dart';

class UserOrderServiceRequestScreen extends StatefulWidget {
  const UserOrderServiceRequestScreen({Key? key}) : super(key: key);

  @override
  _UserOrderServiceRequestScreenState createState() => _UserOrderServiceRequestScreenState();
}

class _UserOrderServiceRequestScreenState extends State<UserOrderServiceRequestScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          // backgroundColor: primaryColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,

            backgroundColor: AppColors.lightBlueColor2,

            bottom: TabBar(
              indicatorColor: primaryColor,
              onTap: (index) {
                // Tab index when user select it, it start from zero
              },
              tabs: [
                Tab(text: 'New',),
                Tab(text: 'Confirmed',),
                Tab(text: 'Cancelled',),
              ],
            ),
            centerTitle: true,
            title: Text('My Orders'),
          ),
          body: TabBarView(
            children: [
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection("BookedServices").where("bookingStatus", isEqualTo: "Pending" ).where(
                    "userId", isEqualTo: _auth.currentUser!.uid.toString()
                ).snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator(
                      strokeWidth: 1,
                      color: primaryColor,
                    ));
                  }
                  else if(snapshot.hasData && snapshot.data!.docs.isEmpty) {
                    // got data from snapshot but it is empty

                    return Center(child: Text("No Data Found"));
                  }
                  else {
                    return Container(
                      width: size.width*0.95,

                      child:   ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount:snapshot.data!.docs.length,
                          shrinkWrap: true,
                          itemBuilder: (context, int index) {
                            return   Padding(
                              padding: const EdgeInsets.only(left: 8,right: 8,top: 0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (c, a1, a2) => ServiceDetailScreen(
                                        serviceName: snapshot.data!.docs[index]["ServiceName"].toString(),
                                        serviceDescription: snapshot.data!.docs[index]["ServiceDescription"].toString(),
                                        servicePrice: snapshot.data!.docs[index]["ServicePrice"].toString(),
                                        status: snapshot.data!.docs[index]["bookingStatus"].toString(),
                                        payment: snapshot.data!.docs[index]["paymentMethod"].toString(),
                                        serviceImage: snapshot.data!.docs[index]["ServiceImage"].toString(),
                                        docId: snapshot.data!.docs[index].id,
                                      ),
                                      transitionsBuilder: (c, anim, a2, child) =>
                                          FadeTransition(opacity: anim, child: child),
                                      transitionDuration: Duration(milliseconds: 100),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Container(
                                    width: size.width*0.85,


                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: whiteColor,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [

                                        Container(
                                          // color: redColor,
                                          width: size.width*0.3,
                                          height: size.height*0.15,
                                          child:  ClipRRect(
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                                            child:  Padding(
                                              padding: const EdgeInsets.all(0.0),
                                              child: Image.network(snapshot.data!.docs[index]["ServiceImage"].toString(),
                                              fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),

                                        Container(
                                          //   color: redColor,
                                          width: size.width*0.55,

                                          child:  Column(
                                            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [

                                              Container(

                                                width: size.width*0.65,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8,top: 8),
                                                      child: Text(
                                                        "Order Id : #" + "${index+1}"
                                                        , style: TextStyle(
                                                          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w800, height: 1.3),),
                                                    ),

                                                    // Icon(Icons.favorite, color:greyColor,size: 20,)

                                                  ],),
                                              ),

                                              SizedBox(
                                                height: size.height*0.01,
                                              ),
                                              Container(

                                                width: size.width*0.65,
                                                //  color: Colors.green,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 8,),
                                                  child: Text(
                                                    "Service Name : " + snapshot.data!.docs[index]["ServiceName"].toString()
                                                    , style: TextStyle(
                                                      color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500, height: 1.3)
                                                    ,maxLines: 1
                                                    ,overflow: TextOverflow.ellipsis,),
                                                ),
                                              ),

                                          


                                              SizedBox(
                                                height: size.height*0.01,
                                              ),
                                              Container(

                                                width: size.width*0.65,
                                                child:   Padding(
                                                  padding: const EdgeInsets.only(left: 8,),
                                                  child: Text(

                                                    "Address : Muscat Oman"
                                                    , style: TextStyle(
                                                      color: Colors.green, fontSize: 12, fontWeight: FontWeight.w500, height: 1.3),overflow: TextOverflow.ellipsis,maxLines: 2,),
                                                ),
                                              ),

                                              SizedBox(
                                                height: size.height*0.01,
                                              ),

                                              Container(

                                                width: size.width*0.48,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [

                                                    GestureDetector(
                                                      onTap: () {
                                                       
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),
                                                          color: AppColors.lightBlueColor,
                                                        ),
                                                        width: size.width*0.48,
                                                        alignment: Alignment.center,
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8),
                                                          child: Text(
                                                            snapshot.data!.docs[index]["bookingStatus"].toString()

                                                            , style: TextStyle(
                                                              color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500, height: 1.3),),
                                                        ),
                                                      ),
                                                    ),


                                                  ],),
                                              ),

                                              SizedBox(
                                                height: size.height*0.02,
                                              ),
                                            ],),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  }


                },
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection("BookedServices").where("bookingStatus", isEqualTo: "Confirmed" )
                    .where(
                    "userId", isEqualTo: _auth.currentUser!.uid.toString()
                )
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator(
                      strokeWidth: 1,
                      color: primaryColor,
                    ));
                  }
                  else if(snapshot.hasData && snapshot.data!.docs.isEmpty) {
                    // got data from snapshot but it is empty

                    return Center(child: Text("No Data Found"));
                  }
                  else {
                    return Container(
                      width: size.width*0.95,

                      child:   ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount:snapshot.data!.docs.length,
                          shrinkWrap: true,
                          itemBuilder: (context, int index) {
                            return   Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (c, a1, a2) => ServiceDetailScreen(
                                        serviceName: snapshot.data!.docs[index]["ServiceName"].toString(),
                                        serviceDescription: snapshot.data!.docs[index]["ServiceDescription"].toString(),
                                        servicePrice: snapshot.data!.docs[index]["ServicePrice"].toString(),
                                        status: snapshot.data!.docs[index]["bookingStatus"].toString(),
                                        payment: snapshot.data!.docs[index]["paymentMethod"].toString(),
                                        serviceImage: snapshot.data!.docs[index]["ServiceImage"].toString(),
                                        docId: snapshot.data!.docs[index].id,
                                      ),
                                      transitionsBuilder: (c, anim, a2, child) =>
                                          FadeTransition(opacity: anim, child: child),
                                      transitionDuration: Duration(milliseconds: 100),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    width: size.width*0.95,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: whiteColor,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [


                                        Container(
                                          // color: redColor,
                                          width: size.width*0.3,
                                          height: size.height*0.15,
                                          child:  ClipRRect(
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                                            child:  Padding(
                                              padding: const EdgeInsets.all(0.0),
                                              child: Image.network(snapshot.data!.docs[index]["ServiceImage"].toString(),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          //   color: redColor,
                                          width: size.width*0.55,

                                          child:  Column(
                                            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [

                                              Container(

                                                width: size.width*0.55,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8,top: 8),
                                                      child: Text(
                                                        "Service Id : #" + "${index+1}"
                                                        , style: TextStyle(
                                                          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w800, height: 1.3),),
                                                    ),

                                                    // Icon(Icons.favorite, color:greyColor,size: 20,)

                                                  ],),
                                              ),

                                              SizedBox(
                                                height: size.height*0.01,
                                              ),
                                              Container(

                                                width: size.width*0.65,
                                                //  color: Colors.green,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 8,),
                                                  child: Text(
                                                    "Service Name : " + snapshot.data!.docs[index]["ServiceName"].toString()
                                                    , style: TextStyle(
                                                      color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500, height: 1.3)
                                                    ,maxLines: 1
                                                    ,overflow: TextOverflow.ellipsis,),
                                                ),
                                              ),

                                              SizedBox(
                                                height: size.height*0.01,
                                              ),

                                              Container(

                                                width: size.width*0.65,
                                                child:   Padding(
                                                  padding: const EdgeInsets.only(left: 8,),
                                                  child: Text(

                                                    "Address : Muscat Oman"
                                                    , style: TextStyle(
                                                      color: Colors.green, fontSize: 12, fontWeight: FontWeight.w500, height: 1.3),overflow: TextOverflow.ellipsis,maxLines: 2,),
                                                ),
                                              ),

                                              SizedBox(
                                                height: size.height*0.01,
                                              ),
                                              Container(

                                                width: size.width*0.65,
                                                //  color: Colors.green,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8,),
                                                      child: Text(
                                                        "Payment : " + snapshot.data!.docs[index]["paymentMethod"].toString()
                                                        , style: TextStyle(
                                                          color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500, height: 1.3),),
                                                    ),

                                                    // Icon(Icons.favorite, color:greyColor,size: 20,)

                                                  ],),
                                              ),




                                              SizedBox(
                                                height: size.height*0.01,
                                              ),


                                              Container(

                                               // width: size.width*0.48,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    snapshot.data!.docs[index]["paymentMethod"].toString() ==  'Not Paid' ?
                                                    GestureDetector(
                                                      onTap:() {
                                                       
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),
                                                          color: AppColors.lightBlueColor,
                                                        ),
                                                        width: size.width*0.22,
                                                        alignment: Alignment.center,
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8),
                                                          child: Text(
                                                          'Pay Now'

                                                            , style: TextStyle(
                                                              color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500, height: 1.3),),
                                                        ),
                                                      ),
                                                    ) :
                                                    snapshot.data!.docs[index]["isReportGenerated"].toString() ==  'yes' ?
                                                    GestureDetector(
                                                      onTap:() {
                                                        Navigator.push(
                                                          context,
                                                          PageRouteBuilder(
                                                            pageBuilder: (c, a1, a2) => ReportDetailScreen(
                                                              name: snapshot.data!.docs[index]["userName"].toString(),
                                                              Case: snapshot.data!.docs[index]["ServiceName"].toString(), // appointmentTime
                                                              date: snapshot.data!.docs[index]["appointmentTime"].toString(),
                                                              total: snapshot.data!.docs[index]["ServicePrice"].toString(), payment:
                                                            snapshot.data!.docs[index]["paymentMethod"].toString(),
                                                              status: snapshot.data!.docs[index]["bookingStatus"].toString(),),
                                                            transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
                                                            transitionDuration: Duration(milliseconds: 0),
                                                          ),
                                                        );
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),
                                                          color: AppColors.lightBlueColor,
                                                        ),
                                                        width: size.width*0.22,
                                                        alignment: Alignment.center,
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8),
                                                          child: Text(
                                             'View Report'

                                                            , style: TextStyle(
                                                              color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500, height: 1.3),),
                                                        ),
                                                      ),
                                                    ) : Container(),
                                                    SizedBox(width: 8,),
                                                    GestureDetector(
                                                      onTap:() {

                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),
                                                          color:
                                                          Colors.green,
                                                        ),
                                                        width: size.width*0.22,
                                                        alignment: Alignment.center,
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8),
                                                          child: Text(


                                                            snapshot.data!.docs[index]["bookingStatus"].toString()

                                                            , style: TextStyle(
                                                              color: Colors.white, fontSize: 11, fontWeight: FontWeight.w500, height: 1.3),),
                                                        ),
                                                      ),
                                                    ),

                                                  ],),
                                              ),

                                              SizedBox(
                                                height: size.height*0.02,
                                              ),
                                            ],),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  }


                },
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection("BookedServices").where("bookingStatus", isEqualTo: "Cancelled" )
                    .where(
                    "userId", isEqualTo: _auth.currentUser!.uid.toString()
                )
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator(
                      strokeWidth: 1,
                      color: primaryColor,
                    ));
                  }
                  else if(snapshot.hasData && snapshot.data!.docs.isEmpty) {
                    // got data from snapshot but it is empty

                    return Center(child: Text("No Data Found"));
                  }
                  else {
                    return Container(
                      width: size.width*0.95,

                      child:   ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount:snapshot.data!.docs.length,
                          shrinkWrap: true,
                          itemBuilder: (context, int index) {
                            return   Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (c, a1, a2) => ServiceDetailScreen(
                                        serviceName: snapshot.data!.docs[index]["ServiceName"].toString(),
                                        serviceDescription: snapshot.data!.docs[index]["ServiceDescription"].toString(),
                                        servicePrice: snapshot.data!.docs[index]["ServicePrice"].toString(),
                                        status: snapshot.data!.docs[index]["bookingStatus"].toString(),
                                        payment: snapshot.data!.docs[index]["paymentMethod"].toString(),
                                        serviceImage: snapshot.data!.docs[index]["ServiceImage"].toString(),
                                        docId: snapshot.data!.docs[index].id,
                                      ),
                                      transitionsBuilder: (c, anim, a2, child) =>
                                          FadeTransition(opacity: anim, child: child),
                                      transitionDuration: Duration(milliseconds: 100),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Container(
                                    width: size.width*0.85,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: whiteColor,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          // color: redColor,
                                          width: size.width*0.3,
                                          height: size.height*0.15,
                                          child:  ClipRRect(
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                                            child:  Padding(
                                              padding: const EdgeInsets.all(0.0),
                                              child: Image.network(snapshot.data!.docs[index]["ServiceImage"].toString(),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          //   color: redColor,
                                          width: size.width*0.55,

                                          child:  Column(
                                            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [

                                              Container(

                                                width: size.width*0.65,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 8,top: 8),
                                                      child: Text(
                                                        "Order Id : #" + "${index+1}"
                                                        , style: TextStyle(
                                                          color: Colors.black, fontSize: 14, fontWeight: FontWeight.w800, height: 1.3),),
                                                    ),

                                                    // Icon(Icons.favorite, color:greyColor,size: 20,)

                                                  ],),
                                              ),

                                              SizedBox(
                                                height: size.height*0.01,
                                              ),
                                              Container(

                                                width: size.width*0.65,
                                                //  color: Colors.green,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 8,),
                                                  child: Text(
                                                    "Service Name : " + snapshot.data!.docs[index]["ServiceName"].toString()
                                                    , style: TextStyle(
                                                      color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500, height: 1.3)
                                                    ,maxLines: 1
                                                    ,overflow: TextOverflow.ellipsis,),
                                                ),
                                              ),

                                              


                                              SizedBox(
                                                height: size.height*0.01,
                                              ),
                                              Container(

                                                width: size.width*0.65,
                                                child:   Padding(
                                                  padding: const EdgeInsets.only(left: 8,),
                                                  child: Text(

                                                    "Address : Muscat Oman "
                                                    , style: TextStyle(
                                                      color: Colors.green, fontSize: 12, fontWeight: FontWeight.w500, height: 1.3),overflow: TextOverflow.ellipsis,maxLines: 2,),
                                                ),
                                              ),

                                              SizedBox(
                                                height: size.height*0.01,
                                              ),


                                              Container(

                                                width: size.width*0.48,
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    GestureDetector(
                                                      onTap:() {

                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),
                                                          color:
                                                          Colors.red ,
                                                        ),
                                                        width: size.width*0.4,
                                                        alignment: Alignment.center,
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8),
                                                          child: Text(
                                                            snapshot.data!.docs[index]["bookingStatus"].toString()

                                                            , style: TextStyle(
                                                              color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500, height: 1.3),),
                                                        ),
                                                      ),
                                                    ),

                                                  ],),
                                              ),

                                              SizedBox(
                                                height: size.height*0.02,
                                              ),
                                            ],),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  }


                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
