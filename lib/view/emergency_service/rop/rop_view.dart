import 'package:flutter/material.dart';
import 'package:muscat_car_wash/model/dummy_data.dart';
import 'package:muscat_car_wash/res/colors.dart';
import 'package:muscat_car_wash/res/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class RoyalOmanPoliceView extends StatefulWidget {
  const RoyalOmanPoliceView({super.key});

  @override
  State<RoyalOmanPoliceView> createState() => _RoyalOmanPoliceViewState();
}

class _RoyalOmanPoliceViewState extends State<RoyalOmanPoliceView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.blackColor, size: 25),
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: AppColors.greenColor2,
        title: Text(
          'Royal Oman Police',
          style: TextStyle(
              fontSize: 19, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: AppColors.lightGreyColor,

      body: Center(
        child: Container(
          width: size.width * 0.95,
          child: ListView.builder(
            itemCount: DummyData.ropList.length,
            itemBuilder: (context, index) {
              // DocumentSnapshot ds = snapshot.data!.docs[index];
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
                          // height: size.height*0.12,
                          child:  ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              DummyData.ropList[index].image.toString()
                              , fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        Container(
                          //   color: redColor,
                          //width: size.width*0.5,

                          child:  Column(
                            //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          DummyData.ropList[index].name.toString()
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
                                          DummyData.ropList[index].status.toString()
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
                                          DummyData.ropList[index].service.toString()
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
                                          DummyData.ropList[index].address.toString()
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(Icons.call, color: Colors.red,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8,),
                                          child: Text(
                                            DummyData.ropList[index].phone.toString()
                                            , style: TextStyle(
                                              color: Colors.red, fontSize: 11, fontWeight: FontWeight.w500, height: 1.3),),
                                        ),
                                      ],),
                                    Center(
                                      child:  OutlinedButton(

                                          onPressed: () => launch("tel:${DummyData.ropList[index].phone.toString()}"),
                                          child: new Text("Call Now", style: TextStyle(color: AppColors.greenColor2, fontSize: 12),)),
                                    ),

                                    // Icon(Icons.favorite, color:greyColor,size: 20,)

                                  ],),
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
      ),


    );
  }
}
