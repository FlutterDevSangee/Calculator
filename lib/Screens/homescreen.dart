import 'package:calculator_app/Screens/history.dart';
import 'package:calculator_app/Controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorScreen extends StatelessWidget {
  CalculatorScreen({super.key});
  final calcuCntlr = Get.put(CalculatorController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GetBuilder<CalculatorController>(builder: (_) {
      return PageView(
        controller: calcuCntlr.pageController,
        scrollDirection: Axis.vertical,
        children: [
          HistoryPage(history: calcuCntlr.history),
          _calculatorPage(context),
        ],
      );
    }));
  }

  //-------------------------
  Widget _calculatorPage(context) {
    return GetBuilder<CalculatorController>(builder: (_) {
      return Column(
        children: <Widget>[
          Obx(
            () => Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.35,
              color: Colors.black,
              // color: const Color(0xFF282828),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 28, left: 28, bottom: 10),
                    child: Text(
                      calcuCntlr.input.value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Comfortaa',
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 28, left: 28, bottom: 28),
                    child: Text(
                      calcuCntlr.output.toString().isEmpty
                          ? ''
                          : calcuCntlr.output.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Comfortaa',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              // color: const Color(0xFF282828),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
                child: GridView.count(
                  crossAxisCount: 4,
                  children: [
                    // 1 row
                    Center(
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF303030),
                        ),
                        width: 75,
                        height: 75,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Color(0xFF727272),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary:
                                  const Color(0xFF424242), // Background color
                              onPrimary: Colors.white, // Text color
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(8.0),
                            ),
                            // style: OutlinedButton.styleFrom(
                            //   // splashColor: Colors.white12,
                            //   shape: const CircleBorder(),
                            //   side: const BorderSide(color: Colors.white38),
                            //   backgroundColor: const Color(0xFF424242),
                            // ),
                            onPressed: () {
                              calcuCntlr.input.value = '';
                              calcuCntlr.output = 0.0;
                            },

                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'C',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 28,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF303030),
                        ),
                        width: 75,
                        height: 75,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Color(0xFF727272),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary:
                                  const Color(0xFF424242), // Background color
                              onPrimary: Colors.white, // Text color
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(8.0),
                            ),
                            onPressed: () {
                              if (calcuCntlr.input.value.isNotEmpty) {
                                calcuCntlr.input.value = calcuCntlr.input.value
                                    .substring(
                                        0, calcuCntlr.input.value.length - 2);
                              }
                            },
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Text(
                                  "\u232b",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 28,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF303030),
                        ),
                        width: 75,
                        height: 75,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Color(0xFF727272),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary:
                                  const Color(0xFF424242), // Background color
                              onPrimary: Colors.white, // Text color
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(8.0),
                            ),
                            onPressed: () {
                              calcuCntlr.input.value += '% ';
                            },
                            child: const Center(
                              child: Text(
                                '%',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF303030),
                        ),
                        width: 75,
                        height: 75,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Color(0xFF727272),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary:
                                  const Color(0xFF424242), // Background color
                              onPrimary: Colors.white, // Text color
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(8.0),
                              side: const BorderSide(
                                  color: Colors.white12), // Border color
                            ),
                            onPressed: () {
                              calcuCntlr.input.value += '/ ';
                            },
                            child: const Center(
                              child: Text(
                                '÷',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // 2 row
                    Center(
                      child: Container(
                        width: 75,
                        height: 75,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Color(0xFF727272),
                          ),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white38),
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(8.0),
                              backgroundColor: const Color(0xFF282828),

                              // backgroundColor: const Color(0xFF424242),
                            ),
                            onPressed: () {
                              calcuCntlr.input.value += '7 ';
                            },
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '7',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 28,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 75,
                        height: 75,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Color(0xFF727272),
                          ),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white38),
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(8.0),
                              backgroundColor: const Color(0xFF282828),
                              //   backgroundColor: const Color(0xFF424242),
                            ),
                            onPressed: () {
                              calcuCntlr.input.value += '8 ';
                            },
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '8',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 28,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 75,
                        height: 75,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Color(0xFF727272),
                          ),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white38),
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(8.0),
                              backgroundColor: const Color(0xFF282828),
                              // backgroundColor: const Color(0xFF424242),
                            ),
                            onPressed: () {
                              calcuCntlr.input.value += '9 ';
                            },
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '9',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 28,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Center(
                      child: Container(
                        width: 75,
                        height: 75,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Color(0xFF727272),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary:
                                  const Color(0xFF424242), // Background color
                              onPrimary: Colors.white, // Text color
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(8.0),
                            ),
                            onPressed: () {
                              calcuCntlr.input.value += '* ';
                            },
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.close,
                                  size: 28,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // 3 row
                    Center(
                      child: Container(
                        width: 75,
                        height: 75,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Color(0xFF727272),
                          ),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white38),
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(8.0),
                              backgroundColor: const Color(0xFF282828),

                              // backgroundColor: const Color(0xFF424242),
                            ),
                            onPressed: () {
                              calcuCntlr.input.value += '4 ';
                            },
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '4',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 28,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 75,
                        height: 75,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Color(0xFF727272),
                          ),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white38),
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(8.0),
                              backgroundColor: const Color(0xFF282828),

                              // backgroundColor: const Color(0xFF424242),
                            ),
                            onPressed: () {
                              calcuCntlr.input.value += '5 ';
                            },
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '5',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 28,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 75,
                        height: 75,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Color(0xFF727272),
                          ),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white38),
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(8.0),
                              backgroundColor: const Color(0xFF282828),

                              // backgroundColor: const Color(0xFF424242),
                            ),
                            onPressed: () {
                              calcuCntlr.input.value += '6 ';
                            },
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '6',
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 75,
                        height: 75,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Color(0xFF727272),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary:
                                  const Color(0xFF424242), // Background color
                              onPrimary: Colors.white, // Text color
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(8.0),
                            ),
                            onPressed: () {
                              calcuCntlr.input.value += '- ';
                            },
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    fontSize: 42,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // 4 row
                    Center(
                      child: Container(
                        width: 75,
                        height: 75,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Color(0xFF727272),
                          ),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white38),
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(8.0),
                              backgroundColor: const Color(0xFF282828),

                              // backgroundColor: const Color(0xFF424242),
                            ),
                            onPressed: () {
                              calcuCntlr.input.value += '1 ';
                            },
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 28,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 75,
                        height: 75,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Color(0xFF727272),
                          ),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white38),
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(8.0),
                              backgroundColor: const Color(0xFF282828),

                              // backgroundColor: const Color(0xFF424242),
                            ),
                            onPressed: () {
                              calcuCntlr.input.value += '2 ';
                            },
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '2',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 28,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 75,
                        height: 75,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Color(0xFF727272),
                          ),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white38),
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(8.0),
                              backgroundColor: const Color(0xFF282828),

                              //  backgroundColor: const Color(0xFF424242),
                            ),
                            onPressed: () {
                              calcuCntlr.input.value += '3 ';
                            },
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '3',
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 75,
                        height: 75,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Color(0xFF727272),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary:
                                  const Color(0xFF424242), // Background color
                              onPrimary: Colors.white, // Text color
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(0),
                            ),
                            onPressed: () {
                              calcuCntlr.input.value += '+ ';
                            },
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    fontSize: 42,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    // 5 row
                    Center(
                      child: Container(
                        width: 75,
                        height: 75,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Color(0xFF727272),
                          ),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white38),
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(8.0),
                              backgroundColor: const Color(0xFF282828),

                              // backgroundColor: const Color(0xFF424242),
                            ),
                            onPressed: () {
                              calcuCntlr.input.value += '^ ';
                            },
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '^',
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 75,
                        height: 75,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Color(0xFF727272),
                          ),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white38),
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(8.0),
                              backgroundColor: const Color(0xFF282828),

                              // backgroundColor: const Color(0xFF424242),
                            ),
                            onPressed: () {
                              calcuCntlr.input.value += '0 ';
                            },
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '0',
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 75,
                        height: 75,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Color(0xFF727272),
                          ),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.white38),
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(8.0),
                              backgroundColor: const Color(0xFF282828),

                              // backgroundColor: const Color(0xFF424242),
                            ),
                            onPressed: () {
                              calcuCntlr.input.value += '. ';
                            },
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  '.',
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Center(
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFF7556),
                        ),
                        width: 75,
                        height: 75,
                        child: Ink(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Color(0xFFFF7556),
                          ),
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: Color(0xFFFF7556),
                                width: 2.0, // Adjust the border width as needed
                              ),
                              shape: const CircleBorder(),
                              backgroundColor: const Color(0xFFFF7556),
                            ),
                            onPressed: () {
                              calcuCntlr.submit();
                            },
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(0),
                                child: Text(
                                  '=',
                                  style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
