class BloodListModel{
  String?imgUrl;
  String?bloodName;

  BloodListModel({this.imgUrl, this.bloodName});
}
List<BloodListModel> bloodtype = [
  BloodListModel(
    imgUrl: 'images/A+.json',
    bloodName: 'A+'
  ),
  BloodListModel(
      imgUrl: 'images/A-.json',
      bloodName: 'A-'
  ),
  BloodListModel(
      imgUrl: 'images/B+.json',
      bloodName: 'B+'
  ),
  BloodListModel(
      imgUrl: 'images/B-.json',
      bloodName: 'B-'
  ),
  BloodListModel(
      imgUrl: 'images/AB+.json',
      bloodName: 'AB+'
  ),
  BloodListModel(
      imgUrl: 'images/AB-.json',
      bloodName: 'AB-'
  ),
  BloodListModel(
      imgUrl: 'images/O+.json',
      bloodName: 'O+'
  ),
  BloodListModel(
      imgUrl: 'images/O-.json',
      bloodName: 'O-'
  ),
];