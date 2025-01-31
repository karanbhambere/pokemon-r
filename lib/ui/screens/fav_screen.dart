// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:pockemon_r/providers/pokemon_provider.dart';

// import 'package:pockemon_r/ui/data/models/pockemon.dart';
// import 'package:pockemon_r/utils/constant.dart';

// class FavScreen extends StatelessWidget {
//   final Pokemon item;
//   const FavScreen({super.key,required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).cardColor,
//         title: const Text('Fav Pokemon'),
//         centerTitle: false,
//       ),
//       body: Consumer(builder: (context, ref, child) {
//         final pokemon = ref.watch(pokemonRepoProvider);

//         return pokemon.favPokemon.isNotEmpty
//             ? ListView.builder(
//                 itemCount: pokemon.favPokemon.length,
//                 itemBuilder: (context, index) {
//                   Pokemon pokemon = pokemon.favpokemon[index];
//                   return Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: InkWell(
//                       child: Stack(
//                         children: [
//                           Positioned(
//                               top: 30,
//                               left: 10,
//                               right: 10,
//                               bottom: 0,
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(20),
//                                   color: Helper.getPokemonCardColour(
//                                       pokemonType: pokemon.typeofpokemon![0]),
//                                 ),
//                                 child: Row(
//                                   children: [
//                                     const SizedBox(
//                                       width: 140,
//                                     ),
//                                     Column(
//                                       children: [
//                                         const SizedBox(
//                                           height: 30,
//                                         ),
//                                         Row(
//                                           children: [
//                                             Text(pokemon.name!,
//                                                 style: const TextStyle(
//                                                     fontSize: 20,
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.white)),
//                                             const SizedBox(
//                                               width: 25,
//                                             ),
//                                             Text(pokemon.id!,
//                                                 style: const TextStyle(
//                                                     fontSize: 20,
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.white)),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               )),
//                           CachedNetworkImage(
//                             imageUrl: pokemon.imageurl!,
//                             width: 150,
//                             height: 150,
//                           ),
//                         ],
//                       ),
//                       onTap: () {
//                        PokemonList.setSelectedPokemon(pokemon);

//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (_) => PokemonList));
//                       },
//                     ),
//                   );
//                 })
//             : const Center(child: Text('No Fav Pokemon'));
//       }),
//     );
//   }
// }
