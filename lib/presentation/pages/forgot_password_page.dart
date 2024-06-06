import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:simalungun_tourism/common/const.dart';
import 'package:simalungun_tourism/presentation/bloc/forget_password/forget_password_bloc.dart';
import 'package:simalungun_tourism/presentation/pages/login_page.dart';
import 'package:simalungun_tourism/presentation/widget/textfield_custom.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const routeName = "ForgetPassword";
  ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
                  child: BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
                    listener: (context, state) {
                      // TODO: implement listener
                      if (state is ForgetPasswordLoaded) {
                        if (state.forgetPassword.success == false) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(state.forgetPassword.message ?? ""),
                            backgroundColor: Colors.red,
                          ));
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Berhasil"),
                              content: const Text(
                                  "Link reset password telah dikirim ke email anda"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      GoRouter.of(context)
                                          .go(LoginPage.routeName);
                                    },
                                    child: const Text("OK"))
                              ],
                            ),
                          );
                        }
                      }
                      if (state is ForgetPasswordError) {
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
                            "Lupa Password",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            "Masukkan email yang terdaftar untuk mendapatkan link reset password anda melalui email",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(height: 30),
                          TextFieldCustom(
                              hintText: "your@email.com",
                              labelText: "Email",
                              controller: emailController,
                              isPassword: false,
                              errorText: state is ForgetPasswordLoaded
                                  ? state.forgetPassword.validation!.email!
                                          .isNotEmpty
                                      ? state
                                          .forgetPassword.validation!.email![0]
                                      : ""
                                  : ""),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: state is ForgetPasswordLoading
                                ? CircleAvatar(
                                    backgroundColor: constants.PrimaryColor,
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  )
                                : ElevatedButton(
                                    onPressed: () {
                                      context
                                          .read<ForgetPasswordBloc>()
                                          .add(ForgetPasswordEventSend(
                                            email: emailController!.text,
                                          ));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: constants.PrimaryColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40))),
                                    child: const Text(
                                      "Kirim",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                          ),
                          const SizedBox(height: 10),
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
