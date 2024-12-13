//
//  EpisodeModel.swift
//  RickAndMortyWorldWiki
//
//  Created by Радэль Зубаиров on 11.12.2024.
//
struct EpisodeModel: Identifiable, Decodable{
    var id: Int
    var name: String
    var air_date: String
    var episode: String
    var characters: [String]
    var url: String
    var created: String
}
