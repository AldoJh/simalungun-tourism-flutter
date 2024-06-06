import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simalungun_tourism/common/const.dart';
import 'package:simalungun_tourism/data/datasource/local_datasource.dart';
import 'package:simalungun_tourism/presentation/bloc/login/login_bloc.dart';
import 'package:simalungun_tourism/presentation/pages/bottom_nav_page.dart';
import 'package:simalungun_tourism/presentation/pages/forgot_password_page.dart';
import 'package:simalungun_tourism/presentation/pages/register_page.dart';
import 'package:simalungun_tourism/presentation/widget/textfield_custom.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "/login";
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    emailController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3C557),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
            // SafeArea(
            //   child: IconButton(
            //     onPressed: () {},
            //     icon: const Icon(Icons.arrow_back),
            //     color: Colors.white,
            //   ),
            // ),
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
                  child: BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      // TODO: implement listener
                      if (state is LoginLoaded) {
                        if (state.user?.success == false) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(state.user!.message!),
                            backgroundColor: Colors.red,
                          ));
                        } else {
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //   content: const Text("Login Berhasil"),
                          //   backgroundColor: Colors.green,
                          // ));
                          LocalDataSource()
                              .saveToken(state.user!.data!.accessToken!);
                          context.goNamed(BottomNavpage.routeName);
                        }
                      }
                      if (state is LoginError) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(state.message),
                            backgroundColor: Colors.red));
                      }
                    },
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 30),
                          TextFieldCustom(
                              hintText: "your@email.com",
                              labelText: "Email atau username",
                              controller: emailController,
                              isPassword: false,
                              errorText: state is LoginLoaded
                                  ? state.user?.validation!.email!.isNotEmpty ??
                                          false
                                      ? state.user?.validation!.email![0] ?? ""
                                      : ""
                                  : ""),
                          const SizedBox(height: 20),
                          TextFieldCustom(
                            hintText: "*********",
                            labelText: "Password",
                            isPassword: true,
                            controller: passwordController,
                            errorText: state is LoginLoaded
                                ? state.user?.validation!.password!
                                            .isNotEmpty ??
                                        false
                                    ? state.user?.validation?.password![0] ?? ""
                                    : ""
                                : "",
                          ),
                          Container(
                            width: double.infinity,
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.transparent)),
                                onPressed: () {
                                  context.goNamed(ForgotPasswordPage.routeName);
                                },
                                child: const Text(
                                  "Lupa Password?",
                                  style: TextStyle(
                                    color: Color(0xff3B4949),
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.end,
                                )),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: state is LoginLoading
                                ? CircleAvatar(
                                    backgroundColor: constants.PrimaryColor,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : ElevatedButton(
                                    onPressed: () {
                                      context.read<LoginBloc>().add(
                                          LoginButtonEvent(
                                              email: emailController!.text,
                                              password:
                                                  passwordController!.text));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: constants.PrimaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40))),
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Belum Punya Akun? ",
                                style: TextStyle(
                                  color: Color(0xff3B4949),
                                  fontSize: 14,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.goNamed(RegisterPage.routeName);
                                },
                                child: const Text(
                                  "Register",
                                  style: TextStyle(
                                    color: constants.PrimaryColor,
                                    fontSize: 14,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
