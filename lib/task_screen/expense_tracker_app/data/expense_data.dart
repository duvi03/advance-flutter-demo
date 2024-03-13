import 'package:demo/task_screen/expense_tracker_app/data/hive_database.dart';
import 'package:demo/task_screen/expense_tracker_app/datetime/date_time_helper.dart';
import 'package:demo/task_screen/expense_tracker_app/model/expense_model.dart';
import 'package:flutter/material.dart';


class ExpenseData extends ChangeNotifier{
  ///list of all expense
  List<ExpenseItem> overallExpenseList = [];

  /// get expense list
  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }

  ///prepare data to display
  final db = HiveDatabase();
  void prepareData(){
    //if there exists data, get in
    if(db.readData().isNotEmpty){
      overallExpenseList = db.readData();
    }
  }

  /// add new expense
  void addExpense(ExpenseItem newExpense) {
    overallExpenseList.add(newExpense);

    notifyListeners();
    db.saveData(overallExpenseList);
  }

  ///delete expense
  void deleteExpense(ExpenseItem expense) {
    overallExpenseList.remove(expense);

    notifyListeners();
    db.saveData(overallExpenseList);
  }

  ///get weekday(mon, tues, etc.) from datetime object
  String getDayName(DateTime dateTime) {
    switch (dateTime.weekday) {
      case 1:
        return 'Mon';
      case 2:
        return 'Tue';
      case 3:
        return 'Wed';
      case 4:
        return 'Thu';
      case 5:
        return 'Fri';
      case 6:
        return 'Sat';
      case 7:
        return 'Sun';
      default:
        return '';
    }
  }

  ///get date for the start of the week (sunday)
  DateTime startOfWeekDate() {
    DateTime? startOfWeek;

    //get Today date
    DateTime today = DateTime.now();

    //go backwards from today to find sunday
    for (int i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Sun') {
        startOfWeek = today.subtract(Duration(days: i));
      }
    }
    return startOfWeek!;
  }

  /// convert overall expense list into daily expense summary
  Map<String, double> calculateDailyExpenseSummary() {
    Map<String, double> dailyExpenseSummary = {
      // date (yyyymmdd) = amountTotalForDay
    };

    for (var expense in overallExpenseList) {
      String date = convertDateTimeToString(expense.dateTime);
      double amount = double.parse(expense.amount);

      if (dailyExpenseSummary.containsKey(date)) {
        double currentAmount = dailyExpenseSummary[date]!;
        currentAmount += amount;
        dailyExpenseSummary[date] = currentAmount;
      } else {
        dailyExpenseSummary.addAll({date: amount});
      }
    }
    return dailyExpenseSummary;
  }
}
