import 'package:flutter/material.dart';
import 'package:cv/widgets/cv_widget.dart';
import 'package:cv/widgets/cv_image.dart';
import 'package:cv/controllers/cv_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CvScreen extends StatefulWidget {
  @override
  State<CvScreen> createState() => _CvScreenState();
}

class _CvScreenState extends State<CvScreen>
    with SingleTickerProviderStateMixin {
  CvController cvController = CvController();

  @override
  void initState() {
    super.initState();
    cvController.cvmodel.controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    cvController.cvmodel.colorAnimation = ColorTween(
            begin: Color.fromARGB(255, 115, 102, 184),
            end: Color.fromARGB(255, 225, 231, 52))
        .animate(cvController.cvmodel.controller);
    cvController.cvmodel.controller.addListener(() {
      setState(() {});
    });
    cvController.cvmodel.controller.repeat();

    Future.delayed(Duration(seconds: 600), () {
      setState(() {
        cvController.cvmodel.isloading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 115, 102, 184),
            title: Center(
              child: Text(
                'corriculum vitae',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w400),
              ),
            ),
            bottom:
                TabBar(indicatorColor: Colors.white, isScrollable: true, tabs: [
              Tab(icon: Icon(Icons.person), text: 'about me'),
              Tab(
                icon: Icon(Icons.school),
                text: 'education',
              ),
              Tab(
                icon: Icon(Icons.work_outline),
                text: 'progects',
              ),
              Tab(
                icon: Icon(Icons.work),
                text: 'skills',
              ),
              Tab(
                icon: Icon(Icons.data_saver_off),
                text: 'additional infomation',
              ),
              Tab(
                icon: Icon(Icons.link),
                text: 'references',
              ),
            ])),
        body: TabBarView(
          children: [
            Stack(children: [
              if (cvController.cvmodel.isloading)
                Center(
                  child: SpinKitFadingCircle(
                    color: const Color.fromARGB(255, 39, 137, 176),
                    size: 60,
                  ),
                ),
              CvImage(path: 'images/background.jpg'),
              Center(
                child: ListView(children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage('images/myimage.jpg'),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          color: Colors.white.withOpacity(0.3),
                          child: Text('RAED HAMDAN',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 45,
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          color: Colors.white.withOpacity(0.3),
                          child: Text(
                            'Mobile application developer, I have strong experience in designing and implementing user interfaces using the Flutter framework, and I have familiarity with the DART programming language. I am actively seeking opportunities to further cultivate my skills in Flutter development and collaborate within a team environment.',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.normal),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 10,
                          ),
                        ),
                      ]),
                ]),
              ),
            ]),
            Stack(children: [
              CvImage(path: 'images/background.jpg'),
              ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CvWidget(
                        text: 'Bachelor of telecommunication Engineering, speclaization in information technoiogy graduate 2020-2021',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                    
                  
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CvWidget(
                        text:
                            'Studied courses such as Flutter, CCNA, GSM, and CCTV',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CvWidget(
                        text:
                            'Participated in practical university projects focused on developin applications using the C++ programming langguage',
                      ),
                    ],
                  ),
                ],
              )
            ]),
            Stack(
              children: [
                CvImage(path: 'images/background.jpg'),
                ListView(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CvWidget(
                        text:
                            ' Simple Shopping cart in flutter ,using state management with provider',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CvWidget(
                        text:
                            'simple calculator in flutter , performs basic calculator operations',
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CvWidget(
                        text:
                            'Developed a  simple commerce in flutter ',
                      ),
                    ],
                  ),
                ]),
              ],
            ),
            Stack(children: [
              CvImage(path: 'images/background.jpg'),
              ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        color: cvController.cvmodel.colorAnimation.value,
                        child: CvWidget(
                            text: 'Programming Languages: Dart ,  C++ , Python '),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        color: cvController.cvmodel.colorAnimation.value,
                        child: CvWidget(
                            text: 'problem solving & troubleshooting skills'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        color: cvController.cvmodel.colorAnimation.value,
                        child: CvWidget(
                            text: 'knowledge of version control systems (e.g. Git,Git Hub)'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        color: cvController.cvmodel.colorAnimation.value,
                        child: CvWidget(
                            text:
                                'Excellent handling of Micosoft office : (Word ,Excel ,powerpoint ,Outlook) '),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        color: cvController.cvmodel.colorAnimation.value,
                        child: CvWidget(
                            text:
                                'Flutter package : strong proficieny in flutter packages'),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        color: cvController.cvmodel.colorAnimation.value,
                        child: CvWidget(text: 'social media specialist : facebook , instagram'),
                      ),
                    ],
                  ),

///////////
                ],
              )
            ]),
            Stack(children: [
              CvImage(path: 'images/background.jpg'),
              ListView(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CvWidget(
                      text: 'good in English ',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CvWidget(
                      text:
                          'Strong problem-solving and critical thinking abilities',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CvWidget(
                      text: 'Excellent communication and teamwork skills',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CvWidget(
                      text:
                          'flexibility and cooperation',
                    ),
                  ],
                ),
              ]),
            ]),
            Stack(children: [
              CvImage(path: 'images/background.jpg'),
              ListView(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: InkWell(
                          onTap: cvController.launchURL,
                          child: CvWidget(
                              text:
                                  'https://www.linkedin.com/in/raed-hamdan-091ab51a5')),
                    ),
                  ],
                ),
              ])
            ]),
          ],
        ),
      ),
    );
  }
}
