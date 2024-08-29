class LogInWithEmailAndPasswordFailure {
  final String message;

const LogInWithEmailAndPasswordFailure([this.message = "An Unknown error occurred."]);

factory LogInWithEmailAndPasswordFailure.code(String code) {
  switch(code) {
      case 'weak-password':
        return const LogInWithEmailAndPasswordFailure('Please enter a stronger password.');

      case 'Invalid-email':
          return const LogInWithEmailAndPasswordFailure('Email is not valid or badly formatted.');

        case 'email-already-in-use':
          return const LogInWithEmailAndPasswordFailure('An account already exists for that enail.');

        case 'operation-not-allowed':
          return const LogInWithEmailAndPasswordFailure('Operation is not allowed. Please contact support.');

        case 'user-disabled':
          return const LogInWithEmailAndPasswordFailure('This user has been disabled. Please contact support for help.');

        default:
          return const LogInWithEmailAndPasswordFailure();
        }
    }
}