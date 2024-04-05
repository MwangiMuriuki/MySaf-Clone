//
//  EditFavouritesView.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 05/04/2024.
//

import SwiftUI

struct EditFavouritesView: View {

    @StateObject var viewModel = FavouritesViewModel()

    var body: some View {

        VStack(content: {
            List {
                var favouritesListData = viewModel.favouritesListData
                var savedFavouritesList = viewModel.savedFavourites
                var otherFavouritesList = viewModel.otherFavourites

                Section{
                    ForEach(savedFavouritesList, id: \.self) { item in
                        EditFavouritesSingleListItem(model: item)
                    }
                    .onDelete {
                        savedFavouritesList.remove(atOffsets: $0)
                    }
                    .onMove { favouritesListData.move(fromOffsets: $0, toOffset: $1) }

                }header: {
                    VStack(alignment: .leading, spacing: 10, content: {
                        Text("Kindly note that:")
                            .font(.custom("AvenirNext-Bold", size: 12))
                            .foregroundStyle(Color.secondaryText)


                        Text("Only the first five will be dispalyed on the quick action menu button.")
                            .font(.custom("AvenirNext-Medium", size: 12))
                            .foregroundStyle(Color.secondaryText)
                    })

                }
                .listRowSeparator(.hidden)

                Section{

                    ForEach(otherFavouritesList, id: \.self) { item in
                        EditFavouritesSingleListItem(model: item)
                    }

                    .onMove { favouritesListData.move(fromOffsets: $0, toOffset: $1) }

                }header: {
                    VStack(alignment: .leading, spacing: 10, content: {
                        Text("More Shortcuts:")
                            .font(.custom("AvenirNext-Bold", size: 12))
                            .foregroundStyle(Color.secondaryText)


                        Text("Select Shortcut to add to your quick action menu button.")
                            .font(.custom("AvenirNext-Medium", size: 12))
                            .foregroundStyle(Color.secondaryText)
                    })
                    
                }
                .listRowSeparator(.hidden)
            }
            .navigationTitle("Edit Favourites")
            .listStyle(.plain)
            .listRowSpacing(2)
            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 10))
            .environment(\.defaultMinListRowHeight, 40)


        })
        .onAppear(perform: {
            viewModel.fetchFavouritesListings()
        })
    }
}

#Preview {
    EditFavouritesView()
}
