class LabModel {
  final String image;
  final String labName;
  final double rating;
  final double distance;
  String testType;
  final int index;

  LabModel(
      {this.image,
      this.labName,
      this.rating,
      this.distance,
      this.testType,
      this.index});

  static List<LabModel> labItem = [
    LabModel(
      image: "images/company.png",
      labName: "Accuracy Plus Medical Laboratory",
      rating: 5.0,
      distance: 3.0,
      testType: "Swap Test",
      index: 0,
    ),
    LabModel(
      image: "images/company.png",
      labName: "Accuracy Plus Medical Laboratory",
      rating: 4.5,
      distance: 5.0,
      testType: "Swap Test",
      index: 1,
    ),
    LabModel(
      image: "images/company.png",
      labName: "Accuracy Plus Medical Laboratory",
      rating: 5.0,
      distance: 3.0,
      testType: "Swap Test",
      index: 2,
    ),
    LabModel(
      image: "images/company.png",
      labName: "Accuracy Plus Medical Laboratory",
      rating: 4.5,
      distance: 7.0,
      testType: "Swap Test",
      index: 3,
    ),
    LabModel(
      image: "images/company.png",
      labName: "Accuracy Plus Medical Laboratory",
      rating: 4.5,
      distance: 7.0,
      testType: "Swap Test",
      index: 4,
    ),
    LabModel(
      image: "images/company.png",
      labName: "Accuracy Plus Medical Laboratory",
      rating: 4.5,
      distance: 7.0,
      testType: "Swap Test",
      index: 5,
    ),
  ];
}
