import 'package:fluttermvvmtemplate/core/init/network/network_service_path.dart';
import 'package:fluttermvvmtemplate/view/login/model/login_request_model.dart';
import 'package:fluttermvvmtemplate/view/login/model/login_response_model.dart';


import 'package:vexana/vexana.dart';

final class LoginService {
  LoginService(INetworkManager<EmptyModel> networkManager) : _networkManager = networkManager;
  final INetworkManager<EmptyModel> _networkManager;

  Future<LoginResponseModel?> fetchUserControl(LoginRequestModel model) async {
    final response = await _networkManager.send<LoginResponseModel, LoginResponseModel>(
      NetworkServicePath.login.value,
      parseModel: LoginResponseModel(),
      method: RequestType.POST,
      data: model,
    );

    if (response.data is LoginResponseModel) {
      return response.data;
    } else {
      return null;
    }
  }
}
