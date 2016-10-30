import 'dart:html';
import 'package:angular2/core.dart';
import 'package:cato_navigation/place.dart';
import 'src/navigation_model.dart';

@Component(
    selector: 'cato-navigation',
    template: '',
  )
class CatoNavigationComponent implements OnInit {
  NavigationModel _navigationModel;

  @Input()
  set places(List<Place> places) {
    if (_navigationModel == null) {
      _navigationModel = new NavigationModel(places);
    }
  }

  @Output()
  final placeChange = new EventEmitter<Place>();

  @Input()
  set place(Place place) {
    _navigationModel.currentPlace = place;
    _updateFragmentFromNavigation(place);
  }

  @override
  ngOnInit() {
    _updateNavigationFromFragment();
    _setHashChangeHandler();
  }

  void _setHashChangeHandler() {
    window.onHashChange.listen((_) => _updateNavigationFromFragment());
  }

  void _updateNavigationFromFragment() {
    final place = _navigationModel.setPlaceByFragment(window.location.hash);
    _updateFragmentFromNavigation(place);
    placeChange.add(place);
  }

  void _updateFragmentFromNavigation(Place place) {
    window.location.hash = place.fragment;
  }
}
