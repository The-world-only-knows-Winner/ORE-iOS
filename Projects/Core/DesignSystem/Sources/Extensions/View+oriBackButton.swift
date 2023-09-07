import SwiftUI

struct ORIBackButtonModifier: ViewModifier {
    let willDismiss: () -> Void

    public init(
        willDismiss: @escaping () -> Void
    ) {
        self.willDismiss = willDismiss
    }

    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarLeading) {
                    Button {
                        willDismiss()
                    } label: {
                        ORIIcon(.arrowBack)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
    }
}
public extension View {
    func oriBackButton(
        willDismiss: @escaping () -> Void
    ) -> some View {
        modifier(ORIBackButtonModifier(willDismiss: willDismiss))
    }
}

// SwipeGesture로 뒤로갈 수 있게 하는 extension
extension UINavigationController: ObservableObject, UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
