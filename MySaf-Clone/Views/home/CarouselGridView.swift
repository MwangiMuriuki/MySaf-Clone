//
//  CarouselGridView.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 22/03/2024.
//

import SwiftUI

struct CarouselGridView: View {

    @EnvironmentObject var viewModel : HomeViewViewModel

    var body: some View {
        HStack{

            //MARK: - TabView Carousel
            TabView{
                ForEach(carouselPics, id: \.self) { item in
                    Image(item.name)
                        .resizable()
                        .scaledToFill()
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .automatic))
            .frame(height: 180)
            .shadow(radius: 2)
            .padding(.leading, 8)


            // MARK: Vertical Stack with first two selectible options
            LazyVStack(spacing: 8, content: {
                ForEach(viewModel.carouselCardItems, id: \.self){ item in
                    let pageType: PageType = PageType(rawValue: item.type)!
                    NavigationLink {
                        chooseDestination(pageType: pageType, pageTitle: item.name)
                    } label: {
                        HomeCardItemsView(model: item)
                    }
                }
            })
            .padding(.trailing, 8)
        }

        Spacer()

    }
}

#Preview {
    CarouselGridView()
        .environmentObject(HomeViewViewModel())
}

let carouselPics: [CarouselImageModel] = [
CarouselImageModel(name: "pic1"),
CarouselImageModel(name: "pic2"),
CarouselImageModel(name: "pic3"),
CarouselImageModel(name: "pic4"),
CarouselImageModel(name: "pic5"),
CarouselImageModel(name: "pic6")]

