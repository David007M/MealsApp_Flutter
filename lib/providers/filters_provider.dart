import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  void setFilters(Map<Filter, bool> chosenFilter) {
    state = chosenFilter;
  }

  void setFilter(Filter filter, bool isActive) {
    // state[filter] = isActive   // This (mutating a state in memory) is not allowed.
    //we can NOT replace, but we should get a new map by updating the old one.
    state = {
      ...state, // (... is a spread operator), copies the old map values in to this new map.
      filter: isActive,
    };
  }
}

final filterProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);
