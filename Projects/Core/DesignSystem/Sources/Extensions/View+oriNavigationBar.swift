import SwiftUI

public struct ORINavigationBar<Content>: View where Content: View {
    let leadingItem: NavigationItem?
    let trailingItem: NavigationItem?
    var headerTitle: String
    var pageTitle: String?
    var scrollable: Bool
    let content: () -> Content

    public init(
        leadingItem: NavigationItem? = nil,
        trailingItem: NavigationItem? = nil,
        headerTitle: String = "",
        pageTitle: String? = nil,
        scrollable: Bool = false,
        @ViewBuilder _ content: @escaping () -> Content
    ) {
        self.leadingItem = leadingItem
        self.trailingItem = trailingItem
        self.headerTitle = headerTitle
        self.pageTitle = pageTitle
        self.scrollable = scrollable
        self.content = content
    }

    public var body: some View {
        Group {
            if scrollable {
                ScrollView {
                    contentView()
                }
            } else { contentView() }

        }
        .oriBackground()
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(headerTitle)
                    .oriFont(.heading(.heading1), color: .GrayScale.gray700)
            }
        }
        .navigationBarItems(
            leading: toolbarView(type: .leading),
            trailing: toolbarView(type: .trailing)
        )
        .navigationBarBackButtonHidden(
            leadingItem != nil
        )
        .navigationBarTitleDisplayMode(.inline)
    }

    private enum ToolbarType {
        case leading
        case trailing
    }

    @ViewBuilder
    private func toolbarView(type: ToolbarType) -> some View {
        switch type {
        case .leading:
            if let leadingItem {
                Button {
                    leadingItem.action()
                } label: {
                    leadingItem.image
                        .frame(width: 28, height: 28)
                }
            } else { EmptyView() }

        case .trailing:
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

    @ViewBuilder
    func contentView() -> some View {
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

            content()
        }
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
