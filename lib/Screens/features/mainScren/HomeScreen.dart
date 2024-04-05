import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';
import '../auth/authscreens/signUpScreen.dart';
import '../auth/authscreens/widgets/FormSubmitBtn.dart';
import '../auth/authscreens/widgets/myTextFormField.dart';
import '../auth/validators/validate.dart';
import 'functions/customalertdialoge.dart';
import 'functions/updateData.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey _formKey = GlobalKey<FormState>();
  var _Validators = Validation();
  bool disabled = false;

  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                  value: 0,
                  child: InkWell(
                      onTap: () {
                        showCustomDialog(context);
                      },
                      child: const Text('LogOut'))),
              const PopupMenuItem<int>(value: 1, child: Text('Settings')),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: MySizes.spaceBetweenSections,
            ),
            const Text(
              "Main Screen",
              style: TextStyle(
                  fontSize: MySizes.textSizeheadingsMedium,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: MySizes.spaceBetweenItems,
            ),
            const Text(
              "Update Your Account Info",
              style: TextStyle(
                  fontWeight: FontWeight.w400, fontSize: MySizes.textLarge),
            ),
            const SizedBox(
              height: MySizes.spaceBetweenSections,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                  key: _formKey,
                  child: Flexible(
                    child: Column(
                      children: [
                        MyTextField(
                          enable: disabled,
                          validator: _Validators.NameValidator,
                          labelText: 'Name',
                          hintText: "Enter Your Name",
                          prefixIcon: Icons.person,
                          controller: _nameController,
                          onchange: () {},
                          onSaved: () {},
                        ),
                        const SizedBox(
                          height: MySizes.spaceBetweenItems,
                        ),
                        MyTextField(
                          enable: disabled,
                          validator: _Validators.EmailValidator,
                          controller: _emailController,
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
                          enable: disabled,
                          controller: _passwordController,
                          labelText: 'Password',
                          prefixIcon: Icons.password,
                          validator: _Validators.PasswordValidator,
                          onchange: () {},
                          onSaved: () {},
                        ),
                        const SizedBox(
                          height: MySizes.spaceBetweenItems,
                        ),

                        // Form Button And Form Submission
                        disabled == false
                            ? FormSubmitButton(
                                ontap: () async {
                                  setState(() {
                                    disabled = !disabled;
                                  });
                                },
                                submitText: 'Edit Profile Button',
                              )
                            : FormSubmitButton(
                                ontap: () async {
                                  setState(() {
                                    disabled = !disabled;
                                    var _submitted = true;
                                  });
                                  final form =
                                      _formKey.currentState as FormState;
                                  if (form.validate()) {
                                    form.save();
                                    await updateData(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                        name: _nameController.text);

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Data Updated!'),
                                      ),
                                    );
                                  }
                                },
                                submitText: 'Done Button',
                              ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
