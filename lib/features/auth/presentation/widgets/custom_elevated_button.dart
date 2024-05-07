import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants_finals.dart';
import '../cubit/auth_cubit.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.isFilled,
    required this.onPressed,
    required this.text,
  });

  final bool isFilled;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final authCubit = context.read<AuthCubit>();

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isFilled ? const Color(0xFF2B86C4) : kNeutral70,
          fixedSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: BlocConsumer<AuthCubit, AuthState>(
          bloc: authCubit,
          listener: (context, state) {
            // if (state is LoginAuthenticated) {
            //   Navigator.pushNamed(context, fragmentViewRoute);
            // }
          },
          builder: (context, state) {
            if (state is LoginAuthenticating) {
              return const CircularProgressIndicator(color: kWhite);
            }
            return Text(
              text,
              style: Styles.kPoppinsMedium.copyWith(
                color: kWhite,
                fontSize: 16,
              ),
            );
          },
        ),
      ),
    );
  }
}
