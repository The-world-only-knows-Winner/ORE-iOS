import SwiftUI
import DesignSystem

private struct SizePreferenceKey: PreferenceKey {
    public typealias Value = CGSize
    public static var defaultValue: Value = .zero

    public static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}

private struct BackgroundGeometryReader: View {
    public init() {}

    public var body: some View {
        GeometryReader { geometry in
            return Color
                .clear
                .preference(key: SizePreferenceKey.self, value: geometry.size)
        }
    }
}

public struct SegmentPageView: View {

    private let items: [String]
    @Binding private var selection: Int
    @State private var itemTitleSizes: [CGSize] = []

    public init(
        items: [String],
        selection: Binding<Int>
    ) {
        self._selection = selection
        self.items = items
        self._itemTitleSizes = State(initialValue: [CGSize](repeating: .zero, count: items.count))
    }

    public var body: some View {
        VStack(alignment: .center, spacing: 0) {
            HStack(spacing: 8) {
                ForEach(0 ..< items.count, id: \.self) { index in
                    segmentItemView(for: index)
                }
            }
            .padding(.horizontal, 20)
            .overlay(alignment: .bottom) {
                ZStack {
                    Rectangle()
                        .foregroundColor(.GrayScale.gray200)
                        .frame(maxWidth: .infinity, maxHeight: 2)

                    HStack {
                        if selection == 1 {
                            Spacer()
                        }

                        Rectangle()
                            .foregroundColor(.GrayScale.gray700)
                            .frame(width: selectedItemWidth, height: 2)
                            .animation(.spring(), value: selection)

                        if selection == 0 {
                            Spacer()
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
    }

    private var selectedItemWidth: CGFloat {
        return itemTitleSizes.count > selection ? itemTitleSizes[selection].width : .zero
    }

    @ViewBuilder
    private func segmentItemView(for index: Int) -> some View {
        HStack {
            Spacer()

            Text(items[index])
                .oriFont(.body(.body1), color: .GrayScale.gray700)

            Spacer()
        }
        .padding(.vertical, 16)
        .background(BackgroundGeometryReader())
        .onPreferenceChange(SizePreferenceKey.self) {
            itemTitleSizes[index] = $0
        }
        .onTapGesture { onItemTap(index: index) }
    }

    private func onItemTap(index: Int) {
        guard index < self.items.count else { return }
        withAnimation {
            self.selection = index
        }
    }
}
