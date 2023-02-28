import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../layout/news_app/news_layout.dart';
import '../../../shared/local/cache_helper.dart';

class BordingModel {
  final String? image;
  final String? body;
  final String? title;

  BordingModel({required this.image, required this.body, required this.title});
}
class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({Key? key}) : super(key: key);

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  var boarController = PageController();

  List<BordingModel> bording = [
    BordingModel(
      image: 'assets/images/sport.avif',
      body: 'Sports news and live sports coverage  ',
      title: '1',
    ),
    BordingModel(
      image: 'assets/images/bis.jpeg',
      body: 'business news and live , audio and  on Football',
      title: '2',
    ),
    BordingModel(
      image: 'assets/images/sinc.png',
      body: 'science news and udio and analysis ',
      title: '3',
    )
  ];




  void submit(){
     CacheHelper.saveData(key: 'onBording', value: true).then((value){
      if(value == true){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> NesLayout()),
                (route) => false);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor, // Colors.white,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () {
              submit();
            },
            child: Text(
              'Skip',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: boarController,
                itemBuilder: (context, index) =>
                    buildBoardingItem(bording[index]),
                itemCount: bording.length,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boarController,
                  count: bording.length,
                  axisDirection: Axis.horizontal,
                  effect: SlideEffect(
                    spacing: 8.0,
                    radius: 30.0,
                    dotWidth: 16.0,
                    dotHeight: 16.0,
                    paintStyle: PaintingStyle.stroke,
                    strokeWidth: 1.5,
                    dotColor: Colors.grey,
                    activeDotColor: Colors.indigo,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    submit();
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),
                  backgroundColor: Colors.orange,
                )
              ],
            )
          ],
        ),
      ),
    );
  }


  Widget buildBoardingItem(BordingModel model) => Column(
        children: [
          Expanded(
            child: Image(
              image: AssetImage('${model.image}'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '${model.body}',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text('${model.title}',
              style: TextStyle(fontSize: 14, color: Colors.grey)),
          SizedBox(
            height: 20,
          ),
        ],
      );
}
