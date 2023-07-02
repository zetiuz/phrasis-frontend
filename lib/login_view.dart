import 'package:flutter/material.dart';
import 'package:phrasis_frontend/sign_up/first_view.dart';
import 'package:phrasis_frontend/widget/password_field.dart';
import 'package:phrasis_frontend/widget/email_field.dart';

const phPrimary = Color(0xFF604777);
const phSecondary = Color(0xFFEBE8EE);

const String loginLabelText = 'Entrar';
const String haveUser = '¿No tienes cuenta?';
const String signUpLabelText = 'Registrate';
const String titleText = 'Iniciar sesión';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: phSecondary,
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: SafeArea(
                child: Padding(
                padding: const EdgeInsets.all(21.0),
                  child: Center(
                    child: _form(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

  Widget _form() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 55),
          _Title(),
          const SizedBox(height: 34),
          EmailField(controller: emailController),
          const SizedBox(height: 21),
          PasswordField(controller: passwordController),
          const SizedBox(height: 21),
          _LoginButton(),
          _SignUp(),
        ],
      ),
    );

  }

  Widget _Title() {
    return Text(
      titleText,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _LoginButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                email: emailController.text,
              )
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please fill nput')
            ),
          );
        }
      },
      child: SizedBox(
        width: double.infinity,
        child: const Text(
          loginLabelText,
          textAlign: TextAlign.center,
        ),
      ),
    );

  }

  Widget _SignUp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(haveUser),
        TextButton(
          child: const Text(
            signUpLabelText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => First()
              ),
            );
          },
        ),
      ],
    );
  }

}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        body: Column(
          children: [
            Text(email),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Go back!"),
              ),
            ),
          ],
        ) );
  }
}