class FilterModel{
  String day;
  String month;
  String? year;
  String weekDay;
  String ?date;
  FilterModel({
    required this.day,
    required this.month,
    this.year,
    required this.weekDay,
    this.date,
  });
  static List<String>dayWeeks=["mon","tue","wed","thu","fri","sat","sun"];
  static List<String>months=["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];
}
