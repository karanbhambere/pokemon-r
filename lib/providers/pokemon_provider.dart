import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pockemon_r/ui/data/models/pockemon.dart';

import '../repo/Pockemon.dart';

final pokemonRepoProvider = Provider.autoDispose<PockemonRepo>((ref) {
  return PockemonRepo();
});

final pokemonProvider = FutureProvider.autoDispose<List<Pokemon>>((ref) async {
  return ref.read(pokemonRepoProvider).getPockemonList();
});
// final pokemon = FutureProvider.autoDispose<Pokemon>((ref) async {
//   return ref.read(pockemonProvider);
// });
