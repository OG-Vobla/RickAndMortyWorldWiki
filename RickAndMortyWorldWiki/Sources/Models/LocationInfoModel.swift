//
//  LocationModel.swift
//  RickAndMortyWorldWiki
//
//  Created by Радэль Зубаиров on 12.12.2024.
//

struct LocationInfoModel: Decodable {
    var id: Int
    var name: String
    var type: String
    var dimension: String
    var residents: [String]
    var url: String
    var created: String
}
