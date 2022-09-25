import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ubongo/presentation/themes/theme_colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.black,
          foregroundColor: AppColor.black,
          title: Container(child: Image.asset("assets/images/logo.png"),
          width: 100,
          height: 50,),
          actions: [
            const Icon(Icons.search,color: AppColor.white,),
            Container(
             child:Image.asset("assets/images/baraka-side.png"),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                 color: AppColor.primaryColor,
                 
              ),
              
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitFadingCircle(
                itemBuilder: (BuildContext context, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: index.isEven ? AppColor.primaryColor : Colors.white,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      );
}
