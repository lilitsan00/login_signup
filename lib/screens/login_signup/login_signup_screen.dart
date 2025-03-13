import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_signup/constants/colors.dart';
import 'package:login_signup/constants/constants.dart';
import 'package:login_signup/screens/authentication/auth_store.dart';
import 'package:login_signup/screens/login_signup/_widgets.dart';
import 'package:login_signup/screens/login_signup/_signup_fields.dart';
import 'package:provider/provider.dart';

class LoginSignupScreen extends StatefulWidget {
  const LoginSignupScreen({super.key});

  @override
  State<LoginSignupScreen> createState() => _LoginSignupScreenState();
}

class _LoginSignupScreenState extends State<LoginSignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/icons/background.svg',
            width: MediaQuery.of(context).size.width,
            colorFilter: ColorFilter.mode(
              AppColorScheme.secondary.getColor(context),
              BlendMode.srcIn,
            ),
          ),
          Positioned(
            top: 54 * grw(context),
            left: 24 * grw(context),
            child: SvgPicture.asset('assets/icons/logo.svg'),
          ),
          AnimatedLoginSignUp(),
        ],
      ),
    );
  }
}

class AnimatedLoginSignUp extends StatefulWidget {
  const AnimatedLoginSignUp({super.key});

  @override
  State<AnimatedLoginSignUp> createState() => _AnimatedLoginSignUpState();
}

class _AnimatedLoginSignUpState extends State<AnimatedLoginSignUp>
    with TickerProviderStateMixin {
  final duration = Duration(milliseconds: 300);

  bool _isLogin = true;

  late AnimationController _controller;

  late Animation<Offset> _loginAnimation;
  late Animation<Offset> _signUpAnimation;

  AuthStore get authStore => Provider.of<AuthStore>(context, listen: false);

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: duration, vsync: this);

    _loginAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(-1.0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _signUpAnimation = Tween<Offset>(
      begin: Offset(1.0, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
  }

  void _toggleForm() {
    setState(() {
      _isLogin = !_isLogin;
      authStore.removeErrorMessage();
      FocusManager.instance.primaryFocus?.unfocus();
    });

    if (_isLogin) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder:
          (_) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRect(
                child: IntrinsicHeight(
                  child: Stack(
                    children: [
                      SlideTransition(
                        position: _loginAnimation,
                        child: LoginFieldsWidget(),
                      ),
                      SlideTransition(
                        position: _signUpAnimation,
                        child: SignupFieldsWidget(),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10 * grw(context)),
                child: Text(
                  authStore.errorMessage ?? '',
                  style: TextStyle(
                    fontSize: 13 * grw(context),
                    color: AppColorScheme.error.light,
                  ),
                ),
              ),
              AnimatedSwitcher(
                duration: duration,
                reverseDuration: duration,
                child: BottomButtonsWidget(
                  key: Key('_isLogin_$_isLogin'),
                  isLogin: _isLogin,
                  toggleForm: _toggleForm,
                ),
              ),
            ],
          ),
    );
  }
}
