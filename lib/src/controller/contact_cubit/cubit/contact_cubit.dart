import 'package:contacts_app/src/controller/contact_cubit/cubit/contact_repository.dart';
import 'package:contacts_app/src/core/network/api_response.dart';
import 'package:contacts_app/src/models/contact_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());

  ContactRepository contactRepository = ContactRepository();

// Create
  createContact(ContactModel contactModel) async {
    emit(ContactCreateStateLoading());
    try {
      ApiResponse response =
          await contactRepository.createNewContact(contactModel);
      if (response.Status == true) {
        emit(ContactCreateStateSuccess());
      } else {
        emit(ContactCreateStateError());
      }
    } catch (e) {
      emit(ContactCreateStateError());
    }
  }

//Read
  readContact() async {
    emit(ContactReadStateLoading());
    try {
      ApiResponse response = await contactRepository.getAllContacts();
      if (response.Status == true) {
        emit(ContactReadStateSuccess());
      } else {
        emit(ContactReadStateError());
      }
    } catch (e) {
      emit(ContactReadStateError());
    }
  }

//Update
  updateContact(ContactModel contactModel) async {
    emit(ContactUpdateStateLoading());
    try {
      ApiResponse response =
          await contactRepository.updateContact(contactModel);
      if (response.Status == true) {
        emit(ContactUpdateStateSuccess());
      } else {
        emit(ContactUpdateStateError());
      }
    } catch (e) {
      emit(ContactUpdateStateError());
    }
  }

//Delete
  deleteContact(ContactModel contactModel) async {
    emit(ContactDeleteStateLoading());
    try {
      ApiResponse response = await contactRepository.deleteContact(contactModel);
      if (response.Status == true) {
        emit(ContactDeleteStateSuccess());
      } else {
        emit(ContactDeleteStateError());
      }
    } catch (e) {
      emit(ContactDeleteStateError());
    }
  }
}