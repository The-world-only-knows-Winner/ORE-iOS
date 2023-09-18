import SwiftUI
import NeedleFoundation
import RenewalPasswordInterface

public protocol RenewalPasswordDependency: Dependency {}

public final class RenewalPasswordComponent: Component<RenewalPasswordDependency>, RenewalPasswordFactory {
    public func makeView() -> some View {
        RenewalPasswordView(viewModel: .init())
    }
}
