
import 'package:demo/core/common/common_function.dart';
import 'package:demo/core/constant/screen_util.dart';
import 'package:demo/task_screen/expense_tracker_app/component/expense_summary.dart';
import 'package:demo/task_screen/expense_tracker_app/component/expense_tile.dart';
import 'package:demo/task_screen/expense_tracker_app/data/expense_data.dart';
import 'package:demo/task_screen/expense_tracker_app/model/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpenseScreenProvider extends StatelessWidget {
  const ExpenseScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpenseData(),
      child: const ExpenseScreen(),
    );
  }
}

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  TextEditingController newExpenseNameController = TextEditingController();
  TextEditingController newExpenseAmountController = TextEditingController();

  @override
  void initState() {
    super.initState();

    //prepare data on startup
    // Provider.of<ExpenseData>(context,listen: false).overallExpenseList.clear();
    Provider.of<ExpenseData>(context,listen: false).prepareData();
  }

  //add new expense
  void addNewExpense() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        surfaceTintColor: Colors.white,
        title: CommonWidgets.customTextView(text: "Add New Expense"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //expense name
            TextField(
             decoration: const InputDecoration(
               labelText: "Name",
             ),
              controller: newExpenseNameController,
            ),
            //expense amount
            TextField(
              decoration: const InputDecoration(
                labelText: "Amount",
              ),
              controller: newExpenseAmountController,
            ),
          ],
        ),
        actions: [
          //save button
          MaterialButton(
            onPressed: save,
            child: CommonWidgets.customTextView(text: "Save"),
          ),
          //cancel button
          MaterialButton(
            onPressed: cancel,
            child: CommonWidgets.customTextView(text: "Cancel"),
          ),
        ],
      ),
    );
  }
  //delete expense
  void deleteExpense(ExpenseItem expense){
    Provider.of<ExpenseData>(context,listen: false).deleteExpense(expense);
  }

  //save
  void save() {
    //only save expense if all fields are filled
    if(newExpenseNameController.text.isNotEmpty && newExpenseAmountController.text.isNotEmpty){
      //create new expense
      ExpenseItem newExpense = ExpenseItem(
        name: newExpenseNameController.text,
        amount: newExpenseAmountController.text,
        dateTime: DateTime.now(),
      );
      //add the new expense
      Provider.of<ExpenseData>(context, listen: false).addExpense(newExpense);

    }
    Navigator.pop(context);

    clear();
  }

  //cancel
  void cancel() {
    Navigator.pop(context);
  }

  //clear
  void clear() {
    newExpenseNameController.clear();
    newExpenseAmountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          automaticallyImplyLeading: true,
          title: const Text('Expense Tracker'),
        ),
        // backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: addNewExpense,
          shape: const CircleBorder(),
          backgroundColor: Colors.black,
          child: const Icon(Icons.add,color: Colors.white,),
        ),
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: ListView(
            children: [
              SizedBox(
                height: 20.sp,
              ),
              //weekly summary
              ExpenseSummary(startOfWeek: value.startOfWeekDate()),
              SizedBox(
                height: 20.sp,
              ),
              //expense list
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: value.getAllExpenseList().length,
                itemBuilder: (context, index) => ExpenseTile(
                  name: value.getAllExpenseList()[index].name,
                  amount: value.getAllExpenseList()[index].amount,
                  dateTime: value.getAllExpenseList()[index].dateTime,
                  deleteTapped: (p0) => deleteExpense(value.getAllExpenseList()[index]),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
