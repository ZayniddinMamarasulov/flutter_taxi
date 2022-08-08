class Address {
  String? city;
  String? street;
  Address({required this.city,required this.street});
}

class UserAction extends Address {
  String? image;
  UserAction({super.city,super.street,this.image});

}
