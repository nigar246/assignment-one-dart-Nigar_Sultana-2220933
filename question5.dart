/// Question 5: Advanced Features & Mixins (Difficulty: 5/5) ⭐⭐⭐⭐⭐
/// EXPECTED OUTPUT:
/// Manager: John Smith (ID: M001, Department: IT, Team Size: 5)
/// Job Title: Manager
/// Base Salary: 8000.0
/// Calculated Salary: 9000.0
/// Payment processed: 9000.0
/// Report: Monthly report for John Smith in IT department
/// 
/// Developer: Alice Johnson (ID: D001, Department: IT, Language: Dart)
/// Job Title: Senior Developer
/// Base Salary: 6000.0
/// Calculated Salary: 6500.0
/// Payment processed: 6500.0
library;


// 1. Mixin Payable:
//    - Method: double calculateSalary(double baseSalary, double bonus)
//    - Method: void processPayment(double amount)
mixin Payable {
  double calculateSalary(double baseSalary, double bonus) => baseSalary + bonus;

  void processPayment(double amount) {
    print('Payment processed: $amount');
  }
}

// 2. Mixin Reportable:
//    - Method: String generateReport(String employeeName, String department)
mixin Reportable {
  String generateReport(String employeeName, String department) => 'Report: Monthly report for $employeeName in $department department';
}

// 3. Abstract Class Employee:
//    - Properties: String name, String id, String department
//    - Abstract method: String getJobTitle()
//    - Abstract method: double getBaseSalary()

abstract class Employee {

  Employee(this.name, this.id, this.department);
  String name;
  String id;
  String department;

  String getJobTitle();
  double getBaseSalary();

  void displayInfo();
}

// 4. Concrete Classes:
//    - Manager extends Employee with Payable and Reportable
//      - Additional property: int teamSize
//      - Override required methods
class Manager extends Employee with Payable, Reportable {

  Manager(super.name, super.id, super.department, this.teamSize);
  int teamSize;

  @override
  String getJobTitle() => 'Manager';

  @override
  double getBaseSalary() => 8000;

  @override
  void displayInfo() {
    print(
        'Manager: $name (ID: $id, Department: $department, Team Size: $teamSize)',);
  }
}

//    - Developer extends Employee with Payable
//      - Additional property: String programmingLanguage
//      - Override required methods
class Developer extends Employee with Payable {

  Developer(super.name, super.id, super.department, this.programmingLanguage);
  String programmingLanguage;

  @override
  String getJobTitle() => 'Senior Developer';

  @override
  double getBaseSalary() => 6000;

  @override
  void displayInfo() {
    print(
        'Developer: $name (ID: $id, Department: $department, Language: $programmingLanguage)',);
  }
}
void main() {
  final manager = Manager('John Smith', 'M001', 'IT', 5);
  final dev = Developer('Alice Johnson', 'D001', 'IT', 'Dart');

  // Manager
  manager.displayInfo();
  print('Job Title: ${manager.getJobTitle()}');
  print('Base Salary: ${manager.getBaseSalary()}');

  final managerSalary = manager.calculateSalary(8000, 1000);
  print('Calculated Salary: $managerSalary');
  manager.processPayment(managerSalary);

  print(manager.generateReport(manager.name, manager.department));

  print('');

  // Developer
  dev.displayInfo();
  print('Job Title: ${dev.getJobTitle()}');
  print('Base Salary: ${dev.getBaseSalary()}');

  final devSalary = dev.calculateSalary(6000, 500);
  print('Calculated Salary: $devSalary');
  dev.processPayment(devSalary);
}
