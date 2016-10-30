class Place {
  final String label;
  final String fragment;
  final bool isStartingPlace;

  const Place(this.label, this.fragment, {bool useAsStartingPlace: false}) :
      isStartingPlace = useAsStartingPlace;

  bool equals(Place other) => other.fragment == this.fragment;
}
