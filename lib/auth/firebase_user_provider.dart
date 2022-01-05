import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class RemoteToDoFirebaseUser {
  RemoteToDoFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

RemoteToDoFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<RemoteToDoFirebaseUser> remoteToDoFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<RemoteToDoFirebaseUser>(
            (user) => currentUser = RemoteToDoFirebaseUser(user));
