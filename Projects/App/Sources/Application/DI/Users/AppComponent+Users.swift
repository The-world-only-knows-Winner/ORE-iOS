import NeedleFoundation
import UserDomain
import UserDomainInterface
import JwtStoreInterface

public extension AppComponent {
    var remoteUserDataSource: any RemoteUserDataSource {
        shared {
            RemoteUserDataSourceImpl(keychain: keychain)
        }
    }

    var userRepository: any UserRepository {
        shared {
            UserRepositoryImpl(remoteUserDataSource: remoteUserDataSource)
        }
    }

    var signupUseCase: any SignupUseCase {
        shared {
            SignupUseCaseImpl(userRepository: userRepository)
        }
    }

    var fetchMyInfoUseCase: any FetchMyInfoUseCase {
        shared {
            FetchMyInfoUseCaseImpl(userRepository: userRepository)
        }
    }

    var updateMyInfoUseCase: any UpdateMyInfoUseCase {
        shared {
            UpdateMyInfoUseCaseImpl(userRepository: userRepository)
        }
    }
}
