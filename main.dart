import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    // const appTitle = 'Form Validation Demo';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form Validation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Form Validation Demo'),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  // String _ratingController;
    final _formkey = GlobalKey<FormState>();

  int valuef = 1;
  int valuem = 2;
  int val1 = -1;
    
    @override
  //   void initState() {
  //   super.initState();
  //   _ratingController = '';
  // }
    Widget build(BuildContext context) {
      var _ratingController;
      return Form(
        key: _formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
//name
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Enter Your Name',
                labelText: 'Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter your name';
                }
                return null;
              },
            ),
//phone
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.phone),
                hintText: 'Enter Phone Number',
                labelText: 'Phone',
              ),
              validator: (value) {
                if (value == null || value.isEmpty ) {
                  return 'Please Enter phone number';
                }
                else if ( value.length > 10 || value.length < 10) {
                  return 'Phone number has to be of 10 digits';
                }
                return null;
              },
            ),
// dob
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.calendar_today),
                hintText: 'Enter Your Date of Birth',
                labelText: 'DOB',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter your birthdate';
                }
                return null;
              },
            ),

//branch
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              icon: Icon(Icons.book),
            ),
            value: _ratingController,
            onSaved: (value) {
                    setState(() {
                      _ratingController = value;
                    });
                  },
            items: ['Computer Science', 'Information Technology', 'Mechanical', 'EXTC', 'PPT']
                .map((label) => DropdownMenuItem(
              child: Text(label.toString()),
              value: label,
            ))
                .toList(),
            hint: Text('Select Your Branch'),
            onChanged: (value) {
              setState(() {
                _ratingController = value;
              });
            },
            validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please choose your branch';
                }
                return null;
              },
          ),
//gender
          Container(
              child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: Row(
              children: const <Widget>[
                Text(
                  'Please Select your Gender',
                  style: TextStyle(fontSize: 17.0),
                ),
              ],
            ),
          )),
          Column(
            children: <Widget>[
              Container(
                child: ListTile(
                  title: const Text('Female'),
                  leading: Radio(
                    value: 1,
                    groupValue: val1,
                    onChanged: (value) {
                      setState(() {
                        val1 = valuef;
                      });
                    },
                    activeColor: Colors.blueAccent,
                  ),
                ),
              ),
              Container(
                child: ListTile(
                  title: const Text('Male'),
                  leading: Radio(
                    value: 2,
                    groupValue: val1,
                    onChanged: (value) {
                      setState(() {
                        val1 = valuem;
                      });
                    },
                    activeColor: Colors.blueAccent,
                  ),
                ),
              ),
            ],
          ),

//submit
          ElevatedButton(
            onPressed: () {
              if (_formkey.currentState!.validate()) {
                if (val1 < 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Enter Your Gender')),
                  );
                } else if (_formkey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Sucessfully Submitted')),
                  );
                }
              }
            }, 
            child: const Text('Submit'),
            ),
          ],
        ),
      );
    }
}

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
