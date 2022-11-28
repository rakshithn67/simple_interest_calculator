// import 'package:flutter/material.dart';
//
// class CalculatorScreen extends StatefulWidget {
//   const CalculatorScreen({Key? key}) : super(key: key);
//
//   @override
//   State<CalculatorScreen> createState() => _CalculatorScreenState();
// }
//
// class _CalculatorScreenState extends State<CalculatorScreen> {
//   final _formKey = GlobalKey<FormState>();
//   var displayResult = '';
//   var principalController = TextEditingController();
//   var roiController = TextEditingController();
//   var termController = TextEditingController();
//
//   _calculateTotalReturns() {
//     double principal = double.parse(principalController.text);
//     double roi = double.parse(roiController.text);
//     double term = double.parse(termController.text);
//     double totalPayableAmount = principal + (principal * roi * term) / 100;
//     String result =
//         'After $term years ,your investment will be worth $totalPayableAmount $currentItemSelected ';
//     return result;
//   }
//
//   _reset() {
//     principalController.text = '';
//     roiController.text = '';
//     termController.text = '';
//     currentItemSelected = _currencies[0];
//     displayResult = '';
//   }
//
//   final _currencies = ['Rupees', 'Dollar', 'Euro'];
//   String currentItemSelected = 'Rupees';
//   final String image =
//       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkBWBB4p95AmtGtV5Ro9MtF-mSsJKa3m9IRkBHmLfHtf8Y_Q6uox4k9Wfsf3xIDXKs8d8&usqp=CAU';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Simple Interest Calculator'),
//         centerTitle: true,
//       ),
//       body: ListView(children: [
//         Container(
//           padding: const EdgeInsets.all(5),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 Padding(
//                     padding: const EdgeInsets.all(5),
//                     child: Image.network(image)),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 5, bottom: 5),
//                   child: TextFormField(
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter a principal  amount';
//                       }
//                       return null;
//                     },
//                     controller: principalController,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                         errorStyle: const TextStyle(
//                             color: Colors.yellowAccent, fontSize: 10),
//                         labelStyle: const TextStyle(color: Colors.white),
//                         hintStyle: const TextStyle(color: Colors.white),
//                         hintText: 'Enter Principal e.g 12000',
//                         labelText: 'Principal',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 5, bottom: 5),
//                   child: TextFormField(
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter a Interest';
//                       }
//                       return null;
//                     },
//                     controller: roiController,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                         errorStyle: const TextStyle(
//                             color: Colors.yellowAccent, fontSize: 10),
//                         labelStyle: const TextStyle(color: Colors.white),
//                         hintStyle: const TextStyle(color: Colors.white),
//                         hintText: 'In percent',
//                         labelText: 'Rate Of Interest',
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10))),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 5, bottom: 5),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: TextFormField(
//                           validator: (value) {
//                             if (value!.isEmpty) {
//                               return 'Please enter a term';
//                             }
//                             return null;
//                           },
//                           controller: termController,
//                           keyboardType: TextInputType.number,
//                           decoration: InputDecoration(
//                               errorStyle: const TextStyle(
//                                   color: Colors.yellowAccent, fontSize: 10),
//                               labelStyle: const TextStyle(color: Colors.white),
//                               hintStyle: const TextStyle(color: Colors.white),
//                               labelText: 'Term',
//                               hintText: 'Time in Years',
//                               border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(10))),
//                         ),
//                       ),
//                       Container(width: 10),
//                       Expanded(
//                         child: DropdownButton(
//                           items: _currencies.map((itemValue) {
//                             return DropdownMenuItem<String>(
//                               value: itemValue,
//                               child: Text(itemValue),
//                             );
//                           }).toList(),
//                           value: currentItemSelected,
//                           onChanged: (newItemValue) {
//                             setState(() {
//                               currentItemSelected = newItemValue.toString();
//                             });
//                           },
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top: 5, bottom: 5),
//                   child: Row(
//                     children: [
//                       Expanded(
//                           child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                   primary: Colors.blue),
//                               onPressed: () {
//                                 if (_formKey.currentState!.validate()) {
//                                   setState(() {
//                                     displayResult = _calculateTotalReturns();
//                                   });
//                                 }
//                               },
//                               child: const Text(
//                                 'Calculate',
//                                 style: TextStyle(color: Colors.black),
//                               ))),
//                       Expanded(
//                           child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                   primary: Colors.black),
//                               onPressed: () {
//                                 setState(() {
//                                   _reset();
//                                 });
//                               },
//                               child: const Text(
//                                 'Reset',
//                                 style: TextStyle(color: Colors.white),
//                               )))
//                     ],
//                   ),
//                 ),
//                 Text(
//                   displayResult,
//                   style: const TextStyle(fontSize: 20),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/simple_interest_provider.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final String image =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkBWBB4p95AmtGtV5Ro9MtF-mSsJKa3m9IRkBHmLfHtf8Y_Q6uox4k9Wfsf3xIDXKs8d8&usqp=CAU';
  @override
  Widget build(BuildContext context) {
    final siData = context.watch<SiProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Interest Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              child: Form(
                key: siData.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Image.network(image),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a principal  amount';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        controller: siData.principalController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            errorStyle: const TextStyle(
                                color: Colors.yellowAccent, fontSize: 10),
                            labelStyle: const TextStyle(color: Colors.white),
                            hintStyle: const TextStyle(color: Colors.white),
                            hintText: 'Enter Principal e.g 12000',
                            labelText: 'Principal',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a Interest';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        controller: siData.roiController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            errorStyle: const TextStyle(
                                color: Colors.yellowAccent, fontSize: 10),
                            labelStyle: const TextStyle(color: Colors.white),
                            hintStyle: const TextStyle(color: Colors.white),
                            hintText: 'In percent',
                            labelText: 'Rate Of Interest',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter a term';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.done,
                              controller: siData.termController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  errorStyle: const TextStyle(
                                      color: Colors.yellowAccent, fontSize: 10),
                                  labelStyle:
                                      const TextStyle(color: Colors.white),
                                  hintStyle:
                                      const TextStyle(color: Colors.white),
                                  labelText: 'Term',
                                  hintText: 'Time in Years',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            child: DropdownButton(
                              items: siData.currencies.map((itemValue) {
                                return DropdownMenuItem<String>(
                                  value: itemValue,
                                  child: Text(itemValue),
                                );
                              }).toList(),
                              value: siData.currentItemSelected,
                              onChanged: (newItemValue) {
                                siData.currentItemSelection(newItemValue);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.blue,
                              shape: const StadiumBorder(),
                              fixedSize: const Size(150, 0),
                            ),
                            onPressed: () {
                              if (siData.formKey.currentState!.validate()) {
                                siData.calculateTotalReturns();
                              }
                            },
                            child: const Text(
                              'Calculate',
                              style: TextStyle(
                                  fontSize: 16, fontStyle: FontStyle.italic),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.black,
                              shape: const StadiumBorder(),
                              fixedSize: const Size(150, 0),
                            ),
                            onPressed: () {
                              siData.reset();
                            },
                            child: const Text(
                              'Reset',
                              style: TextStyle(
                                  fontSize: 16, fontStyle: FontStyle.italic),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    siData.isPressed
                        ? Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              siData.displayResult,
                              style: const TextStyle(fontSize: 20,color: Colors.black87),
                            ),
                          )
                        : const Center()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
