import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:tic_tac_toe/manual.dart';
import 'package:tic_tac_toe/bot.dart';

class PlayWithBot extends StatefulWidget {
  const PlayWithBot({super.key, required this.sides});

  @override
  State<PlayWithBot> createState() => _PlayWithBotState();
  final bool sides;
}

class _PlayWithBotState extends State<PlayWithBot> {
  int? forTap;
  @override
  void initState() {
    log(widget.sides.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[200],
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  widget.sides
                      ? Text(
                          "X : ${Controller.playerXCount}",
                          style: GoogleFonts.happyMonkey(
                            color: Colors.green[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        )
                      : Text(
                          "X : ${TicTacToeSingle.playerXCount}",
                          style: GoogleFonts.happyMonkey(
                            color: Colors.green[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                  widget.sides
                      ? Controller.xTurn
                          ? SizedBox(
                              height: 50,
                              width: 50,
                              child: SvgPicture.asset(
                                  "assets/circle-svgrepo-com.svg"))
                          : SizedBox(
                              height: 50,
                              width: 50,
                              child: SvgPicture.asset(
                                "assets/cross-svgrepo-com.svg",
                              ))
                      : TicTacToeSingle.xTurn
                          ? SizedBox(
                              height: 50,
                              width: 50,
                              child: SvgPicture.asset(
                                  "assets/circle-svgrepo-com.svg"))
                          : SizedBox(
                              height: 50,
                              width: 50,
                              child: SvgPicture.asset(
                                "assets/cross-svgrepo-com.svg",
                              )),
                  widget.sides
                      ? Text(
                          "O : ${Controller.playerOCount}",
                          style: GoogleFonts.happyMonkey(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        )
                      : Text(
                          "O : ${TicTacToeSingle.playerOCount}",
                          style: GoogleFonts.happyMonkey(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  children: [
                    ...List.generate(
                        9,
                        (index) => GestureDetector(
                              onTap: widget.sides
                                  ? () {
                                      setState(() {
                                        Controller.swap(index, context);
                                        Controller.winner(context);
                                      });
                                    }
                                  : () async {
                                      if (!TicTacToeSingle.xTurn) {
                                        TicTacToeSingle.playerSwap(
                                            index, context);
                                        setState(() {});
                                      }
                                      if (TicTacToeSingle.xTurn) {
                                        await TicTacToeSingle.manualAi(context);
                                        setState(() {});
                                      }
                                    },
                              child: Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: widget.sides == false
                                        ? TicTacToeSingle.cardColor[index]
                                        : null,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.white),
                                    gradient: widget.sides == true
                                        ? Controller.cardColor[index]
                                        : null,
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.deepPurple,
                                          blurRadius: 50,
                                          offset: Offset(3, 3),
                                          spreadRadius: -10,
                                          blurStyle: BlurStyle.outer)
                                    ],
                                  ),
                                  child: Text(
                                    widget.sides == true
                                        ? Controller.value[index].toString()
                                        : TicTacToeSingle.value[index]
                                            .toString(),
                                    style: GoogleFonts.lato(fontSize: 30),
                                  )),
                            ))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      widget.sides
                          ? Controller.clearButtomn()
                          : TicTacToeSingle.clearControl();
                    });
                  },
                  child: Text("Clear"),
                ),
              )
            ],
          ),
        ));
  }
}
