import 'package:n7geekstalk/allConstants/all_constants.dart';
import 'package:flutter/material.dart';
import 'package:n7geekstalk/screens/viewImagePage.dart';

Widget errorContainer() {
  return Container(
    clipBehavior: Clip.hardEdge,
    child: Image.asset(
      'assets/images/img_not_available.jpeg',
      height: Sizes.dimen_200,
      width: Sizes.dimen_200,
    ),
  );
}

Widget chatImage({required String imageSrc, context}) {
  return OutlinedButton(
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ViewImagePage(imageSrc: imageSrc)));
    },
    child: Image.network(
      imageSrc,
      width: Sizes.dimen_200,
      height: Sizes.dimen_200,
      fit: BoxFit.cover,
      loadingBuilder:
          (BuildContext ctx, Widget child, ImageChunkEvent? loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          decoration: BoxDecoration(
            color: AppColors.greyColor2,
            borderRadius: BorderRadius.circular(Sizes.dimen_10),
          ),
          width: Sizes.dimen_200,
          height: Sizes.dimen_200,
          child: Center(
            child: CircularProgressIndicator(
              color: AppColors.burgundy,
              value: loadingProgress.expectedTotalBytes != null &&
                      loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          ),
        );
      },
      errorBuilder: (context, object, stackTrace) => errorContainer(),
    ),
  );
}

Widget messageBubble(
    {required String chatContent,
    required EdgeInsetsGeometry? margin,
    Color? color,
    Color? textColor}) {
  return Container(
    padding: const EdgeInsets.all(Sizes.dimen_10),
    margin: margin,
    width: Sizes.dimen_200,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(Sizes.dimen_10),
    ),
    child: Text(
      chatContent,
      style: TextStyle(fontSize: Sizes.dimen_16, color: textColor),
    ),
  );
}
