import 'package:flutter/material.dart';
import './card_panel.dart';

class FormScreen extends StatefulWidget {
  //declare class FormScreen (Stateful)
  const FormScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return FormScreenState();
  }
}

class FormScreenState extends State<FormScreen> {
  //declare class FormScreenState
  //initialize user input variables
  String? _type = "Income"; //dropdown - sets initial choice
  String? _category1 = "Salary"; //dropdown
  String? _category2 = "Bills"; //dropdown
  String? _amount = "";
  String? _date = "";
  String? _name = "";

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); //declare globalkey

  Widget _buildType() {
    //dropDownMenu for user input Type (dropdown)
    return SizedBox(
        width: 300,
        child: DropdownButton<String>(
          isExpanded: true, //moves dropdown arrow to far right
          value: _type,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.black,
          ),
          onChanged: (String? newValue) {
            //sets _type to input
            setState(() {
              _type = newValue!;
            });
          },
          items: <String>['Income', 'Expense'] //array of items in the menu
              .map<DropdownMenuItem<String>>((String value) {
            //maps array to DropdownMenuItem
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(), //converts items to list
        ));
  }

  Widget _buildCategory1() {
    // same idea for the type selection dropDownMenu
    return SizedBox(
        width: 300,
        child: DropdownButton<String>(
          isExpanded: true,
          value: _category1,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.black,
          ),
          onChanged: (String? newValue) {
            setState(() {
              _category1 = newValue!;
            });
          },
          items: <String>[
            'Salary',
            'Business',
            'Investments',
            'Deposits',
            'Savings',
            'Gifts',
            'Other'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }

  @override
  Widget _buildCategory2() {
    // same idea for the type selection dropDownMenu
    return SizedBox(
        width: 300,
        child: DropdownButton<String>(
          isExpanded: true,
          value: _category2,
          icon: const Icon(Icons.arrow_downward),
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.black,
          ),
          onChanged: (String? newValue) {
            setState(() {
              _category2 = newValue!;
            });
          },
          items: <String>[
            'Bills',
            'Clothes',
            'Travel',
            'Food',
            'Entertainment',
            'Health',
            'Other'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }

  Widget _buildAmount() {
    //textFormField widget to take user input (amount)
    return SizedBox(
        width: 300,
        child: TextFormField(
          decoration: const InputDecoration(labelText: 'Amount'),
          keyboardType: TextInputType.number,
          validator: (String? value) {
            if (value!.isEmpty) {
              // checks if input is empty
              return 'Amount is Required';
            } else if (!RegExp(r"^[0-9]*$").hasMatch(value)) {
              // checks if input are only numbers
              return 'Enter a Valid Number';
            }

            return null;
          },
          onSaved: (String? value) {
            // sets _amount to input
            _amount = value;
          },
        ));
  }

  Widget _buildDate() {
    //textFormField widget to take user input (date)
    return SizedBox(
        width: 300,
        child: TextFormField(
          decoration: const InputDecoration(labelText: 'Date mm/dd/yyyy'),
          keyboardType: TextInputType.datetime,
          validator: (String? value) {
            if (value!.isEmpty) {
              //checks if empty
              return 'Date is Required';
            } else if (!RegExp(
                    r"^(0[1-9]|[12][0-9]|3[01])[- \/.](0[1-9]|1[012])[- \/.](19|20)\d\d$") //Regex for mm/dd/yyyy format throws
                .hasMatch(value)) {
              return 'Enter Date Correctly';
            }

            return null;
          },
          onSaved: (String? value) {
            //sets _date to input
            _date = value;
          },
        ));
  }

  Widget _buildName() {
    //textFormField widget to take user input (name)
    return SizedBox(
        width: 300,
        child: TextFormField(
          decoration: const InputDecoration(labelText: 'Name'),
          keyboardType: TextInputType.name,
          validator: (String? value) {
            if (value!.isEmpty) {
              //checks if empty
              return 'Name is Required';
            }

            return null;
          },
          onSaved: (String? value) {
            //sets _name to input
            _name = value;
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    //build the Form widget
    return Align(
        //widget for aligning the other widgets
        alignment: Alignment.topLeft,
        child: Scaffold(
          //scaffold
          body: SingleChildScrollView(
            //container for widget
            child: Container(
              //container for styling
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: BoxDecoration(
                //adds border to container
                border: Border.all(width: 5, color: Colors.black),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: _type == "Income" // checks if _type is "Income", if so...
                  ? Form(
                      // creates form consisting of the category1 dropDownMenu
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                              // calling functions that build the form
                              margin: const EdgeInsets.only(bottom: 15),
                              child: const Text("Track Your Money",
                                  style: TextStyle(fontSize: 20))),
                          _buildType(),
                          _buildCategory1(),
                          _buildAmount(),
                          _buildDate(),
                          _buildName(),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                  // aligns buttons in a row format
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ElevatedButton(
                                      //button that adds submitted info
                                      child: const Text(
                                        'ADD',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      onPressed: () {
                                        if (!_formKey
                                            .currentState! // validates submission
                                            .validate()) {
                                          return;
                                        }

                                        _formKey.currentState!
                                            .save(); // saves input to global key

                                        // Testing Purposes
                                        print(_type);
                                        print(_category1);
                                        print(_amount);
                                        print(_date);
                                        print(_name);

                                        // //Testing
                                        // MaterialPageRoute(
                                        //         builder: (context) => CardObj(
                                        //               type: _type,
                                        //               category1: _category1,
                                        //               category2: null,
                                        //               amount: _amount,
                                        //               date: _date,
                                        //               name: _name,
                                        //             ));

                                        _formKey.currentState
                                            ?.reset(); // clears text fields after successful submission
                                      },
                                    ),
                                    const SizedBox(width: 20),
                                    ElevatedButton(
                                        // button that clears all text fields
                                        onPressed: () {
                                          _formKey.currentState?.reset();
                                        },
                                        child: const Text(
                                          'CLEAR',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ))
                                  ]))
                        ],
                      ),
                    )
                  : Form(
                      // Same idea as previous form except when the type variable equals "Expense", then category2 dropDownMenu will be built
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              child: const Text("Track Your Money",
                                  style: TextStyle(fontSize: 30))),
                          _buildType(),
                          _buildCategory2(),
                          _buildAmount(),
                          _buildDate(),
                          _buildName(),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    ElevatedButton(
                                      child: const Text(
                                        'ADD',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      onPressed: () {
                                        if (!_formKey.currentState!
                                            .validate()) {
                                          return;
                                        }

                                        _formKey.currentState!.save();

                                        //Test Purposes
                                        print(_type);
                                        print(_category1);
                                        print(_amount);
                                        print(_date);
                                        print(_name);

                                        //Testing
                                        // MaterialPageRoute(
                                        //         builder: (context) => CardObj(
                                        //               type: _type,
                                        //               category1: null,
                                        //               category2: _category2,
                                        //               amount: _amount,
                                        //               date: _date,
                                        //               name: _name,
                                        //             ));

                                        _formKey.currentState?.reset();
                                      },
                                    ),
                                    const SizedBox(width: 20),
                                    ElevatedButton(
                                        onPressed: () {
                                          _formKey.currentState?.reset();
                                        },
                                        child: const Text(
                                          'CLEAR',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ))
                                  ]))
                        ],
                      ),
                    ),
            ),
          ),
        ));
  }
}
