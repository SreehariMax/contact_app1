part of 'contact_cubit.dart';

abstract class ContactState extends Equatable {
  const ContactState();
}

final class ContactInitial extends ContactState {
  @override
  List<Object> get props => [];
}

final class ContactLoading extends ContactState {
  @override
  List<Object> get props => [];
}

final class ContactSuccess extends ContactState {
  @override
  List<Object> get props => [];
}

final class ContactError extends ContactState {
  final String error;
  ContactError(this.error);
  @override
  List<Object> get props => [error];
}
