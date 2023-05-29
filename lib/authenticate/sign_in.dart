import 'package:wsafe/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wsafe/screens/loading.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

  final TextEditingController _emailTextEditingController =
      TextEditingController();
  final TextEditingController _passwordTextEditingController =
      TextEditingController();
  String? errorMessage;

  Future signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(_emailTextEditingController.text,
          _passwordTextEditingController.text);
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message;
    }
  }

  Future registerWithEmailAndPassword() async {
    try {
      await _auth.registerWithEmailAndPassword(_emailTextEditingController.text,
          _passwordTextEditingController.text);
    } on FirebaseAuthException catch (e) {
      errorMessage = e.message;
    }
  }

  var isSign = true;

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/back.png'),
                        fit: BoxFit.cover)),
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/logo.png'),
                    const Text(
                      'WSAFE',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white54,
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            const SizedBox(height: 20.0),
                            TextFormField(
                              decoration:
                                  const InputDecoration(labelText: 'Email'),
                              validator: (val) =>
                                  val!.isEmpty ? 'Enter an email' : null,
                              controller: _emailTextEditingController,
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              obscureText: true,
                              decoration:
                                  const InputDecoration(labelText: 'Password'),
                              validator: (val) => val!.length < 6
                                  ? 'Enter a password 6+ chars long'
                                  : null,
                              controller: _passwordTextEditingController,
                            ),
                            const SizedBox(height: 20.0),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    textStyle: const TextStyle(fontSize: 20),
                                    minimumSize: const Size.fromHeight(50),
                                    backgroundColor:
                                        Colors.blue[800]!.withOpacity(.9)),
                                child: isSign
                                    ? const Text('Sign In')
                                    : const Text('Register'),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      loading = true;
                                    });
                                    dynamic result = isSign
                                        ? await signInWithEmailAndPassword()
                                        : await registerWithEmailAndPassword();
                                    if (result == null) {
                                      setState(() {
                                        // errorMessage = 'Invalid Credentials';
                                        loading = false;
                                      });
                                    }
                                  }
                                }),
                            errorMessage != null
                                ? const SizedBox(height: 12.0)
                                : const SizedBox(),
                            Text(
                              errorMessage ?? '',
                              style: const TextStyle(
                                  color: Colors.red, fontSize: 14.0),
                            ),
                            errorMessage != null
                                ? const SizedBox(height: 12.0)
                                : const SizedBox(),
                            Row(
                              children: const [
                                Expanded(
                                    child: Divider(
                                        thickness: 1, color: Colors.black87)),
                                Text('  OR  '),
                                Expanded(
                                    child: Divider(
                                        thickness: 1, color: Colors.black87))
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size.fromHeight(50),
                                    backgroundColor: Colors.white70),
                                icon: Image.asset('assets/google.png'),
                                onPressed: _auth.signInGoogle,
                                label: isSign
                                    ? const Text(
                                        'Sign in with Google',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      )
                                    : const Text(
                                        'Register with Google',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      )),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            isSign = !isSign;
                          });
                        },
                        child: isSign
                            ? const Text('Register Here')
                            : const Text('Sign In Here'))
                  ],
                ),
              ),
            ),
          );
  }
}
