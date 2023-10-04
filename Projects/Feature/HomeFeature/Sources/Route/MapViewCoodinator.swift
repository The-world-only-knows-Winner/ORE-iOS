import SwiftUI
import MapKit

struct MapViewCoordinator: UIViewRepresentable {
    @ObservedObject var locationManager: LocationManager

    func makeUIView(context: Context) -> some UIView {
        return locationManager.mapView
    }

    func updateUIView(_ uiView: UIViewType, context: Context) { }
}
