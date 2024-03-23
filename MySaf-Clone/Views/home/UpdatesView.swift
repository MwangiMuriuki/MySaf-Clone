//
//  UpdatesView.swift
//  MySaf-Clone
//
//  Created by Ernest Mwangi on 22/03/2024.
//

import SwiftUI

struct UpdatesView: View {
    var body: some View {
        HStack{
            ScrollView(.horizontal) {
                LazyHStack(alignment: .center, spacing: 15, content: {
                    ForEach(statusPics, id: \.self) { count in
                        ZStack{

                            Image(count.name)
                                .resizable()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())

                            RoundedRectangle(cornerRadius: 40, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/)
                                .strokeBorder(style: .init(lineWidth: 2))
                                .foregroundStyle(.primaryGreen)
                                .frame(width: 80, height: 80)
                                .overlay(
                                    Image(systemName: "person.fill")
                                )

                        }
                    }
                })
            }
            .springLoadingBehavior(.disabled)
            .padding(8)
        }
    }
}

#Preview {
    UpdatesView()
}

let statusPics: [UpdatesImageModel] = [
    UpdatesImageModel(name: "status1"),
    UpdatesImageModel(name: "status2"),
    UpdatesImageModel(name: "status3"),
    UpdatesImageModel(name: "status4"),
    UpdatesImageModel(name: "status5")
]
