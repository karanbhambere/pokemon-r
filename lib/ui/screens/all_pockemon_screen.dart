import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pockemon_r/providers/pokemon_provider.dart';
import 'package:pockemon_r/ui/screens/pokemon_details_page.dart';

import '../../utils/constant.dart';

class AllPockemonScreen extends ConsumerWidget {
  const AllPockemonScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allPockemon = ref.watch(pokemonProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Pokemon')),
      ),
      body: allPockemon.when(
        data: (pokemonData) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.builder(
              itemCount: pokemonData.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                final item = pokemonData[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return PokemonDetailsPage(
                          item: item,
                        );
                      },
                    ));
                  },
                  child: Card(
                    color: Helper.getPokemonCardColour(
                        pokemonType: (item.typeofpokemon ?? []).isNotEmpty
                            ? item.typeofpokemon!.first
                            : ''),
                    child: Stack(
                      children: [
                        Positioned(
                            child: Text(
                          item.name!,
                          style: const TextStyle(
                              color: Colors.white,
                              height: 3,
                              fontWeight: FontWeight.bold),
                        ),),
                        Positioned(
                          bottom: -50,
                          right: 00,
                          child: Opacity(
                            opacity: 0.1,
                            child: Image.asset(
                              'assets/images/pokeball (2).png',
                              width: 100,
                              height: 200,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: -10,
                          height: 140,
                          width: 190,
                          child: item.imageurl != null
                              ? Image(image: NetworkImage(item.imageurl!))
                              : const SizedBox(),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(child: Text(error.toString()));
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
