class Months {
  static const jan = Month("JAN.", 1);
  static const fab = Month("FAB.", 2);
  static const mar = Month("MAR.", 3);
  static const abr = Month("ABR.", 4);
  static const mai = Month("MAI.", 5);
  static const jun = Month("JUN.", 6);
  static const jul = Month("JUL.", 7);
  static const ago = Month("AGO.", 8);
  static const set = Month("SET.", 9);
  static const out = Month("OUT.", 10);
  static const nov = Month("NOV.", 11);
  static const dez = Month("DEZ.", 12);

  static const listOf = [
    jan,
    fab,
    mar,
    abr,
    mai,
    jun,
    jul,
    ago,
    set,
    out,
    nov,
    dez
  ];
}

class Month {
  final int number;
  final String name;

  const Month(this.name, this.number);
}
