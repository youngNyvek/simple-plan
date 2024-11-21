import 'package:simple_plan/domain/enums/occurence_type.dart';
import 'package:simple_plan/domain/services/list_transactions_service.dart';
import 'package:simple_plan/domain/useCases/get_month_details_use_case/ports/output.dart';

class GetMonthDetailsUseCase {
  final _listTransactionsService = ListTransactionsService();

  Future<GetMonthDetailsOutput> execute(String monthKey) async {
    var predictedExpenses = 0.0;
    var currentExpenses = 0.0;
    var predictedIncomes = 0.0;
    var currentIncomes = 0.0;

    var returnedList = await _listTransactionsService.execute(monthKey);

    var filteredExpenses = returnedList.where(
        (element) => element.occurrenceType == OccurrenceType.expense.id);

    var filteredIncomes = returnedList
        .where((element) => element.occurrenceType == OccurrenceType.income.id);

    if (filteredExpenses.isNotEmpty) {
      predictedExpenses = filteredExpenses
          .map((element) => element.installment != null
              ? (element.amount / element.installment!)
              : element.amount)
          .reduce((value, element) => value + element);

      var doneExpenses = filteredExpenses.where((element) => element.done);

      if (doneExpenses.isNotEmpty) {
        currentExpenses = doneExpenses
            .map((element) => element.installment != null
                ? (element.amount / element.installment!)
                : element.amount)
            .reduce((value, element) => value + element);
      } else {
        currentExpenses = 0;
      }
    } else {
      predictedExpenses = 0;
      currentExpenses = 0;
    }

    if (filteredIncomes.isNotEmpty) {
      predictedIncomes = filteredIncomes
          .map((element) => element.installment != null
              ? (element.amount / element.installment!)
              : element.amount)
          .reduce((value, element) => value + element);

      var doneIncomes = filteredIncomes.where((element) => element.done);

      if (doneIncomes.isNotEmpty) {
        currentIncomes = doneIncomes
            .map((element) => element.installment != null
                ? (element.amount / element.installment!)
                : element.amount)
            .reduce((value, element) => value + element);
      } else {
        currentIncomes = 0;
      }
    } else {
      predictedIncomes = 0;
      currentIncomes = 0;
    }

    return GetMonthDetailsOutput(
        predictedIncomes, predictedExpenses, currentIncomes, currentExpenses);
  }
}
