import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchParams {
  final String breedForSearch;
  final String subBreed;

  SearchParams({
    required this.breedForSearch,
    required this.subBreed,
  });
}

void goToXScreen(BuildContext context, {required String breedForSearch, required String anotherParam}) {
  final params = SearchParams(breedForSearch: breedForSearch, subBreed: anotherParam);
  context.goNamed(
    'XScreen',
    extra: params,
  );
}
