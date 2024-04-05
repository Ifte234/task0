import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task0/Screens/features/mainScren/HomeScreen.dart';
import 'package:task0/utils/constants/sizes.dart';
import '../../../../utils/sharedPref/sharedPreferences.dart';
import '../validators/validate.dart';
import 'widgets/FormSubmitBtn.dart';
import 'widgets/myTextFormField.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var Validators = Validation();
  final _SP = SP();

  final _formkey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: MySizes.spaceBetweenSections,
              ),
              const Text(
                "Sign Up",
                style: TextStyle(
                    fontSize: MySizes.textSizeheadingsMedium,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: MySizes.spaceBetweenItems,
              ),
              const Text(
                "Create Your Account",
                style: TextStyle(
                    fontWeight: FontWeight.w400, fontSize: MySizes.textLarge),
              ),
              const SizedBox(
                height: MySizes.spaceBetweenSections,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                    key: _formkey,
                    child: Flexible(
                      child: Column(
                        children: [
                          MyTextField(
                            validator: Validators.NameValidator,
                            labelText: 'Name',
                            hintText: "Enter Your Name",
                            prefixIcon: Icons.person,
                            controller: nameController,
                            onchange: () {},
                            onSaved: () {},
                          ),
                          const SizedBox(
                            height: MySizes.spaceBetweenItems,
                          ),
                          MyTextField(
                            validator: Validators.EmailValidator,
                            controller: emailController,
                            labelText: 'Email',
                            hintText: "Enter Your Email",
                            prefixIcon: Icons.mail,
                            onchange: () {},
                            onSaved: () {},
                          ),
                          const SizedBox(
                            height: MySizes.spaceBetweenItems,
                          ),
                          MyTextField(
                            controller: passwordController,
                            labelText: 'Password',
                            prefixIcon: Icons.password,
                            validator: Validators.PasswordValidator,
                            onchange: () {},
                            onSaved: () {},
                          ),
                          const SizedBox(
                            height: MySizes.spaceBetweenItems,
                          ),
                          FormSubmitButton(
                            ontap: () async {
                              setState(() {
                                var _submitted = true;
                              });
                              if (_formkey.currentState!.validate()) {
                                _formkey.currentState!.save();
                                await _SP.saveData(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text);
                                _SP.showStoredData();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const HomeScreen()));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Data submitted!'),
                                  ),
                                );
                              }
                            },
                            submitText: 'SignUp',
                          ),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
