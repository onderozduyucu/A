import 'package:flutter_test/flutter_test.dart';
import 'package:fluttermvvmtemplate/core/init/config/app_environment.dart';
import 'package:fluttermvvmtemplate/core/init/network/network_service_path.dart';
import 'package:fluttermvvmtemplate/core/init/network/vexana_manager.dart';
import 'package:gen/gen.dart';
import 'package:vexana/vexana.dart';

void main() {
  late final VexanaManager manager;
  setUp(() {
    AppEnvironment.general();
    manager = VexanaManager.base();
  });
  test('get login items from api', () async {
    final response = await manager.send<LoginResponseModel, LoginResponseModel>(
      NetworkServicePath.login.value,
      parseModel: LoginResponseModel(),
      method: RequestType.POST,
      data: LoginRequestModel(email: 'john@mail.com', password: 'changeme'),
    );

    expect(response.data, isNotNull);
  });
}
