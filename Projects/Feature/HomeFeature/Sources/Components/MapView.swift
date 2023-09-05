import SwiftUI

struct MapView: View {
    @ObservedObject var locationManager: LocationManager

    var body: some View {
        VStack {
            ZStack(alignment: .center) {
                ContentView(manager: locationManager)
            }

            Text(locationManager.currentPlace)
                .padding()
                .background(.green)
                .onTapGesture {
                    locationManager.requestLocation()
                }
        }
    }
}
