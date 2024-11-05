//
//  CharacterInformationView.swift
//  RickAndMortyWorldWiki
//
//  Created by Радэль Зубаиров on 04.11.2024.
//

import SwiftUICore
import SwiftUI

struct CharacterInformationView: View {
    var character: CharacterModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center) {
                VStack {
                    AsyncImage(url: URL(string: character.image)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.secondary.opacity(0.3), lineWidth: 10))
                    } placeholder: {
                        ProgressView()
                    }
                }
                .frame(height: 200)
                .padding(30)
                Text(character.name)
                    .font(.largeTitle)
                VStack {
                    HStack {
                        Text("Informations")
                            .font(.title2.weight(.medium))
                            .foregroundColor(.primary.opacity(0.5))
                        Spacer()
                    }
                    .padding()
                    List {
                        Section(header: Text("Status")) {
                            Text(character.status)
                        }
                        Section(header: Text("Specie")) {
                            Text(character.species)
                        }
                        Section(header: Text("Origin")) {
                            Text(character.origin.name)
                        }
                        Section(header: Text("Type")) {
                            Text(character.type)
                        }
                        Section(header: Text("Location")) {
                            Text(character.location.name)
                        }
                    }
                }
                .frame(height: 400)
                VStack {
                    HStack {
                        Text("Episodes")
                            .font(.title2.weight(.medium))
                            .foregroundColor(.primary.opacity(0.5))
                        Spacer()
                    }
                    .padding()
                    List {
                        ForEach(character.episode, id: \.self) { episode in
                            Section(header: Text(episode)) {
                                Text(episode)
                            }
                        }
                    }
                }
                .frame(height: 400)
            }
        }
    }
}

#Preview {
    CharacterInformationView(character: CharacterModel(id: 1, name: "Rick Sanchez", status: "alive", species: "Human", type: "Unknown", gender: "Male", origin: LocationModel(name: "Testicle Monster Dimension", url: "https://rickandmortyapi.com/api/location/21"), location: LocationModel(name: "Testicle Monster Dimension", url: "https://rickandmortyapi.com/api/location/21"), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: ["https://rickandmortyapi.com/api/episode/1","https://rickandmortyapi.com/api/episode/2","https://rickandmortyapi.com/api/episode/3","https://rickandmortyapi.com/api/episode/4","https://rickandmortyapi.com/api/episode/5","https://rickandmortyapi.com/api/episode/6","https://rickandmortyapi.com/api/episode/7","https://rickandmortyapi.com/api/episode/8","https://rickandmortyapi.com/api/episode/9","https://rickandmortyapi.com/api/episode/10","https://rickandmortyapi.com/api/episode/11","https://rickandmortyapi.com/api/episode/12","https://rickandmortyapi.com/api/episode/13","https://rickandmortyapi.com/api/episode/14"]))
}
