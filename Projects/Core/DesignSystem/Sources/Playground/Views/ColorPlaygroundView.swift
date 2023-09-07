import SwiftUI

struct ColorPlaygroundView: View {
    let colors: [[Color]] = [
        [
            .Primary.primary100,
            .Primary.primary200,
            .Primary.primary300,
            .Primary.primary400
        ],
        [
            .GrayScale.gray100,
            .GrayScale.gray200,
            .GrayScale.gray300,
            .GrayScale.gray400,
            .GrayScale.gray500,
            .GrayScale.gray600,
            .GrayScale.gray700
        ],
        [
            .State.green,
            .State.red
        ]
    ]
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 10)

    var body: some View {
        ScrollView {
            VStack {
                ForEach(colors, id: \.hashValue) { subColors in
                    LazyVGrid(columns: columns) {
                        ForEach(subColors, id: \.hashValue) { color in
                            RoundedRectangle(cornerRadius: 4)
                                .fill(color)
                                .frame(height: 40)
                        }
                    }
                    .padding(.vertical)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
}

struct ColorPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPlaygroundView()
    }
}
