import SwiftUI

struct SwitchPlaygroundView: View {
    @State var isOn = false
    var body: some View {
        ScrollView {
            VStack {
                ORIToggle(isOn: $isOn)
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
    }
}

struct SwitchPlaygroundView_Previews: PreviewProvider {
    static var previews: some View {
        SwitchPlaygroundView()
    }
}
