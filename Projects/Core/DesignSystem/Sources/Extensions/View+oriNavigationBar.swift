import SwiftUI

struct ORINavigationBarModifier: ViewModifier {
    var leadingItem: NavigationItem?
    var trailingItem: NavigationItem?
    var headerTitle: String = ""
    var pageTitle: String? = ""

    public init(
        leadingItem: NavigationItem?,
        trailingItem: NavigationItem?,
        headerTitle: String,
        pageTitle: String?
    ) {
        self.leadingItem = leadingItem
        self.trailingItem = trailingItem
        self.headerTitle = headerTitle
        self.pageTitle = pageTitle
    }

    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            if let pageTitle {
                HStack {
                    Text(pageTitle)
                        .oriFont(.heading(.heading1), color: .GrayScale.gray700)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 24)

                    Spacer()
                }
            }

            Spacer()

            content
        }
        .oriBackground()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(headerTitle)
                    .oriFont(.heading(.heading1), color: .GrayScale.gray700)
            }
        }
        .navigationBarItems(
            leading: leadingView(),
            trailing: trailingView()
        )
        .navigationBarBackButtonHidden(
            leadingItem != nil
        )
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder func leadingView() -> some View {
        if let leadingItem {
            Button {
                leadingItem.action()
            } label: {
                leadingItem.image
                    .frame(width: 28, height: 28)
            }
        } else { EmptyView() }
    }

    @ViewBuilder func trailingView() -> some View {
        if let trailingItem {
            Button {
                trailingItem.action()
            } label: {
                trailingItem.image
                    .frame(width: 28, height: 28)
            }
        } else { EmptyView() }
    }
}

public extension View {
    @ViewBuilder func oriNavigationBar(
        leadingItem: NavigationItem? = nil,
        trailingItem: NavigationItem? = nil,
        headerTitle: String = "",
        pageTitle: String? = nil
    ) -> some View {
        modifier(
            ORINavigationBarModifier(
                leadingItem: leadingItem,
                trailingItem: trailingItem,
                headerTitle: headerTitle,
                pageTitle: pageTitle
            )
        )
    }
}

public struct NavigationItem {
    var image: ORIIcon
    var action: () -> Void

    public init(image: ORIIcon, action: @escaping () -> Void) {
        self.image = image
        self.action = action
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
