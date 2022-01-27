//
//  ExternalWeblinkView.swift
//  Africa
//
//  Created by Егор Шереметов on 10.12.2021.
//

import SwiftUI

struct ExternalWeblinkView: View {
    
    // MARK: - PROPERTIES
    
    let animal: Animal
    
    // MARK: - BODY
    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Wiki")
                    .fontWeight(.bold)
                Spacer()
                Group {
                    Image(systemName: "arrow.up.right.square")
                    Link(animal.name, destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!)
                } //: GROUP
                .foregroundColor(.accentColor)
            } //: HSTACK
        } //: GROUPBOX
    }
}

// MARK: - PREVIEW
struct ExternalWeblinkView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWeblinkView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
