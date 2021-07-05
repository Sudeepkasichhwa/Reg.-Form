import 'package:flutter/material.dart';
//import 'listPage.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class FormPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormPageState();
  }
}

class FormPageState extends State<FormPage> {
  late String _name;
  late String _email;
  late String _contact;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      //maxLength: 10,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Name is Required';
        }
        return null;
      },
      onSaved: (value) {
        _name = value!;
      },
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (value) {
        _email = value!;
      },
    );
  }

  Widget _buildContact() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Phone number'),
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (value) {
        _contact = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid Vaccine Registration "),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildName(),
                _buildEmail(),
                _buildContact(),
                Padding(padding: EdgeInsets.all(30)),
                ElevatedButton(
                  child: Text("Submit"),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      return;
                    }
                    _formKey.currentState!.save();

                    print(_name);
                    print(_email);
                    print(_contact);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Entries(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Entries extends StatefulWidget {
  @override
  _EntriesState createState() => _EntriesState();
}

class _EntriesState extends State<Entries> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Appllied Entries'),
      ),
    );
  }
}
