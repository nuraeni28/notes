class Patient {
  String name;
  String gender;
  int numberRM;
  String cityOB; //City Of Birth
  String dateOB; //Date Of Birth
  String address;
  String numberPhone;

  Patient(
      {required this.name,
      required this.gender,
      required this.numberRM,
      required this.cityOB,
      required this.dateOB,
      required this.address,
      required this.numberPhone});

  static List<Patient> getPatient() {
    return <Patient>[
      Patient(
          name: 'John Doe',
          gender: 'Laki-Laki',
          numberRM: 3001,
          cityOB: 'Makassar',
          dateOB: '1 Oktober 1991',
          address: 'Hartaco Indah',
          numberPhone: '08980106995'),
      Patient(
          name: 'John Doe',
          gender: 'Laki-Laki',
          numberRM: 3001,
          cityOB: 'Makassar',
          dateOB: '1 Oktober 1991',
          address: 'Hartaco Indah',
          numberPhone: '08980106995')
    ];
  }
}
