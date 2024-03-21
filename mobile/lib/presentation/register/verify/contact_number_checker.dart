bool isContactValid({required String contact}) {
  try {
    int.parse(contact);
    return true;
  } catch (e) {
    return false;
  }
}
