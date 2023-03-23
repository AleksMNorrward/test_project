import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:country_code_picker/country_code_picker.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final maskFormatter = MaskTextInputFormatter(mask: '(###) ###-##-##)');
  bool isButtonActive = true;
  bool isActive = true;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    controller.addListener(() {
      final isActive = controller.text.length == 15? true : false;
      setState(() => this.isActive = isActive);
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(142, 170, 251, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 70.0, left: 30.0),
              child: Text('Get Started',
              style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
              ),
              ),
            ),
            const SizedBox(height: 130),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(   
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color:  const Color.fromARGB(75, 255, 255, 255),
                    ),
                  child: CountryCodePicker(
                    onChanged: print,
                    initialSelection: '+380',
                    flagDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    searchDecoration: const InputDecoration(
                      hintText: 'Search',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Color.fromRGBO(142, 170, 251, 1), width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        borderSide: BorderSide(color: Color.fromRGBO(142, 170, 251, 1), width: 1.0),
                      ),
                      filled: true,
                      fillColor: Color.fromARGB(75, 255, 255, 255),
                    ),
                  ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Container(
                      width: 230,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color:  const Color.fromARGB(75, 255, 255, 255),
                      ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        autofocus: true,
                        decoration: const InputDecoration(
                          hintText: '(093) 123-12-12',
                        border: InputBorder.none),
                          keyboardType: TextInputType.number,
                          inputFormatters: [maskFormatter
                            ],
                        controller: controller,
                        ),
                    ),
                    ),
                  ),
            ]),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0, right: 40.0),
                child: SizedBox(
                  height: 45,
                  width: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(51, 206, 218, 255), 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )
                    ),
                    onPressed: isActive ? () {
                      setState(() => isActive = false);
                      print("Well done");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Container(
                          height: 90,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(75, 255, 255, 255),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: const [
                              SizedBox(height: 10),
                              Text("Well done!",
                              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold ,color: Color.fromARGB(255, 28, 17, 173)), 
                              ),
                              SizedBox(height: 10),
                              Text("You've entered",
                              style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 8, 17, 136)), 
                              ),
                            ],
                          ),
                        ),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        ),
                      );
                      controller.clear();
                    }: null,
                    child: const Icon(Icons.arrow_forward_outlined), 
                  ),
                ),
              ),
            ),
          ],
        ),
      );
  }
}