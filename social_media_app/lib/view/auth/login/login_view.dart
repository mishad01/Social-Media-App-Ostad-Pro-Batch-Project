import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:social_media_app/resources/assets_path.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            AssetsPath.leftArrowIcon,
            width: 16,
            height: 16,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 130),
              const Text(
                'Inter your phone number and password',
                style: TextStyle(
                  color: Color(0xff101828),
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 36,
                width: double.infinity,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        AssetsPath.envelopeIcon,
                        width: 16,
                        height: 16,
                      ),
                    ),
                    labelText: 'Input Email',
                    labelStyle: const TextStyle(color: Color(0xff98A2B3)),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xff6993FF),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: 36,
                width: double.infinity,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Input Password',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        AssetsPath.lockIcon,
                        width: 16,
                        height: 16,
                      ),
                    ),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        AssetsPath.eyeIcon,
                        width: 16,
                        height: 16,

                      ),
                    ),
                    labelStyle: const TextStyle(color: Color(0xff98A2B3)),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xff6993FF),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                 Icon(Icons.check_box_outline_blank,

                   color: const Color(0xff000000),),


                  const SizedBox(width: 8),
                  const Text(
                    'Save password',
                    style: TextStyle(
                      color: Color(0xff98A2B3),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffDAE4FF),
                  minimumSize: const Size.fromHeight(36),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  elevation: 2,
                ),
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
