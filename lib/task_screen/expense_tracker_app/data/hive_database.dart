import 'dart:math';

import 'package:demo/task_screen/expense_tracker_app/model/expense_model.dart';
import 'package:hive/hive.dart';

class HiveDatabase {
  // reference our box
  final _myBox = Hive.box("expense_database");

  //write data
  void saveData(List<ExpenseItem> allExpense) {
    /*

    Hive can only store string and datetime and not custom objects like ExpenseItem.
    So let convert ExpenseItem object into types that can be stored in our db

    allExpense =[
    ExpenseItem(name / amount / dateTime)
    ...
    ]

    -->
    [
    [name, amount, dateTime],
    ..

    ]

    */
    List<List<dynamic>> allExpensesFormatted = [];
    for (var expense in allExpense) {
      //convert each expenseItem into a list of store able types(String, dateTime)
      List<dynamic> expenseFormatted = [expense.name, expense.amount, expense.dateTime];

      allExpensesFormatted.add(expenseFormatted);
    }

    // finally lets store in our database
    _myBox.put("All_Expenses", allExpensesFormatted);
  }

  //read data
  List<ExpenseItem> readData() {
    /*

    Data is stored in Hive as a list of strings + dateTime
    so lets convert our saved data into ExpenseItem objects

    savedDated = [

      [name, amount, dateTime],
      ..
    ]
   -->
   [
   ExpenseItem(name / amount / dateTime),
   ..
   ]
    */

    List savedExpenses = _myBox.get("All_Expenses") ?? [];
    List<ExpenseItem> allExpenses = [];

    for (int i = 0; i < savedExpenses.length; i++) {
      //collect individual expense data
      String name = savedExpenses[i][0];
      String amount = savedExpenses[i][1];
      DateTime dateTime = savedExpenses[i][2];

      //create expense item
      ExpenseItem expenseItem = ExpenseItem(
        name: name,
        amount: amount,
        dateTime: dateTime,
      );

      //add expense to overall list of expenses
      allExpenses.add(expenseItem);
    }
    return allExpenses;
  }
}
