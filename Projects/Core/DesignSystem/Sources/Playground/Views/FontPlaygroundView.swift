import SwiftUI

struct FontPlaygroundView: View {
    let fonts: [(String, [ORIFontStyle])] = [
        ("Heading", [
            .heading(.heading1),
            .heading(.heading2),
            .heading(.heading3),
        ]),
        ("Body", [
            .body(.body1),
            .body(.body2),
            .body(.body3),
            .body(.body4),
        ])
    ]
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(fonts, id: \.0) { proto in
                    Section {
                        Text(proto.0)
                            .oriFont(.body(.body1))
                    }

                    VStack(alignment: .leading) {
                        ForEach(proto.1, id: \.hashValue) { item in
                            Text("SampleText")
                                .oriFont(item)
                        }
                    }
                    .padding(.vertical, 5)
                }
            }
            .padding(.horizontal)
        }
        .frame(maxWidth: .infinity)
    }
}

struct FontPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        FontPlaygroundView()
    }
}
