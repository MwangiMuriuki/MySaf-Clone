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
                    ForEach(1...4, id: \.self) { count in
                        ZStack{
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
