import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_products/core/di/locator.dart';
import 'package:task_products/core/enum/enums.dart';
import 'package:task_products/core/extension/context.dart';
import 'package:task_products/core/extension/data_source.dart';
import 'package:task_products/core/extension/data_type.dart';
import 'package:task_products/core/extension/widget.dart';
import 'package:task_products/core/resources_manager/assets.dart';
import 'package:task_products/core/resources_manager/color.dart';
import 'package:task_products/core/resources_manager/strings.dart';
import 'package:task_products/core/resources_manager/values.dart';
import 'package:task_products/core/routes/routes.dart';
import 'package:task_products/core/widgets/font.dart';
import 'package:task_products/core/widgets/input.dart';
import 'package:task_products/core/widgets/show_dialog_snackbar.dart';
import 'package:task_products/features/auth/presentation/logic/authentication/authentication_cubit.dart';
import 'package:task_products/features/auth/presentation/logic/login/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginProviderView();
  }
}

class LoginProviderView extends StatelessWidget {
  const LoginProviderView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<LoginCubit>(),
      child: LoginContentView(),
    );
  }
}

class LoginContentView extends StatelessWidget {
  const LoginContentView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.flowStateApp == FlowStateApp.error) {
          instance<IShowAlertMessage>().dismissDialog(context);
          instance<IShowAlertMessage>().showErrorPopUpOk(
            context,
            state.failure.message,
          );
        } else if (state.flowStateApp == FlowStateApp.loading) {
          instance<IShowAlertMessage>().dismissDialog(context);
          instance<IShowAlertMessage>().showModalLoading(context);
        } else if (state.flowStateApp == FlowStateApp.normal) {
          instance<IShowAlertMessage>().dismissDialog(context);
        } else if (state.flowStateApp == FlowStateApp.successLoggedIn) {
          instance<IShowAlertMessage>().dismissDialog(context);
          context.read<AuthenticationCubit>().changeAuthentication(
            AppAuthenticationLevel.authenticated,
            token: state.token,
          );
        }
      },
      builder: (context, state) {
        return const ContentInputsAndButtons();
      },
    );
  }
}

class ContentInputsAndButtons extends StatelessWidget {
  const ContentInputsAndButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: context.height,
            child: [
              const LabelText(text: "Email"),
              const EmailLogin(),
              const LabelText(text: "Password"),
              const PasswordLogin(),

              AppSize.appSize24.heightSizedBox,
              const LoginButton(),
            ].toColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ),
        ),
      ),
    );
  }
}

class EmailLogin extends StatelessWidget {
  const EmailLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return EmailInputView(
          length: 100,
          hintText: "Enter your email",

          error:
              state.emailInput.isValid || state.emailInput.isPure
                  ? null
                  : state.emailInput.error.getErrorInput(),
          onChanged: (value) {
            context.read<LoginCubit>().changeEmail(value);
          },
        );
      },
    ).paddingSymmetric(vertical: AppPadding.appPadding8);
  }
}

class PasswordLogin extends StatelessWidget {
  const PasswordLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return PasswordInputView(
          visiable: state.showPassword,
          length: 20,

          hidePassword: () {
            context.read<LoginCubit>().changeHidePassword();
          },
          hintText: "Enter your password",
          error:
              state.passwordInput.isValid || state.passwordInput.isPure
                  ? null
                  : state.passwordInput.error.getErrorInput().toString(),
          onChanged: (value) {
            context.read<LoginCubit>().changePassword(value);
          },
        );
      },
    ).paddingSymmetric(vertical: 4);
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return "Login".toEelevatedButton(
          context,
          height: AppSize.appSize50,
          textAlign: TextAlign.center,
          colortext: ColorManager.whiteColor,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          width: context.width,
          isLoading: state.flowStateApp == FlowStateApp.loading,

          state.formIsValid
              ? () {
                context.read<LoginCubit>().login();
              }
              : null,
        );
      },
    );
  }
}
