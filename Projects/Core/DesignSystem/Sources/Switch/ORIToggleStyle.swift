import SwiftUI

public struct ORIToggleBtnStyle: ToggleStyle {
//    @Environment(\.isEnabled) var isEnabled: Bool
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            ZStack(alignment: configuration.isOn ? .trailing : .leading) {
                RoundedRectangle(cornerRadius: 100)
                    .frame(width: 48, height: 28)
                    .foregroundColor(configuration.isOn ? .Primary.primary100 : .GrayScale.gray200)

                Circle()
                    .frame(width: 20, height: 20)
                    .padding(4)
                    .foregroundColor(configuration.isOn ? .Primary.primary300 : .GrayScale.gray300)
                    .onTapGesture {
                        withAnimation {
                            configuration.$isOn.wrappedValue.toggle()
                        }
                    }
            }
        }
    }
}
