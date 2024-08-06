import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/constants_finals.dart';
import '../cubit/auth_cubit.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/text_field_custom.dart';
import '../widgets/text_field_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }

        if (state is LoginAuthenticated) {
          Navigator.pushNamed(context, fragmentViewRoute);
        }
      },
      child: Scaffold(
        backgroundColor: kWhite,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/logo-adisty.svg',
                    width: 80,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'ADISTY',
                    style: Styles.kPoppinsBold.copyWith(
                      color: const Color(0xFF016EB8),
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Login Yuk!',
                    style: Styles.kPoppinsBold.copyWith(
                      color: kBlack,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Silakan masuk untuk melanjutkan',
                    style: Styles.kNunitoRegular.copyWith(
                      color: kGrey,
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextFieldCustom(
                    controller: usernameController,
                    labelText: 'Username',
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) => TextFieldPassword(
                      isObsecure: authCubit.getIsObsecure,
                      labelText: 'Password',
                      controller: passwordController,
                      onTap: authCubit.revealPassword,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () =>
                          Navigator.pushNamed(context, forgotPasswordRoute),
                      child: Text(
                        'Lupa password?',
                        style: Styles.kPoppinsMedium.copyWith(
                          fontSize: 16,
                          color: kBlue,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  BlocBuilder<AuthCubit, AuthState>(
                    bloc: authCubit,
                    builder: (context, state) {
                      return CustomElevatedButton(
                        isFilled: authCubit.getIsFilled,
                        text: 'Masuk',
                        onPressed: authCubit.getIsFilled
                            ? () => authCubit.loginAuth(
                                  usernameController.text,
                                  passwordController.text,
                                )
                            : () {},
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
