import SwiftUI
import MapKit

struct Place: Identifiable {
  let id = UUID()
  var name: String
  var coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    @StateObject var manager = LocationManager()

    var empireStateBuilding = [
        Place(
            name: "도마초등학교",
            coordinate: CLLocationCoordinate2D(latitude: 36.324615450518415, longitude: 127.37165514871339)
        ),
        Place(
            name: "도마중학교",
            coordinate: CLLocationCoordinate2D(latitude: 36.31892915270602, longitude: 127.37233249567345)
        )
    ]

    var body: some View {
        Map(
            coordinateRegion: $manager.region,
            showsUserLocation: true,
            annotationItems: empireStateBuilding
        ) { place in
            MapAnnotation(coordinate: place.coordinate) {
                PlaceAnnotationView(title: place.name)
            }
        }
    }
}

struct PlaceAnnotationView: View {
    @State private var showTitle = true

    let title: String

    var body: some View {
        VStack(spacing: 0) {
            NavigationLink {
                Text(title)
            } label: {
                Text(title)
                    .font(.callout)
                    .padding(5)
                    .background(Color(.white))
                    .cornerRadius(10)
                    .opacity(showTitle ? 0 : 1)
            }

            Image(systemName: "mappin.circle.fill")
                .font(.title)
                .foregroundColor(.red)

            Image(systemName: "arrowtriangle.down.fill")
                .font(.caption)
                .foregroundColor(.red)
                .offset(x: 0, y: -5)
        }
        .onTapGesture {
            withAnimation(.easeInOut) {
                showTitle.toggle()
            }
        }
    }
}
