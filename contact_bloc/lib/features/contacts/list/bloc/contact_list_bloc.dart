import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:contact_bloc/repositories/contacts_repository.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_list_event.dart';

part 'contact_list_state.dart';

part 'contact_list_bloc.freezed.dart';

class ContactListBloc extends Bloc<ContactListEvent, ContactListState> {
  ContactRepository _contactrepository;

  ContactListBloc({required ContactRepository contactRepository})
      : _contactrepository = contactRepository,
        super(ContactListState.initial()) {
    on<ContactListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
