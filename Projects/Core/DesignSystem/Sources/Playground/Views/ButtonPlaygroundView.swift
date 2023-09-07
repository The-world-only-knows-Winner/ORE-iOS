import SwiftUI

struct ButtonPlaygroundView: View {
    var body: some View {
        ScrollView {
            VStack {
                Group {
                    ORIButton(
                        text: "로그인",
                        style: .default,
                        action: {}
                    )
                    ORIButton(
                        text: "로그인",
                        style: .sub,
                        action: {}
                    )
                    ORIButton(
                        text: "로그인",
                        style: .default,
                        action: {}
                    )
                    .disabled(true)
                    ORIButton(
                        text: "로그인",
                        style: .sub,
                        action: {}
                    )
                    .disabled(true)
                }
                .padding(.vertical, 5)
            }
        }
    }
}

struct ButtonPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonPlaygroundView()
    }
}
