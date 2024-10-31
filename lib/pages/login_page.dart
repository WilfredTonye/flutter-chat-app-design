import 'package:flutter/material.dart';
import 'package:flutter_chat_app/services/auth_service.dart';
import 'package:flutter_chat_app/components/my_button.dart';
import 'package:flutter_chat_app/components/my_input.dart';
import 'package:flutter_chat_app/pages/register_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
   LoginPage({super.key});

   void login(BuildContext context) async {
    //authservice
    final authService = AuthService();

    try {
      await authService.signIn(
        _emailController.text, 
        _pwController.text
        );
    }
    catch(e) {
      showDialog(
        context: context, 
        builder: (context)=> AlertDialog(
          title: Text(e.toString()),
        ));
    }
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
              "Welcome back, you've been missed!",
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
             const SizedBox(height: 25,),
            //login button
            MyButton(
              label: "Login",
              onTap: () => login(context),
            ),
            const SizedBox(height: 25,),
            //register link
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary
                  ),
                  ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage()));
                  },
                  child: Text(
                    "Register now",
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