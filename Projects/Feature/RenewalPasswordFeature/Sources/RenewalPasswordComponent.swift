import SwiftUI
import NeedleFoundation
import RenewalPasswordFeatureInterface

public protocol RenewalPasswordDependency: Dependency {}

public final class RenewalPasswordComponent: Component<RenewalPasswordDependency>, RenewalPasswordFactory {
    public func makeView() -> some View {
        RenewalPasswordView(viewModel: .init())
    }
}
