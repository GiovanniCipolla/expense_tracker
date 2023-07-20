import 'package:exspense_tracker/widgets/chart/chart.dart';
import 'package:exspense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:exspense_tracker/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:exspense_tracker/data/my_expense.dart';

import 'new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = myExpenses;

  // metodo che se chiamato apre un overlay
  void _openAddExpenseOverlay() {
    // metodo integrato , per aprire e settare overlay
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      // nel builder cosa mostrare
      builder: (ctx) => NewExpense(onAddExpense: _addRegisterExpenses),
    );
  }

  void _addRegisterExpenses(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeRegisterExpress(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text(' Expense removed '),
        action: SnackBarAction(label: 'undo', onPressed: () {
          setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
          });
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No Expenses found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _registeredExpenses,
          onRemoveExpense: _removeRegisterExpress);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Expenses'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
