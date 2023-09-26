import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Color.fromARGB(255, 8, 8, 8), Color.fromARGB(31, 80, 79, 79)],
        begin: Alignment.bottomCenter,
        end: Alignment.center,
      ).createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
          decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/YuGiOh.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)),
      )),
    );
  }
}

class BackgroundPrincipal extends StatelessWidget {
  const BackgroundPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/YuGiOh.jpg'),
        fit: BoxFit.cover,
        //  colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)),
      )),
    );
  }
}

class LogoYuGiOh extends StatelessWidget {
  const LogoYuGiOh({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 150, 10, 10),
      padding: const EdgeInsets.fromLTRB(90, 100, 90, 100),
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('assets/images/logo1.png'),
        fit: BoxFit.cover,
      )),
    );
  }
}
