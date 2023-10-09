import NeedleFoundation
import AuthDomain
import AuthDomainInterface

public extension AppComponent {
    var remoteAuthDataSource: any RemoteAuthDataSource {
        shared {
            RemoteAuthDataSourceImpl(keychain: keychain)
        }
    }

    var authRepository: any AuthRepository {
        shared {
            AuthRepositoryImpl(
                remoteAuthDataSource: remoteAuthDataSource
            )
        }
    }

    var signinUseCase: any SigninUseCase {
        shared {
            SigninUseCaseImpl(authRepository: authRepository)
        }
    }

    var changePassword: any ChangePasswordUseCase {
        shared {
            ChangePasswordUseCaseImpl(authRepository: authRepository)
        }
    }

    var sendAuthCodeUseCase: any SendAuthCodeUseCase {
        shared {
            SendAuthCodeUseCaseImpl(authRepository: authRepository)
        }
    }

    var verifyAuthCodeUseCase: any VerifyAuthCodeUseCase {
        shared {
            VerifyAuthCodeUseCaseImpl(authRepository: authRepository)
        }
    }

    var logoutUseCase: any LogoutUseCase {
        shared {
            LogoutUseCaseImpl(authRepository: authRepository)
        }
    }

    var tokenRefreshUseCase: any TokenRefreshUseCase {
        shared {
            TokenRefreshUseCaseImpl(authRepository: authRepository)
        }
    }
}
