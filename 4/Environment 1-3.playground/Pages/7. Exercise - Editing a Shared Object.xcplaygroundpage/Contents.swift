/*:
## Exercise - Editing a Shared Object

 `@Environment` gives you a shared object, but it does not give you a `$` to bind a control to. `@Bindable` does.
 */


import SwiftUI
import PlaygroundSupport

@Observable
class PlaylistSettings {
    var playlistName = "Road Trip"
    var shuffleOn = false
}

struct PlaylistScreen: View {
    @State private var settings = PlaylistSettings()

    var body: some View {
        VStack(spacing: 20) {
            PlaylistHeader()
            PlaylistEditor()

        }
        .environment(settings)
        .padding()
        .frame(width: 320, height: 480)
    }
}

struct PlaylistHeader: View {
    @Environment(PlaylistSettings.self) private var settings

    var body: some View {
        VStack {
            Text(settings.playlistName)
                .font(.title)
            Text(settings.shuffleOn ? "Shuffle: On" : "Shuffle: Off")
        }
    }
}

struct PlaylistEditor: View {
    @Environment(PlaylistSettings.self) private var settings

    var body: some View {
        VStack {
            TextField("Playlist name", text: .constant(""))
                .textFieldStyle(.roundedBorder)
            Toggle("Shuffle", isOn: .constant(false))
        }
    }
}

PlaygroundPage.current.setLiveView(PlaylistScreen())


/*:
 Make all four changes below in the code above.

 1. In `PlaylistEditor`, change `.constant("")` to `$settings.playlistName`. Xcode shows an error. Write the error message in a comment below.
 2. Fix it by adding `@Bindable var settings = settings` as the first line of `body`. Run the page and type a new name. The header should change as you type.
 3. Bind the `Toggle` to `$settings.shuffleOn` the same way. Run the page and check that the header shows the change.
 4. Write a second editor view called `PlaylistEditorFromInit` that gets the settings through its initializer instead of the environment. Declare its property as `@Bindable var settings: PlaylistSettings`, and give it a `TextField` bound to `playlistName`. Show it under `PlaylistEditor`, passing in `settings`.

 Run the page. Typing in either text field should change the header and the other text field.
 */





//:  In a comment below, explain why `@Bindable` goes inside `body` in `PlaylistEditor`, but on the property in `PlaylistEditorFromInit`.





/*:
 [Previous](@previous)  |  page 7 of 9  |  [Next: App Exercise - Picking the Path](@next)
 */
