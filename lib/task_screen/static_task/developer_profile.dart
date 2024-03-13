import 'package:demo/core/z_file_core.dart';
import 'package:flutter/material.dart';

class DeveloperProfile extends StatelessWidget {
  const DeveloperProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     primary: true,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        title: const Text('Developer Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 130.sp,
                width: 130.sp,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: ClipOval(
                  child: Image.network(
                    'https://pbs.twimg.com/media/FKNlhKZUcAEd7FY?format=jpg&name=medium',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16.sp),
              CommonWidgets.customTextView(
                text: 'Dhruvi',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              CommonWidgets.customTextView(
                text: 'Flutter Developer',
                fontSize: 18.sp,
                color: Colors.grey,
              ),
              SizedBox(height: 16.sp),

              //About me
              Card(
                elevation: 3,
                color: Colors.blue[900],
                child: Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonWidgets.customTextView(
                        text: 'About Me',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      SizedBox(height: 8.sp),
                      CommonWidgets.customTextView(
                        text: 'Passionate Flutter developer with experience in building mobile applications.',
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.sp),

              // Skills
              Card(
                elevation: 3,
                color: Colors.blue[50],
                child: Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonWidgets.customTextView(
                        text: 'Skills',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 8.sp),
                      Wrap(
                        spacing: 8.sp,
                        runSpacing: 8.sp,
                        children: [
                          Chip(label: CommonWidgets.customTextView(text: 'Flutter')),
                          Chip(label: CommonWidgets.customTextView(text: 'Dart')),
                          Chip(label: CommonWidgets.customTextView(text: 'Firebase')),
                          Chip(label: CommonWidgets.customTextView(text: 'REST APIs')),
                          Chip(label: CommonWidgets.customTextView(text: 'Git')),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.sp),

              //Educations
              Card(
                elevation: 3,
                color: Colors.blue[800],
                child: Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonWidgets.customTextView(
                        text: 'Education',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      SizedBox(height: 8.sp),
                      CommonWidgets.customTextView(
                        text: 'Master of Computer Application from G.T.U University\nGraduation Year: 2022',
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                      SizedBox(height: 8.sp),
                      CommonWidgets.customTextView(
                        text: 'Bachelor of Computer Application from V.N.S.G.U University\nGraduation Year: 2020',
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.sp),
              //Experience
              Card(
                color: Colors.blue[100],
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonWidgets.customTextView(
                        text: 'Experience',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 8.sp),
                      CommonWidgets.customTextView(
                        text: 'Flutter Developer \nWhite Orange Software Company\nDuration: Jan 2022 - Present',
                        fontSize: 16.sp,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.sp),
              //Contact
              Card(
                color: Colors.blue[700],
                elevation: 3,
                child: Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonWidgets.customTextView(
                        text: 'Contact',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 8.sp),
                      Row(
                        children: [
                          const Icon(Icons.email),
                          SizedBox(width: 8.sp),
                          CommonWidgets.customTextView(text: 'john.doe@example.com'),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.phone),
                          SizedBox(width: 8.sp),
                          CommonWidgets.customTextView(text: '+1 (123) 456-7890'),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.link),
                          SizedBox(width: 8.sp),
                          CommonWidgets.customTextView(text: 'www.johndoe.dev'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
