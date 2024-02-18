class Month {
  final int number;
  final String name;

  const Month(this.name, this.number);

  static const jan = Month("Janeiro", 1);
  static const feb = Month("Fevereiro", 2);
  static const mar = Month("Março", 3);
  static const apr = Month("Abril", 4);
  static const may = Month("Maio", 5);
  static const jun = Month("Junho", 6);
  static const jul = Month("Julho", 7);
  static const aug = Month("Agosto", 8);
  static const sep = Month("Setembro", 9);
  static const oct = Month("Outubro", 10);
  static const nov = Month("Novembro", 11);
  static const dec = Month("Dezembro", 12);

  static const listOf = [
    jan,
    feb,
    mar,
    apr,
    may,
    jun,
    jul,
    aug,
    sep,
    oct,
    nov,
    dec
  ];

  static Month getMonth(int number) {
    switch (number) {
      case 1:
        return jan;
      case 2:
        return feb;
      case 3:
        return mar;
      case 4:
        return apr;
      case 5:
        return may;
      case 6:
        return jun;
      case 7:
        return jul;
      case 8:
        return aug;
      case 9:
        return sep;
      case 10:
        return oct;
      case 11:
        return nov;
      case 12:
        return dec;
      default:
        throw Exception("Mês inválido");
    }
  }
}
