import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth;

  AuthBloc({FirebaseAuth? firebaseAuth})
    : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
      super(AuthInitial()) {
    on<AppStarted>(_onAppStarted);
    on<SignInRequested>(_onSignInRequested);
    on<SignUpRequested>(_onSignUpRequested);
    on<SignOutRequested>(_onSignOutRequested);
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    try {
      final user = _firebaseAuth.currentUser;
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(UnAuthenticated());
      }
    } catch (e) {
      emit(UnAuthenticated());
    }
  }

  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      if (userCredential.user != null) {
        emit(Authenticated(userCredential.user!));
      } else {
        emit(const AuthError('Failed to sign in'));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'An error occurred during sign in'));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      if (userCredential.user != null) {
        await userCredential.user!.updateDisplayName(event.name);
        emit(Authenticated(userCredential.user!));
      } else {
        emit(const AuthError('Failed to sign up'));
      }
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'An error occurred during sign up'));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> _onSignOutRequested(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await _firebaseAuth.signOut();
      emit(UnAuthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
