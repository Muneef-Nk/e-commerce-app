import 'package:flutter/material.dart';

class FadeTransitionPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  FadeTransitionPageRoute({required this.page})
      : super(
          pageBuilder: (BuildContext context, Animation<double> animation,
                  Animation<double> secondaryAnimation) =>
              page,
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            const begin = 0.0;
            const end = 1.0;
            const curve = Curves.easeIn;

            var tween = Tween<double>(begin: begin, end: end)
                .chain(CurveTween(curve: curve));
            var opacityAnimation = animation.drive(tween);

            return FadeTransition(
              opacity: opacityAnimation,
              child: child,
            );
          },
        );
}
