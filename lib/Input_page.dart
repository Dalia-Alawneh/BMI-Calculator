import 'package:calculator/CalculatorBrain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'BottonContainer.dart';
import 'ContainerCardReuse.dart';
import 'IconContent.dart';
import 'result_page.dart';
const Color inactiveCardColor = Color(0xff13182f);
const Color activeCardColor = Color(0xff1d1e33);
const double bottonContainerHeight =80.0;
const Color bottonContainerColor =Color(0xffeb1555);
enum Gender {
  male,
  female
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
int hoverColor= 0xff080B1D;
int cardColor = 0xff1D1F33;
class _InputPageState extends State<InputPage> {
  Color maleColor = inactiveCardColor;
  Color femaleColor = inactiveCardColor;
  Gender selectedGender=Gender.male;
  int height =180;
  int weight = 60;
  int age = 20;
  TextStyle textStyle = TextStyle(color: Color(0xff8d8e98), fontSize: 18);
  TextStyle numStyle =TextStyle(fontSize: 48, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
              children: [
              Expanded(
                  child: GestureDetector(
                    onTap: (){
                    setState(() {
                      selectedGender =Gender.male;
                    });
                    },
                    child: ContainerCardReuse(
                        color: selectedGender == Gender.male ?activeCardColor : inactiveCardColor,
                        cardChild:
                        IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                        )
                    ),
                  )
              ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedGender=Gender.female;
                      });
                    },
                    child: ContainerCardReuse(
                        color: selectedGender == Gender.female? activeCardColor: inactiveCardColor,
                      cardChild:  IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      )
                    ),
                  )
              )
            ],
          )),
          Expanded(
              child: ContainerCardReuse(
                  color: Color(cardColor),
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('HEIGHT',
                    style: textStyle,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(),
                        style: numStyle,
                        ),
                        Text('cm'),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbColor: Color(0xffeb1555),
                        activeTrackColor: Color(0xffffffff),
                        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                        overlayColor: Color(0x29eb1555),
                        trackHeight:1.0
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        inactiveColor: Color(0xff8d8e98),
                        onChanged: (double value) {
                          setState(() {
                            height=value.round();
                          });

                        },

                      ),
                    )
                  ],
                )
              )
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ContainerCardReuse(
                        color: Color(cardColor),
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('WEIGHT', style: textStyle,),
                          Text(weight.toString(), style: numStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },),
                              RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },)
                            ],
                          )
                        ],
                      ),
                    )
                ),
                Expanded(
                    child: ContainerCardReuse(
                        color: Color(cardColor),
                      cardChild:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Age', style: textStyle,),
                          Text(age.toString(), style: numStyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RoundIconButton(icon: FontAwesomeIcons.plus,onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },),
                              RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },)
                            ],
                          )
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
          BottomContainer(text: Text('CALCULATE',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              )),
              onTap:  (){
            CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>result_page (
                       calc.calculateBMT(),
                       calc.getResult(),
                       calc.getInterpretation(),
                    )));
              },)

        ],
      )
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({required this.icon, required this.onPressed});
  final IconData icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0

      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}

