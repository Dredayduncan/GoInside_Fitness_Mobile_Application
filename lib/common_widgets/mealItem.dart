import 'package:flutter/material.dart';

class MealItem extends StatelessWidget {
  final String label;
  final String body;

  const MealItem({
    Key? key, required this.label, required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
                color: const Color(0xFFFCF4E1),
                border: Border.all(),
                borderRadius: const BorderRadius.all(Radius.circular(5))
            ),
            height: 100,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.fastfood_outlined,
                    size: 30,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          label,
                          style: const TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w400
                          ),
                        ),
                        SizedBox(
                          width: 250,
                          child: Text(
                            body,
                            style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
        )
    );
  }
}
