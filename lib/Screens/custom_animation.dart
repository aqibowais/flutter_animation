import 'package:flutter/material.dart';
import 'package:flutter_animations/Model/headphones_model.dart';

class MovingObjectAnimation extends StatefulWidget {
  const MovingObjectAnimation({super.key});

  @override
  State<MovingObjectAnimation> createState() => _MovingObjectAnimationState();
}

class _MovingObjectAnimationState extends State<MovingObjectAnimation>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late AnimationController animationController;
  late Animation<Offset> moveAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    moveAnimation = Tween(
      begin: const Offset(0, 0),
      end: const Offset(0, 0.03),
    ).animate(animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 41, 41),
      body: SafeArea(
          child: Column(
        children: [
          SlideTransition(
            position: moveAnimation,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              child: Image.asset(
                products[selectedIndex].img,
                key: ValueKey<int>(selectedIndex),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'BOAT ROCKERZ 450R',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
              color: Colors.white,
            ),
          ),
          const Text(
            'Bluetooth Headphones',
            style: TextStyle(
              fontSize: 25,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(products.length, (index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: products[index].color,
                      border: Border.all(
                        width: 2,
                        color: selectedIndex == index
                            ? Colors.white70
                            : Colors.transparent,
                      ),
                    ),
                    child: Icon(
                      Icons.done,
                      fill: 1,
                      color: (selectedIndex == index)
                          ? Colors.grey[600]
                          : Colors.transparent,
                    ),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text(
            'Rs. 4500',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: Colors.red,
            ),
          ),
        ],
      )),
    );
  }
}
