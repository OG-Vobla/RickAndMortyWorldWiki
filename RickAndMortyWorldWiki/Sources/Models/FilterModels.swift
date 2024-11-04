//
//  FilterModels.swift
//  RickAndMortyWorldWiki
//
//  Created by Радэль Зубаиров on 31.10.2024.
//

struct Filter: Hashable {
    var filterName: String
    var filterSelected: String?
}

protocol FilterProtocol {
    static var filterName: String { get }
    static var filterVariants: [String] { get }
}

class GenderFilter : FilterProtocol {
    static var filterName: String = "Gender"
    static var filterVariants: [String] = [
        "Male",
        "Female",
        "Genderless",
        "Unknown"
    ]
}

class SpeciesFilter : FilterProtocol {
    static var filterName: String = "Species"
    static var filterVariants: [String] = [
        "Human",
        "Humanoid",
        "Poopybutthole",
        "Alien",
        "Unknown"
    ]
}

class StatusFilter : FilterProtocol {
    static var filterName: String = "Status"
    static var filterVariants: [String] = [
        "Alive",
        "Dead",
        "Unknown"
    ]
}
