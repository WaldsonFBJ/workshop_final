import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:movieinfo/api/key.dart';

import 'login.dart';

class SignupScreen extends StatelessWidget {
   SignupScreen({Key? key}) : super(key: key);

   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();
   final TextEditingController confirmPasswordController = TextEditingController();
   final TextEditingController nomeController = TextEditingController();
   final TextEditingController apelidoController = TextEditingController();
   final TextEditingController cpfController = TextEditingController();
   final TextEditingController dataNascimentoController = TextEditingController();
   final TextEditingController telefoneController = TextEditingController();

   late  DateTime? _selectedDate;

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
        },icon:const Icon(Icons.arrow_back_ios,size: 20,color: Colors.white,)), systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
            Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Cadrasto",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Crie uma conta, é gratis",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        makeInput(
                            label: "Email", controller: emailController),
                        makeInput(
                            label: "Senha",
                            obscureText: true,
                            controller: passwordController),
                        makeInput(
                            label: "Confirmar Senha",
                            obscureText: true,
                            controller: confirmPasswordController),
                        makeInput(
                            label: "Nome completo",
                            controller: nomeController),
                        makeInput(
                            label: "Apelido",
                            controller: apelidoController),
                        makeInput(
                            label: "Cpf",
                            controller: cpfController),
                        DateInput(
                          label: 'Data de nascimento',
                          controller: dataNascimentoController,
                          onSelected: (DateTime? selectedDate) {
                            _selectedDate = selectedDate;
                          },
                        ),
                        makeInput(
                            label: "Telefone",
                            controller: telefoneController),
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

                              String email = emailController.text.trim();
                              String password = passwordController.text.trim();
                              String nome = nomeController.text.trim();
                              String apelido = apelidoController.text.trim();
                              String cpf = cpfController.text.trim();
                              String telefone = telefoneController.text.trim();
                              DateTime signUpDate = DateTime.now();
                              DateTime? selectedDate = _selectedDate;


                              var response = await http.get(Uri.parse('https://moviemystic-project-production.up.railway.app/cadastro$email'));

                              if (response.statusCode == 200) {

                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Usuario ja existe')));
                              } else if (response.statusCode == 404) {
                                var createUserResponse = await http.post(Uri.parse(usuarioUrl), body: json.encode({
                                  'email': email,
                                  'senha': password,
                                  'dataCadastro': signUpDate.toString(),
                                  'usuario':{
                                    "nome": nome,
                                    "apelido": apelido,
                                    "cpf": cpf,
                                    "dataNascimento": selectedDate.toString(),
                                    "telefone": telefone,
                                  },
                                }));

                                if (createUserResponse.statusCode == 200) {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginScreen()),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Erro ao criar a conta')));
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Peencha os campos para poder se registrar')));
                              }
                            },
                          color: Colors.yellowAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)
                          ),
                          child: const Text("Cadraste-se",style: TextStyle(
                            fontWeight: FontWeight.w600,fontSize: 16,

                          ),),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Ja tem uma conta ? "),
                        Text("Login",style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18
                        ),),
                      ],
                    )
                  ],

                ),
              ],
            ),
          ]),
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
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 5,),
      TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border:  OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white)
          ),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      const SizedBox(height: 30,),
    ],
  );
}

class DateInput extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final Function(DateTime?) onSelected;

  const DateInput({
    Key? key,
    required this.label,
    required this.controller,
    required this.onSelected,
  }) : super(key: key);

  @override
  _DateInputState createState() => _DateInputState();
}

class _DateInputState extends State<DateInput> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selected != null) {
      setState(() {
        _selectedDate = selected;
        widget.controller.text = DateFormat('yyyy/MM/dd').format(selected);
        widget.onSelected(_selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String hintText = _selectedDate == null
        ? 'selecionar uma data'
        : DateFormat('yyyy/MM/dd').format(_selectedDate!);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () => _selectDate(context),
          child: IgnorePointer(
            child: TextFormField(
              controller: widget.controller,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}