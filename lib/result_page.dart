import 'package:flutter/material.dart';
import 'BottonContainer.dart';
import 'Input_page.dart';
import 'ContainerCardReuse.dart';
class result_page extends StatefulWidget {
  result_page(@required this.bmiResult,@required this.resultText, @required this.interpretation);
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  State<result_page> createState() => _result_pageState();
}

class _result_pageState extends State<result_page> {


  @override
  void initState(){
    super.initState();
    print(widget.bmiResult);

  }

@override
Widget build(BuildContext context) {
  return  Scaffold(
    appBar: AppBar(
      title: Center(child: Text('BMI CALCULATOR')),
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(15),
          child: Text('Your Result',
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold
            ),
          ),)),
        Expanded(
            flex: 5,
            child: ContainerCardReuse(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                  widget.resultText
                  ,style: TextStyle(
                      color: Color(0xff24d876),
                      fontSize: 22
                  ),),
                  Text(widget.bmiResult, style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold
                  ),),
                  Text(widget.interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22
                    ),)
                ],
              ),
              color: activeCardColor,)),
        BottomContainer(text: Text('RE-CALCULATE',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
            )),
            onTap: (){
              Navigator.pop(context);
            })


      ],
    ),
  );
}
}

