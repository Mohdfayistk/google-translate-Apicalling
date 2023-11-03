import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Bloc/translate_bloc.dart';
import '../Repository/modelclass/translate.dart';






class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}
late Translate data;
class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF282931),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 140.h,),
          Padding(
            padding: EdgeInsets.only(left: 45.w),
            child: Container(
              width: 319.w,
              height: 234.h,
              decoration: ShapeDecoration(
                color: Color(0xFFF3F3F3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              child: SizedBox(width: 319.w,
                height: 234.h,
                child: Center(
                  child: Text(
                    'Premium cars',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 35.20.sp,
                      fontFamily: 'Barlow',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 50.h,),
          Padding(
            padding: EdgeInsets.only(left: 110.w),
            child: GestureDetector(onTap: () {
              BlocProvider.of<TranslateBloc>(context).add(FetchMovie());
            },
              child: Container(
                width: 190.w,
                height: 80.h,
                decoration: ShapeDecoration(
                  color: Color(0xFFF3F3F3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Get',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.20.sp,
                      fontFamily: 'Barlow',
                      fontWeight: FontWeight.w700,

                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 50.h,),
          Padding(
            padding: EdgeInsets.only(left: 45.w),
            child: Container(
              width: 319.w,
              height: 234.h,
              decoration: ShapeDecoration(
                color: Color(0xFFF3F3F3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
              ),
              child: SizedBox(width: 319.w,
                height: 234.h,
                child: Center(
                  child: BlocBuilder<TranslateBloc, TranslateState>(
                    builder: (context, state) {
                      if (state is TranslateLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is TranslateError) {
                        return Text('error');
                      }
                      if (state is TranslateLoaded) {
                        data = BlocProvider
                            .of<TranslateBloc>(context)
                            .animeModel;

                        return Text(
                          data.data!.translations.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 35.20.sp,
                            fontFamily: 'Barlow',
                            fontWeight: FontWeight.w700,
                          ),
                        );
                      }
                      else {
                        return SizedBox();
                      }
                    }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
