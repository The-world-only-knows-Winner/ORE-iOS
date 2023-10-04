import SwiftUI

public struct ORINavigationBar<Content>: View where Content: View {
    @State private var isScrolling: Bool = false
    @State private var headerTitleHolder = ""
    @State private var pageTitleHeight: CGFloat = 0
    let leadingItem: NavigationItem?
    let trailingItem: NavigationItem?
    @State var headerTitle: String
    @State var pageTitle: String?
    var scrollable: Bool
    let content: () -> Content

    private func toggleIsShowPageTitle() {
        guard let pageTitle else { return }

        withAnimation(.easeIn(duration: 0.2)) {
            if isScrolling {
                self.headerTitle = pageTitle
                self.pageTitle = ""
            } else {
                self.pageTitle = headerTitle
                self.headerTitle = headerTitleHolder
                self.headerTitleHolder = headerTitle
            }
        }
    }

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
        _headerTitle = State(wrappedValue: headerTitle)
        _pageTitle = State(wrappedValue: pageTitle)
        self.scrollable = scrollable
        self.content = content
    }

    public var body: some View {
        Group {
            if scrollable {
                ScrollView {
                    GeometryReader { proxy in
                        Color.clear.onChange(of: proxy.frame(in: .named("scroll")).minY) { newValue in
                            if newValue < -pageTitleHeight {
                                isScrolling = true
                            } else {
                                isScrolling = false
                            }
                        }
                    }
                    contentView()
                }
                .coordinateSpace(name: "scroll")
            } else { contentView() }

        }
        .oriBackground()
        .onChange(of: isScrolling) { _ in
            self.toggleIsShowPageTitle()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(headerTitle)
                    .oriFont(.body(.body1), color: .GrayScale.gray700)
                    .frame(maxWidth: .infinity, alignment: .center)
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
        let emptyView = Color.clear.frame(width: 28, height: 28)
        switch type {
        case .leading:
            if let leadingItem {
                Button {
                    leadingItem.action()
                } label: {
                    leadingItem.image
                        .frame(width: 28, height: 28)
                }
            } else { emptyView }

        case .trailing:
            if let trailingItem {
                Button {
                    trailingItem.action()
                } label: {
                    trailingItem.image
                        .frame(width: 28, height: 28)
                }
            } else { emptyView }
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
                        .overlay {
                            GeometryReader { proxy in
                                Color.clear.onAppear {
                                    pageTitleHeight = proxy.size.height
                                }
                            }
                        }

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
