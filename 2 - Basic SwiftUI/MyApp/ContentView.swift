import SwiftUI
import Playgrounds

let Zion = Park(parkName: "Zion", becameANationalPark: 1919, acres: 147_000, closestTown: "Springdale")

let BryceCanyon = Park(parkName: "Bryce Canyon", becameANationalPark: 1928, acres: 36_000, closestTown: "Bryce Cayon City")

let Arches = Park(parkName: "Arches", becameANationalPark: 1971, acres: 77_000, closestTown: "Moab")

let CapitolReef = Park(parkName: "Capitol Reef", becameANationalPark: 1971, acres: 242_000, closestTown: "Torrey")

struct ContentView: View {
    
    @State var park = Zion
    
    var body: some View {
        VStack {
            Picker("Park", selection: $park) {
                Text("Zion").tag(Zion)
                Text("Bryce Canyon").tag(BryceCanyon)
                Text("Arches").tag(Arches)
                Text("Capitol Reef").tag(CapitolReef)
            }
            .pickerStyle(.segmented)
            
            Text("park name: \(park.parkName)")
            Text("became a national park: \(park.becameANationalPark)")
            Text("acres: \(park.acres)")
            Text("closest town: \(park.closestTown)")
        }
    }
}

#Preview {
    ContentView()
}

#Playground {
    _ = 1 + 2
}
