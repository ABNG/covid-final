class TestDetail {
  String status;
  String testType;
  String date;
  String laboratory;
  String tokenText;
  String tokenNumber;
  String time;

  TestDetail(
      {this.status,
      this.testType,
      this.date,
      this.laboratory,
      this.tokenText,
      this.tokenNumber,
      this.time});

  static List<TestDetail> testDetail = [
    TestDetail(
      status: "Confirmed",
      testType: "Swap Test",
      date: "12/08/2020",
      laboratory: "Accuracy plus Meters !!!!",
      tokenText: "Token Number",
      tokenNumber: "55",
      time: "3:00",
    ),
    TestDetail(
      status: "Confirmed",
      testType: "Swap Test",
      date: "12/08/2020",
      laboratory: "Accuracy plus Meters !!!!",
      tokenText: "Token Number",
      tokenNumber: "55",
      time: "3:00",
    ),
    TestDetail(
      status: "Completed",
      testType: "Swap Test",
      date: "12/08/2020",
      laboratory: "Accuracy plus Meters !!!!",
      tokenText: "Test Result",
      tokenNumber: "Negative",
      time: "3:00",
    ),
    TestDetail(
      status: "Completed",
      testType: "Swap Test",
      date: "12/08/2020",
      laboratory: "Accuracy plus Meters !!!!",
      tokenText: "Test Result",
      tokenNumber: "Negative",
      time: "3:00",
    ),
    TestDetail(
      status: "Confirmed",
      testType: "Swap Test",
      date: "12/08/2020",
      laboratory: "Accuracy plus Meters !!!!",
      tokenText: "Token Number",
      tokenNumber: "55",
      time: "3:00",
    ),
    TestDetail(
      status: "Completed",
      testType: "Swap Test",
      date: "12/08/2020",
      laboratory: "Accuracy plus Meters !!!!",
      tokenText: "Test Result",
      tokenNumber: "Negative",
      time: "3:00",
    ),
  ];
}
