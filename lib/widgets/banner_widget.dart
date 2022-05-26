import 'package:apchance_recruitment/widgets/Clipper.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final String image;
  final String title;
  const BannerWidget({Key? key, required this.image, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: Clipper(),
            child: Container(
              color: const Color(0xffF20C78),
              height: 150,
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: Clipper(),
            child: Container(
              color: const Color(0xffF2055C),
              height: 200,
            ),
          ),
        ),
        Positioned(
          right: 30,
          top: 20,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(75.0)),
              child: Image(
                image: AssetImage(image),
                width: 150,
                height: 150,
              ),
          ),
        ),
        Positioned(
          left: 20,
          top: 20,
          child: TweenAnimationBuilder(
            child: SizedBox(
              width: 150,
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xff1D0259),
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(milliseconds: 700),
            builder: (context, double value, child) {
              return Opacity(
                opacity: value,
                child: Padding(
                  padding: EdgeInsets.only(top:value*20),
                  child: child,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
