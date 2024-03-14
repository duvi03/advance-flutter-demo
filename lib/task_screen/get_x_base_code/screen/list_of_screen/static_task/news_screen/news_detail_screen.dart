import 'package:demo/core/z_file_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsDetailScreen extends StatelessWidget {
  const NewsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            snap: true,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              title: InvisibleExpandedHeader(
                child: CommonWidgets.customTextView(
                  text: "News Details",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  maxLine: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              background: InteractiveViewer(
                child: SizedBox(
                  height: 300.sp,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10.sp),
                          bottomLeft: Radius.circular(10.sp),
                        ),
                        child: Image.asset(
                          "images/image_1.jpeg",
                          height: 300.sp,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: EdgeInsets.all(24.sp),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonWidgets.customTextView(
                                text: "2 hours ago",
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.comment,
                                    size: 16.sp,
                                    color: Colors.white,
                                  ),
                                  CustomSize.horizontalSpace(4.sp),
                                  CommonWidgets.customTextView(text: "27", fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.white),
                                  CustomSize.horizontalSpace(16.sp),
                                  Icon(
                                    Icons.remove_red_eye,
                                    size: 16.sp,
                                    color: Colors.white,
                                  ),
                                  CustomSize.horizontalSpace(4.sp),
                                  CommonWidgets.customTextView(text: "916", fontSize: 14.sp, fontWeight: FontWeight.w500, color: Colors.white),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            expandedHeight: 250,
            backgroundColor: Colors.grey.shade700,
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 20.sp,
                color: Colors.white,
              ),
            ),
            actions: [
              Icon(
                Icons.call_missed_outgoing_rounded,
                size: 20.sp,
                color: Colors.white,
              ),
              CustomSize.horizontalSpace(20.sp),
              Padding(
                padding: EdgeInsets.only(right: 24.sp),
                child: Icon(
                  Icons.bookmark,
                  size: 20.sp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20.sp),
              color: Colors.white,
              child: Column(
                children: [
                  CustomSize.verticalSpace(20.sp),
                  Row(
                    children: [
                      Container(
                        height: 55.sp,
                        padding: EdgeInsets.only(right: 10.sp),
                        child: VerticalDivider(
                          color: Colors.orange,
                          width: 10.sp,
                          thickness: 3.sp,
                        ),
                      ),
                      Expanded(
                        child: CommonWidgets.customTextView(
                          text: "A ruggedly beautiful quarantine site",
                          fontSize: 22.sp,
                          fontWeight: FontWeight.w900,
                          maxLine: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  CustomSize.verticalSpace(20.sp),
                  CommonWidgets.customTextView(
                    text: AppString.newsDetail1,
                    fontSize: 16.sp,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomSize.verticalSpace(30.sp),
                  CommonWidgets.customTextView(
                    text: AppString.newsDetail2,
                    fontSize: 16.sp,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomSize.verticalSpace(30.sp),
                  CommonWidgets.customTextView(
                    text: AppString.newsDetail1,
                    fontSize: 16.sp,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomSize.verticalSpace(10.sp),
                  CommonWidgets.customTextView(
                    text: AppString.newsDetail2,
                    fontSize: 16.sp,
                    color: Colors.grey.shade700,
                    fontWeight: FontWeight.w500,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


