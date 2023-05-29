import 'package:flutter_native_contact_picker/flutter_native_contact_picker.dart';
import 'package:wsafe/services/database.dart';

class ContactPicker {
  final cont = FlutterContactPicker();
  final db = DataBaseServices();
  Future<Map?> _selectContact() async {
    Contact? contact = await cont.selectContact();
    return contact != null
        ? Map.from({
            'name': contact.fullName,
            'number': contact.phoneNumbers?[0] ?? "0"
          })
        : null;
  }

  uploadContact() async {
    Map? contact = await _selectContact();
    if (contact != null) {
      return db.updateContact(contact);
    }
  }
}
