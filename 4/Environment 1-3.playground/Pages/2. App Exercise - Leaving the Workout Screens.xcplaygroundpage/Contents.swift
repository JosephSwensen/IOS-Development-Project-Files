/*:
## App Exercise - Leaving the Workout Screens

 >These exercises reinforce Swift concepts in the context of a fitness tracking app.

 `dismiss` is an action the environment gives every view. Calling it closes the screen the view is on.

 The app below has a list of workouts. Tapping a workout pushes a detail screen. The `New Workout` button opens a sheet. Right now there is no button to leave either one. The detail screen even hides the normal back button, so you'll need to build your own.
 */


import SwiftUI
import PlaygroundSupport

struct WorkoutListScreen: View {
    let workoutNames = ["Morning Run", "Bike Ride", "Yoga"]
    @State private var showingNewWorkout = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(workoutNames, id: \.self) { workoutName in
                    NavigationLink(workoutName) {
                        WorkoutDetailScreen(workoutName: workoutName)
                    }
                }
            }
            .navigationTitle("Workouts")
            .toolbar {
                Button("New Workout") {
                    showingNewWorkout = true
                }
            }
            .sheet(isPresented: $showingNewWorkout) {
                NewWorkoutSheet()
            }
        }
        .frame(width: 320, height: 480)
    }
}

struct WorkoutDetailScreen: View {
    @Environment(\.dismiss) private var dismiss
    let workoutName: String

    var body: some View {
        VStack(spacing: 20) {
            Text(workoutName)
                .font(.largeTitle)
            Text("Steps: 4200")
            
            Button("Back") {
                dismiss()
            }

        }
        .navigationBarBackButtonHidden(true) // hides the normal back button
    }
}

struct NewWorkoutSheet: View {
    @Environment(\.dismiss) private var dismiss
    @State private var workoutName = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("New Workout")
                .font(.title)
            TextField("Workout name", text: $workoutName)
                .textFieldStyle(.roundedBorder)
            
            Button("Cancel") {
                dismiss()
            }
            
            Button("Save") {
                dismiss()
            }
            .disabled(workoutName.isEmpty)

        }
        .padding()
    }
}

PlaygroundPage.current.setLiveView(WorkoutListScreen())


/*:
 Make all four changes below in the code above.

 1. In `WorkoutDetailScreen`, add `@Environment(\.dismiss) private var dismiss`. Under the steps text, add a button labeled `Back to Workouts` that calls `dismiss()`.
 2. In `NewWorkoutSheet`, read `dismiss` the same way. Under the text field, add a button labeled `Cancel` that calls `dismiss()`.
 3. Add a second button to `NewWorkoutSheet` labeled `Save`. For now it only calls `dismiss()` too.
 4. The `Save` button should be turned off while `workoutName` is empty. (Hint: the `.disabled` modifier turns a control off.)

 Run the page. Tap a workout and leave it with your button. Then open the sheet, check that `Save` stays off until you type a name, and close the sheet with each button.

 You wrote the same `dismiss()` call in a pushed screen and in a sheet. In a comment below, explain how one action knows whether to go back a screen or close the sheet.
 */
// well its the sheet that call the view so it closes the sheet becasue the sheet called it so we are in the sheet




/*:
 [Previous](@previous)  |  page 2 of 9  |  [Next: Exercise - Setting a Value for Part of the Screen](@next)
 */
