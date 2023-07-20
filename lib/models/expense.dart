
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();
const uuid = Uuid();

enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

// Una funzione costruttore personalizzata all'interno di una classe 
//è semplicemente un metodo speciale che ti permette di creare un oggetto
// e inizializzarlo con valori specifici. Puoi considerarla come una convenienza aggiuntiva 
//che ti offre maggiore flessibilità nella creazione di un oggetto (senza parametri).
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expenseItem in expenses) {
      sum += expenseItem.amount;
    }

    return sum;
  }
}



// uuid , libreria terza che gestisce la stringa id
// intl, libreria terza che gestisce la forattazione delle date

// enum , modello spesa, mappa per le icone , getter ( non ha parametri e usa proprietà sue) per la formattazione di date.