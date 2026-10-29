/*:
## App Exercise - Picking the Path

 >These exercises reinforce Swift concepts in the context of a fitness tracking app.

 Data can reach a view three ways. Ask about the data, not the view.

 - Only the next view needs it, and only reads it: pass it in the **initializer**.
 - The next view needs to change a value its parent owns: pass a **binding**.
 - Many views, or views far down, need it: use the **environment**.

 The app below runs, but it sends three pieces of data the wrong way. Run it first. Notice that the stepper changes its own number, but the `Daily goal` text above it never changes.
 */


import SwiftUI
import PlaygroundSupport

@Observable
class StepTracker {
    var steps = 0

    func addSteps(_ amount: Int) {
        steps += amount
    }
}

extension EnvironmentValues {
    @Entry var workoutTitle: String = ""
}

struct GoalsScreen: View {
    @State private var tracker = StepTracker()
    @State private var dailyGoal = 10000

    var body: some View {
        VStack(spacing: 20) {
            Text("Daily goal: \(dailyGoal)")
                .font(.headline)
            GoalStepper()
            WorkoutTitleRow()
                .environment(\.workoutTitle, "Morning Run")
            TodaySection(tracker: tracker)
        }
        .padding()
        .frame(width: 320, height: 480)
    }
}

// Problem 1
struct GoalStepper: View {
    @State private var goal = 10000

    var body: some View {
        Stepper("Goal: \(goal)", value: $goal, in: 1000...30000, step: 1000)
    }
}

// Problem 2
struct WorkoutTitleRow: View {
    @Environment(\.workoutTitle) private var workoutTitle

    var body: some View {
        Text("Next workout: \(workoutTitle)")
    }
}

// Problem 3
struct TodaySection: View {
    let tracker: StepTracker

    var body: some View {
        VStack {
            Text("Today")
                .font(.title)
            TodayStepsLabel(tracker: tracker)
            AddStepsButton(tracker: tracker)
        }
    }
}

struct TodayStepsLabel: View {
    let tracker: StepTracker

    var body: some View {
        Text("Steps: \(tracker.steps)")
    }
}

struct AddStepsButton: View {
    let tracker: StepTracker

    var body: some View {
        Button("Add 500 steps") {
            tracker.addSteps(500)
        }
    }
}

PlaygroundPage.current.setLiveView(GoalsScreen())


/*:
 Fix each problem below by moving the data to the right path. Then replace each `// Problem` comment with a comment that names the path you chose and gives one sentence on why.

 1. `GoalStepper` keeps its own copy of the goal, so `GoalsScreen` never sees the change. Change it so the stepper changes `dailyGoal` in `GoalsScreen`.
 2. `WorkoutTitleRow` is the only view that reads `workoutTitle`, it only reads it, and it sits one level down. Change it so the title reaches it another way. Then delete the `workoutTitle` extension, since nothing uses it anymore.
 3. `TodaySection` only takes `tracker` so it can pass it on. Change it so `TodayStepsLabel` and `AddStepsButton` get the tracker another way, and `TodaySection` does not mention `StepTracker` at all.

 Run the page. The stepper should change the `Daily goal` text, the row should say `Next workout: Morning Run`, and `Add 500 steps` should still update the step count.
 */


/*:
 [Previous](@previous)  |  page 8 of 9  |  [Next: Black Diamond - A Control That Knows When It Is Off](@next)
 */
