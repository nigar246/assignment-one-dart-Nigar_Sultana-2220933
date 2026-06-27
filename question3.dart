// Question 3: Classes & Objects (Difficulty: 3/5) ⭐⭐⭐
/// EXPECTED OUTPUT:
/// Account: 12345, Holder: Alice, Type: Savings, Balance: 800.0
/// Account: 67890, Holder: Bob, Type: Checking, Balance: 400.0
/// Account: 11111, Holder: Charlie, Type: Savings, Balance: 2000.0
/// Insufficient funds for withdrawal of 1000.0 from account 67890
library;


// Create a BankAccount class with the following specifications:
class BankAccount {

  BankAccount(this.accountNumber, this.accountHolder, this.accountType)
      : balance = 0.0;
  String accountNumber;
  String accountHolder;
  double balance;
  String accountType;

  void deposit(double amount) {
    balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
    } else {
      print(
          'Insufficient funds for withdrawal of $amount from account $accountNumber',);
    }
  }

  double getBalance() => balance;

  void displayAccountInfo() {
    print(
        'Account: $accountNumber, Holder: $accountHolder, Type: $accountType, Balance: $balance',);
  }
}

void main() {
  // Create accounts
  final acc1 = BankAccount('12345', 'Alice', 'Savings');
  final acc2 = BankAccount('67890', 'Bob', 'Checking');
  final acc3 = BankAccount('11111', 'Charlie', 'Savings');

  // Deposits
  acc1.deposit(1000);
  acc2.deposit(500);
  acc3.deposit(2000);

  // Withdrawals
  acc1.withdraw(200);
  acc2.withdraw(100);

  // Display accounts
  acc1.displayAccountInfo();
  acc2.displayAccountInfo();
  acc3.displayAccountInfo();

  // Insufficient funds test
  acc2.withdraw(1000);
}