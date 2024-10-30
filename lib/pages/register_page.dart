import 'package:flutter/material.dart';
import 'package:flutter_chat_app/components/my_button.dart';
import 'package:flutter_chat_app/components/my_input.dart';
import 'package:flutter_chat_app/pages/login_page.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();
   RegisterPage({super.key});

   void register() {

   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
              ),

              const SizedBox(height: 50,),
            //message
            Text(
              "Let's create an account for you!",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16
              ),
            ),

            const SizedBox(height: 25,),
            //input
            MyInput(
              text: "Email",
              obscureText: false,
              controller: _emailController,
            ),
            const SizedBox(height: 10,),
            MyInput(
              text: "Password",
              obscureText: true,
              controller: _pwController,
            ),
            const SizedBox(height: 10,),
            MyInput(
              text: "Confirm Password",
              obscureText: true,
              controller: _confirmPwController,
            ),
             const SizedBox(height: 25,),
            //login button
            MyButton(
              label: "Register",
              onTap: register,
            ),
            const SizedBox(height: 25,),
            //register link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary
                  ),
                  ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                        builder: (context)=>LoginPage()
                        ));
                  },
                  child: Text(
                    "Login now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary
                    ),
                    ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}