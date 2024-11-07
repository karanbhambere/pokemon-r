import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pockemon_r/ui/data/models/pockemon.dart';
import 'package:pockemon_r/utils/constant.dart';

class PokemonDetailsPage extends HookWidget {
  final Pokemon item;
  const PokemonDetailsPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final animationController = useAnimationController();
    return Scaffold(
      backgroundColor: Helper.getPokemonCardColour(
          pokemonType: (item.typeofpokemon ?? []).isNotEmpty
              ? item.typeofpokemon!.first
              : ''),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Helper.getPokemonCardColour(
            pokemonType: (item.typeofpokemon ?? []).isNotEmpty
                ? item.typeofpokemon!.first
                : ''),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite, color: Colors.red),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.name!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  item.id!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          item.imageurl != null
              ? Padding(
                  padding: const EdgeInsets.all(5),
                  child: Animate(
                    controller: animationController,
                    effects: const [
                      RotateEffect(),
                      ShimmerEffect(duration: Duration(seconds: 2))
                    ],
                    child: GestureDetector(
                      onTap: () {
                        animationController.loop(
                          count: 1,
                        );
                      },
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: -130,
                            left: -150,
                            height: 600,
                            child: Opacity(
                                opacity: 0.1,
                                child: Image.asset(
                                    'assets/images/pokeball_white.png')),
                          ),
                          Image(
                            height: 300,
                            image: NetworkImage(
                              item.imageurl!,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
          Expanded(
            child: Container(
              width: width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Text(item.xdescription ?? ''),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 400,
                      child: Row(
                        children: [
                          const Text(
                            'Name',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          Text(
                            item.name!,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 400,
                      child: Row(
                        children: [
                          const Text(
                            'Speed',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          Text(item.speed?.toString() ?? ''),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 400,
                      child: Row(
                        children: [
                          const Text(
                            'Hp',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 120,
                          ),
                          Text(item.hp?.toString() ?? ''),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 400,
                      child: Row(
                        children: [
                          const Text(
                            'Attack',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 96,
                          ),
                          Text(item.attack?.toString() ?? ''),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 400,
                      child: Row(
                        children: [
                          const Text(
                            'Height',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          Text(item.height?.toString() ?? ''),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 400,
                      child: Row(
                        children: [
                          const Text(
                            'Weaknesses',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          Text(item.weaknesses?.toString() ?? ''),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 400,
                      child: Row(
                        children: [
                          const Text(
                            'Evolution',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 80,
                          ),
                          Text(item.evolutions?.toString() ?? ''),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
