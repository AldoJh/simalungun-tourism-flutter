import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simalungun_tourism/common/const.dart';
import 'package:simalungun_tourism/data/datasource/local_datasource.dart';
import 'package:simalungun_tourism/presentation/bloc/register/register_bloc.dart';
import 'package:simalungun_tourism/presentation/pages/bottom_nav_page.dart';
import 'package:simalungun_tourism/presentation/widget/textfield_custom.dart';

class RegisterPage extends StatefulWidget {
  static const routeName = "register";

  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? nameController = TextEditingController();
  TextEditingController? phoneController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController?.dispose();
    passwordController?.dispose();
    nameController?.dispose();
    phoneController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3C557),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height + 100,
              child: Stack(
                children: [
                  SizedBox(
                    height: 292,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Positioned(
                          right: -120,
                          child: Image.asset(
                            'assets/banner/banner-login.png',
                            height: 292,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SafeArea(
                    child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 235,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                        child: SingleChildScrollView(
                          child: BlocConsumer<RegisterBloc, RegisterState>(
                            listener: (context, state) {
                              if (state is RegisterLoaded) {
                                if (state.RegisiterUser?.success == false) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content:
                                        Text(state.RegisiterUser!.message!),
                                    backgroundColor: Colors.red,
                                  ));
                                } else {
                                  LocalDataSource().saveToken(
                                      state.RegisiterUser!.data!.accessToken!);
                                  context.goNamed(BottomNavpage.routeName);
                                }
                              }
                              if (state is RegisterError) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(state.message),
                                        backgroundColor: Colors.red));
                              }
                            },
                            builder: (context, state) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Register",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 30),
                                  TextFieldCustom(
                                    hintText: "Your Name",
                                    labelText: "Nama",
                                    controller: nameController,
                                    errorText: state is RegisterLoaded
                                        ? state.RegisiterUser?.validation!.name!
                                                    .isNotEmpty ??
                                                false
                                            ? state.RegisiterUser?.validation!
                                                .name![0]
                                            : ""
                                        : "",
                                  ),
                                  const SizedBox(height: 20),
                                  TextFieldCustom(
                                    hintText: "your@email.com",
                                    labelText: "Email",
                                    controller: emailController,
                                    errorText: state is RegisterLoaded
                                        ? state.RegisiterUser?.validation!
                                                    .email!.isNotEmpty ??
                                                false
                                            ? state.RegisiterUser?.validation
                                                    ?.email![0] ??
                                                ""
                                            : ""
                                        : "",
                                  ),
                                  const SizedBox(height: 20),
                                  TextFieldCustom(
                                    hintText: "08xxxxxxxxxx",
                                    labelText: "Phone",
                                    controller: phoneController,
                                    errorText: state is RegisterLoaded
                                        ? state.RegisiterUser?.validation!
                                                    .phone!.isNotEmpty ??
                                                false
                                            ? state.RegisiterUser?.validation!
                                                .phone![0]
                                            : ""
                                        : "",
                                  ),
                                  const SizedBox(height: 20),
                                  TextFieldCustom(
                                    hintText: "*********",
                                    labelText: "Password",
                                    isPassword: true,
                                    controller: passwordController,
                                    errorText: state is RegisterLoaded
                                        ? state.RegisiterUser?.validation!
                                                    .password!.isNotEmpty ??
                                                false
                                            ? state.RegisiterUser?.validation!
                                                .password![0]
                                            : ""
                                        : "",
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: state is RegisterLoading
                                        ? CircleAvatar(
                                            backgroundColor:
                                                constants.PrimaryColor,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          )
                                        : ElevatedButton(
                                            onPressed: () {
                                              context.read<RegisterBloc>().add(
                                                  RegisterButtonEvent(
                                                      email:
                                                          emailController!.text,
                                                      password:
                                                          passwordController!
                                                              .text,
                                                      name:
                                                          nameController!.text,
                                                      phone: phoneController!
                                                          .text));
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    constants.PrimaryColor,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40))),
                                            child: const Text(
                                              "Register",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            )),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Sudah Punya Akun? ",
                                        style: TextStyle(
                                          color: Color(0xff3B4949),
                                          fontSize: 14,
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: () {
                                            context.pop();
                                          },
                                          child: const Text(
                                            "Login",
                                            style: TextStyle(
                                              color: constants.PrimaryColor,
                                              fontSize: 14,
                                            ),
                                          ))
                                    ],
                                  )
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
