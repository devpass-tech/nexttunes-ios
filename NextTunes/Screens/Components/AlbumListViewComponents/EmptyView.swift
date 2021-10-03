//
//  EmptyView.swift
//  NextTunes
//
//  Created by Diego Llopis on 14/09/21.
//

import SwiftUI

struct EmptyView: View {
    
    let title: String
    let subTitle: String
    let buttonTitle: String
    let action:() -> Void
    
    init(title: String = "No albums in here",
         subTitle: String = "Search for artists or albuns and add them to your Next Tunes List!",
         buttonTitle: String = "Search albums",
         action: @escaping() -> Void)
    {
        self.title = title
        self.subTitle = subTitle
        self.buttonTitle = buttonTitle
        self.action = action
    }
    
    var body: some View {
        VStack {
            Text(self.title)
                .font(.headline)
            
            Text(self.subTitle)
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 16)
                .padding(16)
            
            Button(action: action, label: {
                Text(buttonTitle)
                    .font(.headline)
                    .bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(16)
            })
            .frame(maxWidth: .infinity)
            .background(Color.init(red: 30/255, green: 215/255, blue: 96/255))
            .cornerRadius(14)
        }
        .padding()
    }
}

struct EmptyView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            EmptyView(action:{})
            .navigationTitle("Next Tunes")
            .navigationBarItems(
                trailing:
                    NavigationLink("Search",
                    destination: Text("Teste"))
            )
        }
    }
}
