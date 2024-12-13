//
//  CharacterView.swift
//  RickAndMortyWorldWiki
//
//  Created by Радэль Зубаиров on 30.10.2024.
//

import SwiftUICore
import SwiftUI

struct CharacterView: View {
    var character: CharacterModel
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: character.image)) { image in
                image
                    .resizable()
            } placeholder: {
                    ProgressView()
                }
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.title)
                Text(character.species)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding(10)
        }
        .frame(width: 300, height: 350)
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(color: .primary.opacity(0.2), radius: 5, x: 2, y: 2)
    }
}
