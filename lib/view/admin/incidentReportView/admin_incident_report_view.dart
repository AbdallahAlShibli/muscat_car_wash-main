import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:muscat_car_wash/res/colors.dart';
import 'package:muscat_car_wash/res/constants.dart';
import 'package:muscat_car_wash/view/incidentReport/incident_report_detail.dart';

class AdminIncidentReportView extends StatefulWidget {
  const AdminIncidentReportView({super.key});

  @override
  State<AdminIncidentReportView> createState() => _AdminIncidentReportViewState();
}

class _AdminIncidentReportViewState extends State<AdminIncidentReportView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.lightGreyColor,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        automaticallyImplyLeading: true,
        backgroundColor: AppColors.greenColor2,
        title: Text(
          'Incidents',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => DashBoardScreen(index:1)));
              // Scaffold.of(context).openDrawer();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
      ),

      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('IncidentReport').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                  color: AppColors.greenColor2,
                ));
          } else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
            // got data from snapshot but it is empty

            return Center(child: Text("No Data Found"));
          } else {
            return Center(
              child: Container(
                width: size.width * 0.95,
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data!.docs[index];
                    return GestureDetector(
                      onTap: () {

                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8,right: 8,top: 8, bottom: 3),
                        child: Container(
                          width: size.width*0.95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: whiteColor,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Container(
                                // color: redColor,
                                width: size.width*0.25,
                                height: size.height*0.1,
                                child:  ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    snapshot
                                        .data!
                                        .docs[index]
                                    ["image"]
                                        .toString()
                                    , fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(


                                child:  Column(
                                  children: [

                                    Container(

                                      width: size.width*0.6,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: size.width*0.6,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 8,top: 8),
                                              child: Text(
                                                snapshot
                                                    .data!
                                                    .docs[index]
                                                ["title"]
                                                    .toString()
                                                , style: TextStyle(
                                                color: Colors.black, fontSize: 13, fontWeight: FontWeight.w800,),maxLines: 2,overflow: TextOverflow.ellipsis,),
                                            ),
                                          ),

                                          // Icon(Icons.favorite, color:greyColor,size: 20,)

                                        ],),
                                    ),

                                    SizedBox(
                                      height: size.height*0.01,
                                    ),

                                    Container(

                                      width: size.width*0.6,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: size.width*0.6,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 8,),
                                              child: Text(
                                                snapshot
                                                    .data!
                                                    .docs[index]
                                                ["description"]
                                                    .toString()
                                                , style: TextStyle(
                                                  color: Colors.black, fontSize: 10, fontWeight: FontWeight.w500, height: 1.3,
                                                  overflow: TextOverflow.ellipsis),overflow: TextOverflow.ellipsis,maxLines: 3,),


                                            ),
                                          ),

                                          // Icon(Icons.favorite, color:greyColor,size: 20,)

                                        ],),
                                    ),

                                    SizedBox(
                                      height: size.height*0.01,
                                    ),

                                    Container(

                                      width: size.width*0.6,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: size.width*0.6,
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 8,),
                                              child: Text(
                                                snapshot
                                                    .data!
                                                    .docs[index]
                                                ["address"]
                                                    .toString()
                                                , style: TextStyle(
                                                  color: Colors.green, fontSize: 10, fontWeight: FontWeight.w500, height: 1.3,
                                                  overflow: TextOverflow.ellipsis),overflow: TextOverflow.ellipsis,maxLines: 3,),


                                            ),
                                          ),

                                          // Icon(Icons.favorite, color:greyColor,size: 20,)

                                        ],),
                                    ),

                                    SizedBox(
                                      height: size.height*0.01,
                                    ),
                                    Container(
                                      width: size.width*0.6,
                                      child: Row(

                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8,),
                                            child: Center(
                                              child:  OutlinedButton(

                                                // onPressed: () => launch("tel:${DummyData.hospitalList[index].phone.toString()}"),
                                                  onPressed: () {

                                                    Navigator.push(
                                                      context,
                                                      PageRouteBuilder(
                                                        pageBuilder: (c, a1, a2) => IncidentReportDetailView(
                                                          address: snapshot
                                                              .data!
                                                              .docs[index]
                                                          ["address"]
                                                              .toString(),
                                                          image: snapshot
                                                              .data!
                                                              .docs[index]
                                                          ["image"]
                                                              .toString(),
                                                          title: snapshot
                                                              .data!
                                                              .docs[index]
                                                          ["title"]
                                                              .toString(),
                                                          description:
                                                          snapshot
                                                              .data!
                                                              .docs[index]
                                                          ["description"]
                                                              .toString()
                                                          ,

                                                        ),
                                                        transitionsBuilder: (c, anim, a2, child) =>
                                                            FadeTransition(opacity: anim, child: child),
                                                        transitionDuration: Duration(milliseconds: 100),
                                                      ),
                                                    );

                                                  },
                                                  child: new Text("View", style: TextStyle(color: AppColors.greenColor2, fontSize: 12),)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: size.height*0.01,
                                    ),




                                  ],),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );


                  },
                  //Container(child: Text('AdminHome'),),
                ),
              ),
            );
          }
        },
      ),

    );
  }
}
