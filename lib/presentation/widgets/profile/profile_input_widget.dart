import 'package:flutter/material.dart';

typedef StringCallback = void Function(String category);

class ProfileInput extends StatefulWidget {
  const ProfileInput({Key? key, required this.hint, required this.onSonChanged})
      : super(key: key);
  final String hint;
  final StringCallback onSonChanged;
  @override
  State<ProfileInput> createState() => _ProfileInputState();
}

class _ProfileInputState extends State<ProfileInput> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.032,
            right: screenWidth * 0.032,
            bottom: screenHeight * 0.02),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 5,
                      color: Color.fromRGBO(0, 0, 0, 0.15),
                      offset: Offset(0, 5))
                ]),
            child: Container(
              height: screenHeight * 0.063,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(45)),
              child: TextField(
                onChanged: (text) {
                  widget.onSonChanged(text);
                },
                style: TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w500,
                  fontSize: screenHeight * 0.022,
                ),
                decoration: InputDecoration(
                    hintText: widget.hint,
                    hintStyle: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w300,
                      fontSize: screenHeight * 0.022,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(45),
                        borderSide:
                            const BorderSide(color: Colors.black, width: 1))),
              ),
            )));
  }
}
