import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:simple_app/features/home/logic/simple_viewmodel.dart';
import 'package:simple_app/shared/utilities/resources/alerts.dart';
import 'package:simple_app/shared/utilities/theme_configs/text_theme.dart';
import 'package:simple_app/shared/utilities/string_setups/validators.dart';
import 'package:simple_app/shared/widgets/animated_column_and_row.dart';
import 'package:simple_app/shared/widgets/buttons.dart';
import 'package:simple_app/shared/widgets/scaffold.dart';
import 'package:simple_app/shared/widgets/textfields.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<SimpleViewModel>(
      builder: (__, value, _) => SimpleScaffold(
        appBar: const CustomAppBar(),
        isLoading: value.isLoading,
        body: HorizontalPadding(
          child: Form(
            key: formKey,
            child: SimpleAnimatedColumn(
              children: [
                Text(
                  'Log in',
                  style: context.displaySmall.bold,
                ),
                VerticalPadding(
                  child: RichText(
                    text: TextSpan(
                        text: 'Welcome to ',
                        style: context.bodyLarge,
                        children: [
                          TextSpan(
                            text: 'Simple App',
                            style: context.bodyLarge.primary,
                          )
                        ]),
                  ),
                ),
                const VerticalSpacer(),
                FormLabelWidget(
                  label: 'EMAIL',
                  textfield: SimpleTextFieldWidget(
                    controller: value.emailController,
                    validator: (s) => Validator.emailOrPhoneNumberValidator(
                        value.emailController.text),
                  ),
                ),
                FormLabelWidget(
                  label: 'NAME',
                  textfield: SimpleTextFieldWidget(
                    controller: value.nameController,
                    validator: (s) =>
                        Validator.nonEmptyField(value.nameController.text),
                  ),
                ),
                FormLabelWidget(
                    label: 'PASSWORD',
                    textfield: SimpleTextFieldWidget(
                      controller: value.passwordController,
                      obscureText: true,
                      validator: (s) =>
                          Validator.password(value.passwordController.text),
                    )),
                SimplePrimaryButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      value.login().then((val) {
                        login(val, value);
                      });
                    }
                  },
                  title: 'LOGIN',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login(bool val, SimpleViewModel value) {
    if (val) {
      context.replace('/home');
    } else {
      showAppSnackBar(context, description: value.errorOrSuccessMessage);
    }
  }
}
