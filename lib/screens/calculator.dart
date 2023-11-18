import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({ Key? key }) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  num result = 0;

  final displayOneController = TextEditingController();
  final displayTwoController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    displayOneController.text = "";
    displayTwoController.text = "";
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          DisplayCalculator(hint: "Enter a first number", controller: displayOneController),
          SizedBox(height: 30),
          DisplayCalculator(hint: "Enter a two number", controller: displayTwoController),
          SizedBox(height: 30),
          Text(
            result.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 60
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(onPressed: (){
                  setState(() {
                    result = num.tryParse(displayOneController.text)! + num.tryParse(displayTwoController.text)!;
                  });
                },
                child:const Icon(CupertinoIcons.add)
              ),
              FloatingActionButton(onPressed: (){
                  setState(() {
                    result = num.tryParse(displayOneController.text)! - num.tryParse(displayTwoController.text)!;
                  });
                },
                child:const Icon(CupertinoIcons.minus)
              ),
              FloatingActionButton(onPressed: (){
                  setState(() {
                    result = num.tryParse(displayOneController.text)! * num.tryParse(displayTwoController.text)!;
                  });
                },
                child:const Icon(CupertinoIcons.multiply)
              ),
              FloatingActionButton(onPressed: (){
                  setState(() {
                    result = num.tryParse(displayOneController.text)! / num.tryParse(displayTwoController.text)!;
                  });
              },
                  child:const Icon(CupertinoIcons.divide)
              ),
            ],
          ),
          const SizedBox(height: 10,),
          FloatingActionButton.extended(
              label: Text("Clear"),
              onPressed: (){
                setState(() {
                  result = 0;
                  displayOneController.clear();
                  displayTwoController.clear();
                });

              }
          ),
        ],
      ),
    );
  }
}

class DisplayCalculator extends StatelessWidget {
  const DisplayCalculator({
    super.key,
    this.hint = "Enter a number",
    required this.controller
  });

  final String? hint;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context)
  {
    return TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            autofocus: true,
            decoration: InputDecoration(

              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.black38,
                  width: 3.0,
                ),
                borderRadius: BorderRadius.circular(10)
              ),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Colors.black38,
                  ),
                  borderRadius: BorderRadius.circular(10)
              ),
              hintText: hint,
              hintStyle: const TextStyle(
                color: Colors.black38,
              )
            ),
          );
  }
}