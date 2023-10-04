import DesignSystem
import SwiftUI

struct SearchRouteView: View {
    @StateObject var viewModel: SearchRouteViewModel
    @Environment(\.dismiss) var dismiss

    let searchItemDummy: [(String, String)] = [
        ("대덕소프트웨어마이스터고등학교", "대전광역시 유성구 가정북로 76"),
        ("도마중학교", "대전광역시 서구 배재로"),
        ("도마초등학교", "대전광역시 서구 도마동"),
        ("양지타운", "대전광역시 서구 배재로 107-30")
    ]

    init(
        viewModel: SearchRouteViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        ZStack {
            ORINavigationBar(
                leadingItem: NavigationItem(image: ORIIcon(.arrowBack)) { dismiss() },
                headerTitle: "장소 지정"
            ) {
                if viewModel.text.isEmpty {
                    ScrollView {
                        ORITextField(text: $viewModel.text, placehoder: "대덕소프트웨어마이스터고등학교", type: .icon(.xmark)) {
                            viewModel.text = ""
                        }

                        ForEach(searchItemDummy, id: \.0) { aaa, bbb in
                            HStack(spacing: 24) {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(aaa)
                                        .oriFont(.body(.body1), color: .GrayScale.gray700)

                                    Text(bbb)
                                        .oriFont(.body(.body4), color: .GrayScale.gray700)
                                }

                                Spacer()

                                Button { dismiss() } label: {
                                    Text("이동")
                                        .oriFont(.body(.body1), color: .Primary.primary300)
                                        .padding(12)
                                }
                            }
                            .padding(.vertical, 16)
                            .padding(.horizontal, 20)
                        }
                    }

                    Spacer()
                } else {
                    ZStack(alignment: .top) {
                        ORITextField(text: $viewModel.text, placehoder: "대덕소프트웨어마이스터고등학교", type: .icon(.xmark)) {
                            viewModel.text = ""
                        }

                        VStack(spacing: 16) {
                            Spacer()

                            ORIIcon(.error)
                                .frame(width: 128, height: 128)

                            Text("검색결과를 찾지 못하였어요")
                                .oriFont(.heading(.heading1), color: .GrayScale.gray700)

                            Spacer()
                        }
                        .ignoresSafeArea()
                    }

                }
            }
        }
    }
}
