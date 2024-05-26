import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/core/helper/email_checker.dart';
import 'package:mobile/presentation/login/cubit/login_cubit.dart';
import 'package:mobile/presentation/login/widgets/longin_form.dart';
import 'package:mobile/presentation/login/widgets/no_account.dart';
import 'package:mobile/presentation/login/widgets/social_login.dart';
import 'package:mobile/presentation/shared/app_welcome.dart';
import 'package:mobile/presentation/shared/my_button.dart';
import 'package:bloc/bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const String route = '/login';
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Scaffold(body: SafeArea(child: MobileView()));
        } else {
          return const WebView();
        }
      },
    );
  }
}

class MobileView extends StatelessWidget {
  MobileView({
    super.key,
  });

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.status == Status.success) {
              Navigator.of(context).pushReplacementNamed('/navigation');
            } else if (state.status == Status.failed) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          color: Colors.white,
                          height: 150,
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('Error'),
                              Text(state.data!),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Try Again'))
                            ],
                          ),
                        )
                      ],
                    );
                  });
            }
          },
          builder: (context, state) {
            if (state.status == Status.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppWelcome(child: 'Login'),
                    const SizedBox(height: 50),
                    const SocialLogin(),
                    const SizedBox(height: 50),
                    LoginForm(
                      emailController: _emailController,
                      isEmailText: null,
                      passwordController: _passwordController,
                      isPasswordText: null,
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Forgot Password ?'),
                      ),
                    ),
                    MyButton(
                      child: 'Login',
                      ontap: () {
                        BlocProvider.of<LoginCubit>(context).login(
                            email: _emailController.text,
                            password: _passwordController.text);
                      },
                    ),
                    const NoAccount()
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  color: const Color.fromARGB(255, 0, 95, 85),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              )
            ],
          ),
          Container(
            decoration: BoxDecoration(boxShadow: const [
              BoxShadow(
                  blurRadius: 7,
                  spreadRadius: 0.5,
                  color: Color.fromARGB(207, 184, 183, 183))
            ], color: Colors.white, borderRadius: BorderRadius.circular(30)),
            width: screen.width * 0.6,
            height: screen.height * 0.9,
            child: MobileView(),
          )
        ],
      ),
    );
  }
}
