import SwiftUI
import Playgrounds

struct ContentView: View {
    let consultationDates = ["Tuesday, October 13", "Friday, October 9","Thursday, October 8","Wednesday, October 7","Tuesday, October 6"]
    @State var name: String = ""
    @State var look: String = ""
    @State var chosenDate: String = ""
    @State var numberOfOutfits: Int = 0
    @State var bold: Double = 0
    @State var textReminderTheDayBefore: Bool = false
    @State var phoneNumber: String = ""
    
    var body: some View {
        Form {
            Section("the client") {
                TextField("name", text: $name)
                TextField("what look are you going for", text: $look)
                
            }
            Section("the appointment") {
                Picker("date", selection: $chosenDate) {
                    ForEach(consultationDates, id: \.self) { date in
                        Text(date)}
                }
                Stepper("number of outfits: \(numberOfOutfits)", value: $numberOfOutfits, in: 0...5)
                HStack {
                    Text("Bold")
                    Slider(value: $bold, in: 0...1)
                }
                Toggle("text reminder the day before", isOn: $textReminderTheDayBefore).onChange(of: textReminderTheDayBefore) {
                    phoneNumber = ""
                }
                
                if textReminderTheDayBefore == true {
                    
                    TextField("phone number", text: $phoneNumber)
                    
                }
                
                
            }
            Section("the summary") {
                Text("Name: \(name)")
                Text("Look: \(look)")
                Text("Date: \(chosenDate)")
                Text("Number of outfits: \(numberOfOutfits)")
                Text("how bold: \(bold)")
                Text("did they want a text?: \(textReminderTheDayBefore)")
                
                if textReminderTheDayBefore {
                    Text("Phone number: \(phoneNumber)")
                }
            }
        }
    }
}


#Preview {
    ContentView()
}

#Playground {
    _ = 1 + 2
}
