import 'package:contact_bloc/models/contact_model.dart';
import 'package:dio/dio.dart';

class ContactRepository {

  static String BASIC_URL = 'http://10.0.2.2:3031/contacts';

  Future<List<ContactModel>> findAll() async {
    final response = await Dio().get(BASIC_URL);

    return response.data
        ?.map<ContactModel>((contact) => ContactModel.fromMap(contact))
        .toList();
  }

  Future<void> createContact(ContactModel contactModel) async {
    await Dio().post(BASIC_URL, data: contactModel.toMap());
  }

  Future<void> updateContact(ContactModel contactModel) async {
    await Dio().put('$BASIC_URL/${contactModel.id}', data: contactModel.toMap());
  }

  Future<void> deleteContact(ContactModel contactModel) async {
    await Dio().delete('$BASIC_URL/${contactModel.id}');
  }
}
