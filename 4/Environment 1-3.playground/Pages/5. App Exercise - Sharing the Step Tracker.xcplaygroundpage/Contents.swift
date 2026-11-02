/*:
## App Exercise - Sharing the Step Tracker

 >These exercises reinforce Swift concepts in the context of a fitness tracking app.

 A **service** is a type with one job, like getting or saving data. You share a service with `.environment` the same way you share a ViewModel. `StepService` below pretends to read steps from a watch. Later in the program, a service like this would ask the internet.
 */


import SwiftUI
import PlaygroundSupport

@Observable
class StepTracker {
    var steps = 0
    var goal = 10000

    func addSteps(_ amount: Int) {
        steps += amount
    }
}

@Observable
class StepService {
    func stepsFromWatch() -> Int {
        return 3200
    }
}

struct FitnessHomeScreen: View {
    @State private var tracker = StepTracker()
    @State private var service = StepService()

    var body: some View {
        VStack(spacing: 20) {
            Text("Today")
                .font(.largeTitle)

            StepCountLabel()
            ButtonsSection()
        }
        .environment(tracker)
        .environment(service)
        .frame(width: 320, height: 480)
    }
}

struct StepCountLabel: View {
    @Environment(StepTracker.self) private var tracker

    var body: some View {
        Text("\(tracker.steps) of \(tracker.goal) steps")
    }
}

struct AddWalkButton: View {
    @Environment(StepTracker.self) private var tracker

    var body: some View {
        Button("Add a walk") {
            tracker.addSteps(1000)
        }
    }
}

struct SyncButton: View {
    @Environment(StepTracker.self) private var tracker
    @Environment(StepService.self) private var service

    var body: some View {
        Button("Sync watch") {
            tracker.addSteps(service.stepsFromWatch())
        }
    }
}

struct ButtonsSection: View {
    var body: some View {
        HStack {
            AddWalkButton()
            SyncButton()
        }
    }
}

PlaygroundPage.current.setLiveView(FitnessHomeScreen())


/*:
 Make all five changes below in the code above.

 1. In `FitnessHomeScreen`, create a `StepTracker` and a `StepService` as `@State` properties. Share both with every view inside the `VStack`, using one `.environment` modifier for each.
 2. Write a view called `StepCountLabel` that reads `StepTracker` from the environment and shows its `steps` and `goal`, like `0 of 10000 steps`.
 3. Write a view called `AddWalkButton` that reads `StepTracker` from the environment. Its button is labeled `Add a walk` and adds 1000 steps.
 4. Write a view called `SyncButton` that reads both `StepTracker` and `StepService` from the environment. Its button is labeled `Sync watch`, and it adds the steps from `stepsFromWatch()` to the tracker.
 5. Write a view called `ButtonsSection` that holds `AddWalkButton` and `SyncButton` in an `HStack`. Show `StepCountLabel` and `ButtonsSection` under the `Today` text. `ButtonsSection` should not mention `StepTracker` or `StepService`.

 Run the page. Tap `Sync watch` once and `Add a walk` twice. The label should read `5200 of 10000 steps`.

 In an app, you'd check `StepCountLabel` by itself with a `#Preview`. In a playground, the `setLiveView` line at the bottom does the same job. Change it so it shows only `StepCountLabel()`. Run the page and write the error in a comment below.
 */

// I expect an error because the label has no StepTracker.
// It needs a StepTracker to show the steps.





/*:
 Fix it the same way you would fix a `#Preview`: add `.environment(StepTracker())` after `StepCountLabel()` in the `setLiveView` line. Then add `.environment(\.colorScheme, .dark)` too, so you can check the label in dark mode without changing any settings. Run the page.

 When it works, copy your finished `setLiveView` line into a comment below. Then change the line back so it shows `FitnessHomeScreen()`.
 */
//PlaygroundPage.current.setLiveView(StepCountLabel().environment(StepTracker()).environment(\.colorScheme, .dark))





/*:
 [Previous](@previous)  |  page 5 of 9  |  [Next: Exercise - Your Own Environment Value](@next)
 */
