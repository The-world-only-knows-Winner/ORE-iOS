import NeedleFoundation
import SwiftUI
import JwtStoreInterface
import RootFeature
import RootFeatureInterface
import SigninFeature
import SigninFeatureInterface
import SignupFeature
import SignupFeatureInterface
import SplashFeature
import SplashFeatureInterface
import OnboardingFeature
import OnboardingFeatureInterface

public final class AppComponent: BootstrapComponent {
    private let _keychain: any Keychain

    init(keychain: any Keychain) {
        self._keychain = keychain
    }

    public func makeRootView() -> some View {
        rootComponent.makeView()
    }

    public var keychain: any Keychain {
        shared {
            _keychain
        }
    }

    var rootComponent: RootComponent {
        RootComponent(parent: self)
    }
}

public extension AppComponent {
    var signinFactory: any SigninFactory {
        SigninComponent(parent: self)
    }
    var signupFactory: any SignupFactory {
        SignupComponent(parent: self)
    }
    var splashFactory: any SplashFactory {
        SplashComponent(parent: self)
    }
    var onboardingFactory: any OnboardingFactory {
        OnboardingComponent(parent: self)
    }
}
