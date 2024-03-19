import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(Miniproject());
}

class Miniproject extends StatelessWidget {
  const Miniproject({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Signuppage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: 250,
              width: 200,
              child: Image(
                image: AssetImage('images/image1.jpg'),
              ),
            ),
            Text(
              "Listen audiobooks in Tamil anywhere",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                margin:
                    EdgeInsets.only(left: 60, right: 60, top: 30, bottom: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.all(8),
                child: InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        height: 40,
                        width: 40,
                        image: AssetImage('images/google.png'),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Sign in with Google",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  onTap: () {
                    print("Login successful");
                  },
                )),
            Container(
              margin: EdgeInsets.only(
                left: 60,
                right: 60,
              ),
              child: Row(
                children: [
                  Expanded(child: Divider()),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Or"),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(child: Divider())
                ],
              ),
            ),
            Container(
                margin:
                    EdgeInsets.only(left: 60, right: 60, top: 30, bottom: 20),
                decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.green),
                    borderRadius: BorderRadius.circular(8)),
                padding: EdgeInsets.all(14),
                child: InkWell(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.mail_outline_rounded),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Sign up with Mail",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signemail()));
                  },
                )),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an Account?"),
                  InkWell(
                    child: Text(
                      "Login Here",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Loginemail()));
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Text("By creating an account accept Almost Everything's"),
            Text(
              "Terms of service & Privacy policy",
              style: TextStyle(decoration: TextDecoration.underline),
            )
          ],
        ),
      ),
    );
  }
}

class Signemail extends StatefulWidget {
  const Signemail({super.key});

  @override
  State<Signemail> createState() => _SignemailState();
}

class _SignemailState extends State<Signemail> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Tell us a bit more about Yourself",
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      label: Text("Enter name"),
                    ),
                    validator: (value) {
                      if (value?.trim()?.isEmpty ?? true) {
                        return 'Name is required';
                      }
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      label: Text(" Email address"),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email address is required';
                      }
                      // Regular expression for email validation
                      final emailRegex =
                          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                      if (!emailRegex.hasMatch(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null; // Return null if the validation succeeds
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      label: Text("Password"),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }

                      // Check if the password contains at least one lowercase letter
                      if (!RegExp(r'[a-z]').hasMatch(value)) {
                        return 'Password must contain at least one lowercase letter';
                      }

                      // Check if the password contains at least one uppercase letter
                      if (!RegExp(r'[A-Z]').hasMatch(value)) {
                        return 'Password must contain at least one uppercase letter';
                      }

                      // Check if the password contains at least one digit
                      if (!RegExp(r'[0-9]').hasMatch(value)) {
                        return 'Password must contain at least one digit';
                      }

                      // Check if the password contains at least one symbol
                      if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                        return 'Password must contain at least one symbol';
                      }

                      // Check if the password length is at least 8 characters
                      if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }

                      return null; // Return null if the validation succeeds
                    },
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                        left: 30, right: 30, top: 30, bottom: 20),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.all(10),
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sign in",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      onTap: () {
                        if (formKey.currentState?.validate() ?? false) {
                          print("Form is valid");
                        }
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Loginemail extends StatefulWidget {
  const Loginemail({super.key});

  @override
  State<Loginemail> createState() => _LoginemailState();
}

class _LoginemailState extends State<Loginemail> {
  final formKey1 = GlobalKey<FormState>();
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey1,
        child: Container(
          child: Center(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60,
                  backgroundImage: AssetImage(
                    'images/Ae.png',
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      label: Text("Enter email"),
                    ),
                    validator: (value) {
                      if (value?.trim()?.isEmpty ?? true) {
                        return 'Email is required';
                      }
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: TextFormField(
                    obscureText: !passwordVisible,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Password",
                      suffixIcon: IconButton(
                        icon: Icon(passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            passwordVisible = !passwordVisible;
                          });
                        },
                      ),
                      alignLabelWithHint: false,
                      filled: false,
                    ),
                    validator: (value) {
                      if (value?.trim()?.isEmpty ?? true) {
                        return 'Email is required';
                      }
                    },
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 250, top: 25),
                  child: InkWell(
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Forgetpassword()));
                    },
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                        left: 30, right: 30, top: 30, bottom: 20),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.all(10),
                    child: InkWell(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Log in",
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                      onTap: () {
                        if (formKey1.currentState?.validate() ?? false) {
                          print("Form is valid");
                        }
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  final formKey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Form(
          key: formKey2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Tell Us Your Email Address",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.only(left: 30, right: 30, top: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    label: Text("Enter email"),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email address is required';
                    }
                    // Regular expression for email validation
                    final emailRegex =
                        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                    if (!emailRegex.hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null; // Return null if the validation succeeds
                  },
                ),
              ),
              SizedBox(height: 20),
              Container(
                  margin:
                      EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 20),
                  decoration: BoxDecoration(
                      color: Colors.green,
                      border: Border.all(color: Colors.green),
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.all(10),
                  child: InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Send",
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    onTap: () {
                      if (formKey2.currentState?.validate() ?? false) {
                        print("Form is valid");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Contactlist()));
                      }
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class Contactlist extends StatefulWidget {
  const Contactlist({Key? key}) : super(key: key);

  @override
  State<Contactlist> createState() => _ContactlistState();
}

class _ContactlistState extends State<Contactlist> {
  Future<List> getMethod() async {
    print("hello");
    final response = await http.get(Uri.parse(
        'https://hub.dummyapis.com/employee?noofRecords=10&idStarts=1001'));
    if (response.statusCode == 200) {
      ///   print("pass 1");
      List Data = jsonDecode(response.body);
      return Data;
    } else {
      throw Exception("Error");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMethod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "Contact List",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: FutureBuilder(
            future: getMethod(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData) {
                List contact1 = snapshot.data;
                List<Map<String, dynamic>> contact = contact1.cast();
                return ListView.builder(
                  itemCount: contact.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.black,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(contact[index]['imageUrl']),
                        ),
                        title: Text(contact[index]['firstName']),
                        subtitle: Text(contact[index]['email']),
                        trailing: Text(contact[index]['id'].toString()),
                      ),
                    );
                  },
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
