import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieinfo/screens/login_signup_screen/signup.dart';
import 'package:http/http.dart' as http;

import '../bottom_nav_bar.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black45,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black45,
        leading:
        IconButton( onPressed: (){
          Navigator.pop(context);
        },icon: const Icon(Icons.arrow_back_ios,size: 20,color: Colors.white,)), systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Column(
                    children: const [
                      Text ("Login", style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),),
                      SizedBox(height: 20,),
                      Text("Seja bem vindo de volta! Logue com suas credenciais",style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),),
                      SizedBox(height: 30,)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40
                    ),
                    child: Column(
                      children: [
                        makeInput(label: 'Email',
                            controller: _emailController),
                        makeInput(label: 'Senha',
                            obscureText: true,
                            controller: _passwordController),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                      padding: const EdgeInsets.only(top: 3,left: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          border: const Border(
                              bottom: BorderSide(color: Colors.black),
                              top: BorderSide(color: Colors.black),
                              right: BorderSide(color: Colors.black),
                              left: BorderSide(color: Colors.black)
                          )
                      ),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height:60,
                        onPressed: () async {
                      final email = _emailController.text;
                      final password = _passwordController.text;

                      if (email.isNotEmpty && password.isNotEmpty) {
                      final response = await http.get(Uri.parse('https://moviemystic-project-production.up.railway.app/cadastro=$email&password=$password'));
                      if (response.statusCode == 200) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const BottomNavBar()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Erro ao conectar')));
                      }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Preencha os campos para poder realizar login')));
                      }
                      },
                        color: Colors.deepPurpleAccent[400],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)
                        ),
                        child: const Text('Login',style: TextStyle(
                            fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white
                        ),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Não tem uma conta ? ',style: TextStyle(
                        color: Colors.white,
                      ),
                      ),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen()));
                        },
                        child: const Text('Cadraste-se',style: TextStyle(
                            color: Colors.yellowAccent,
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),),
                      ),
                    ],
                  )
                ],

              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget makeInput({label, obscureText = false, controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),
      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: const InputDecoration(
          contentPadding:
          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      const SizedBox(
        height: 30,
      )
    ],
  );
}