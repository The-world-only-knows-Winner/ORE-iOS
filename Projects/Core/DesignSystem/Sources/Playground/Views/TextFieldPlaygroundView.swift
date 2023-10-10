import SwiftUI

struct TextFieldPlaygroundView: View {
    @State var text1 = ""
    @State var text2 = ""
    @State var text3 = ""
    @State var text4 = ""
    @State var text5 = ""
    @State var text6 = ""
    @State var isError1 = false

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ORITextField(
                    text: $text1,
                    placehoder: "플레이스홀더",
                    title: "타이틀"
                ) { }
                ORITextField(
                    text: $text2,
                    placehoder: "플레이스홀더",
                    title: "타이틀",
                    type: .icon(.visibility),
                    description: .constant(.successToSendEmail)
                ) { }
                ORITextField(
                    text: $text3,
                    placehoder: "플레이스홀더",
                    title: "타이틀",
                    type: .icon(.visibilityOff),
                    description: .constant(.wrongPassword)
                ) { }

                ORITextField(
                    text: $text4,
                    placehoder: "플레이스홀더",
                    title: "타이틀",
                    type: .button(.main),
                    description: .constant(.isEmpty)
                ) { }
                ORITextField(
                    text: $text5,
                    placehoder: "플레이스홀더",
                    title: "타이틀",
                    type: .button(.sub)
                ) { }
            }
        }
    }
}

struct TextFieldPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldPlaygroundView()
    }
}
