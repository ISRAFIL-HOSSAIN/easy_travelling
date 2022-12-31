import 'package:flutter/material.dart';
import 'package:get/get.dart';

showDialogFunc(BuildContext context, String img) {
  const double minScale = 1;
  const double maxScale = 4;
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
            child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                color: const Color.fromARGB(206, 53, 53, 53)),
            padding: const EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Container(
                        height: 20,
                        width: 20,
                        child: Image.asset("assets/images/cancel.png"),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 150,
                ),
                InteractiveViewer(
                  clipBehavior: Clip.none,
                  panEnabled: false,
                  minScale: minScale,
                  maxScale: maxScale,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: Image.network(
                      img,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
      });
}
