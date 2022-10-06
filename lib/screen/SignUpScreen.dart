import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasedatabase/screen/HomeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isObscure = false;
  @override
  Widget build(BuildContext context) {
    //var provider=Provider.of<LoginScreenProvider>(context);
    return Scaffold(
      //backgroundColor: ColorsData.bg,

      //backgroundColor: ColorsData.b,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 52,
            ),

            SizedBox(
              height: 34,
            ),
            // Text(
            //   "Login",
            //   style: TextStyle(
            //     fontSize: 14,
            //     fontWeight: FontWeight.w700,
            //     color: ColorsData.main,
            //   ),
            // ),
            SizedBox(
              height: 24,
            ),

            TextField(
              controller: email,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.transparent, width: 0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.transparent, width: 0),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  filled: true,
                  //fillColor: textFieldColor,
                  hintText: "Username",
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  )),
            ),
            SizedBox(
              height: 26,
            ),
            TextField(
              controller: password,
              obscureText: isObscure,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.transparent, width: 0),
                  ),
                  hintStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  hintText: "Password",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.transparent, width: 0),
                  ),
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  //labelText: 'Password',
                  // this button is used to toggle the password visibility
                  suffixIcon: IconButton(
                      icon: Icon(
                          isObscure ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      })),
            ),

            SizedBox(
              height: 26,
            ),

            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  signup();
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 14)),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ))),
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  void signup() async {
    try {
      var signup = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => HomeScreen()), (route) => false);
    } catch (e) {
      print(e);
    }
  }
}
