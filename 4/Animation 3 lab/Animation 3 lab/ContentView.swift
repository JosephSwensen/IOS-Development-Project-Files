import SwiftUI

struct ContentView: View {
    @State var likes = 0
    @State var isLarge = false
    @State var isAnimating = false
    @Namespace var zoom

    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Image(systemName: "heart.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(.pink)
                    // symbolEffect: bounce the heart when a like is added.
                    .symbolEffect(.bounce, value: likes)

                Text("Likes: \(likes)")
                    .font(.largeTitle)
                    .scaleEffect(isLarge ? 1.3 : 1)

                Button("Like") {
                    likes += 1
                    isAnimating = true
                    //  withAnimation +  spring: make the count pop.
                    // completion: shrink it after growing to finish the animation.
                    withAnimation(.spring(duration: 0.3)) {
                        isLarge = true
                    } completion: {
                        // withAnimation: smoothly return the count to normal.
                        withAnimation(.easeOut(duration: 0.2)) {
                            isLarge = false
                        } completion: {
                            isAnimating = false
                        }
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(.pink)
                .disabled(isAnimating)

                NavigationLink {
                    Text("You gave \(likes) likes!")
                        .font(.largeTitle)
                        .navigationTitle("Your Likes")
                        // zoom: expand the link into the total screen.
                        .navigationTransition(.zoom(sourceID: "total", in: zoom))
                } label: {
                    Text("See Total")
                        .padding()
                        .background(.pink.opacity(0.15), in: RoundedRectangle(cornerRadius: 12))
                        // matchedTransitionSource: give the zoom a starting point.
                        .matchedTransitionSource(id: "total", in: zoom)
                }
            }
            .padding()
            .navigationTitle("Like Counter")
        }
    }
}

#Preview {
    ContentView()
}
