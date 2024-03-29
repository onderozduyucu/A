// Project service path
// ignore_for_file: public_member_api_docs, sort_constructors_first

enum NetworkServicePath {
  login('auth/login'),
  test('tesst'),
  posts('/posts546756787p'),
  usersV2('v2/users');

  final String value;
  const NetworkServicePath(this.value);

  /// [withQuery] is add query to path
  ///
  /// Example: users/123
  String withQuery(String value) {
    return '${this.value}/$value';
  }
}
