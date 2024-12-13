//
//  CharacterModel.swift
//  RickAndMortyWorldWiki
//
//  Created by Радэль Зубаиров on 29.10.2024.
//
struct CharacterModel: Identifiable, Decodable{
    var id: Int
    var name: String
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: LocationModel
    var location: LocationModel
    var image: String
    var episode: [String]
}
