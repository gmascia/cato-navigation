import 'package:angular2/angular2.dart';
import 'package:angular2/platform/browser.dart';
import 'package:cato_navigation/cato_navigation.dart';
import 'package:cato_navigation/place.dart';

main() => bootstrap(App);

@Component(
    selector: 'app',
    templateUrl: 'app.html',
    directives: const [CatoNavigationComponent]
  )
class App {
  /// Define each place as static const variable.
  static const Place _alpha = const Place('Alpha', '#alpha',
      useAsStartingPlace: true);
  static const Place _beta = const Place('Beta', '#beta');
  static const Place _gamma = const Place('Gamma', '#gamma');

  /// Expose list of all places.
  final List<Place> _places = const <Place>[_alpha, _beta, _gamma];

  /// Keep track of current place.
  /// Use e.g:
  ///   _currentPlace == _alpha
  /// to show/hide components based on place.
  Place _currentPlace = _alpha;

  List<Place> get places => _places;

  Place get currentPlace => _currentPlace;

  set currentPlace(Place place) {
    _currentPlace = place;
  }

  // Navigation methods to control place change.

  void goToAlpha() {
    _currentPlace = _alpha;
  }

  void goToBeta() {
    _currentPlace = _beta;
  }

  void goToGamma() {
    _currentPlace = _gamma;
  }
}
