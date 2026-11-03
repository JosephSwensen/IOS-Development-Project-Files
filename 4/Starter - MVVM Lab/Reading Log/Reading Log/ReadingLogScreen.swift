//  This app works, but every piece of it lives in this one file.
//  Over the three MVVM labs you will pull it apart into a Model,
//  a View and a ViewModel. Read the lab for tonight's steps.
//

import SwiftUI

struct ReadingLogScreen: View {
    @State private var viewModel = ReadingLogViewModel()

    @State private var newTitle = ""
    @State private var newAuthor = ""
    @State private var newPageCount = 0

    var body: some View {
        NavigationStack {
            List {
                Section("Stats") {
                    ReadingStatsView(viewModel: viewModel)
                }

                Section("Add a Book") {
                    // NewBookFields would take bindings to edit the parent view’s input values, which are not stored in the ViewModel.
                    TextField("Title", text: $newTitle)
                    TextField("Author", text: $newAuthor)
                    Stepper("Pages: \(newPageCount)", value: $newPageCount, in: 0...2000, step: 10)
                    // model. it just sets imformation
                    Button("Add Book") {
                        viewModel.addBook(title: newTitle, author: newAuthor, pageCount: newPageCount)
                        newTitle = ""
                        newAuthor = ""
                        newPageCount = 0
                    }
                    .disabled(!viewModel.canAdd(title: newTitle, author: newAuthor, pageCount: newPageCount))
                }

                Section("Currently Reading") {
                    // only works with the imformation
                    ForEach(viewModel.currentlyReading) { book in
                        // viewModel. it uses the imformation to create the views
                        HStack {
                            VStack(alignment: .leading) {
                                Text(book.title)
                                // VIEW: this only decides how the title looks.
                                    .font(.headline)
                                Text("\(book.author) - \(book.pageCount) pages")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                            Spacer()
                            // model. it just sets imformation
                            Button("Finish") {
                                viewModel.markFinished(book)
                            }
                            .buttonStyle(.bordered)
                        }
                    }
                }

                Section("Finished") {
                    ForEach(viewModel.finishedBooks) { book in
                        VStack(alignment: .leading) {
                            Text(book.title)
                                .font(.headline)
                            Text("\(book.author) - \(book.pageCount) pages")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            // VIEW: this only decides what the title is.
            .navigationTitle("Reading Log")
        }
    }
}

#Preview {
    ReadingLogScreen()
}


// there are 3 places. if it changes I would have to fix 3 things.

// I would change line 41 to include the number of book I am still reading. no they would no have to touch those same lines.

// they should open the file they need to work on with out MVVM they could change code that dose not work with the code the other person has worked on.

// It makes it easy to change becasue it will take less time to find data.

// a title. so the user can add one, page count so the user can change how many pages they have read, author, is finished yes or no for the function that checks the if the book is done or not, id it can make a identifiable list.
// it should have a function that checks if a book is finished or not
// averagePagesPerBook: ViewModel, because it calculates a value from book data.
// .foregroundStyle(.secondary): View, because it controls how something looks.
// isLongBook(_:): ViewModel, because it checks a rule about a book's page count.
// searchText: View, because it holds what the user is typing into a search bar.
// showingAddBookSheet: View, because it tracks whether a sheet is open.
// Text(book.author): View, because it displays the author's name.

