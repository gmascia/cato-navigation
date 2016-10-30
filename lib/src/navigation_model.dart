import 'package:angular2/core.dart';
import 'package:cato_navigation/place.dart';

class NavigationModel {
  final List<Place> _places;
  Place _currentPlace;
  Place _startingPlace;

  NavigationModel(this._places) {
    _setStartingPlace();
    _currentPlace = _startingPlace;
  }

  void _setStartingPlace() {
    _startingPlace = _places.firstWhere((Place place) => place.isStartingPlace);
  }

  Place get currentPlace => _currentPlace;

  void set currentPlace(Place place) {
    if (place == null) {
      if (_startingPlace != null) {
        _currentPlace = _startingPlace;
      }
      return;
    }
    if (place.equals(currentPlace)) return;
    _currentPlace = place;
  }

  Place setPlaceByFragment(String fragment) {
    final place = _places.firstWhere(
      (Place place) => place.fragment == fragment, orElse:
          () => _startingPlace);
    currentPlace = place;
    return place;
  }
}
