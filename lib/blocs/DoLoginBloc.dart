import 'package:flutter_rosa/events/DoLoginEvent.dart';
import 'package:flutter_rosa/events/LoginEvent.dart';
import 'package:flutter_rosa/models/login/LoginResponseModel.dart';
import 'package:flutter_rosa/states/DoLoginState.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_rosa/repo/LoginRepo.dart';
import 'package:flutter_rosa/blocs/AuthBloc.dart';

class DoLoginBloc extends Bloc<DoLoginEvent, DoLoginState>{

  final LoginRepo loginRepo;
  final AuthBloc authBloc;

  DoLoginBloc({
    @required this.loginRepo,
    @required this.authBloc
}) : assert(loginRepo != null),
        assert(authBloc != null);

  @override
  DoLoginState get initialState => DoLoginInitial();

  @override
  Stream<DoLoginState> mapEventToState(DoLoginEvent event) async* {
    if (event is DoLoginButtonPressed) {
      yield DoLoginLoading();

      try {
        final LoginResponseModel loginResponseModel = await loginRepo.doLogin(
          event.loginRequestModel.toJson()
        );


        authBloc..add(LoggedIn(model: loginResponseModel));
        yield DoLoginInitial();
      } catch (error) {
        yield DoLoginFailure(error: error.toString());
      }
    }
  }

}