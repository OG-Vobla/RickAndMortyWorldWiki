//
//  EpisodeView.swift
//  RickAndMortyWorldWiki
//
//  Created by Радэль Зубаиров on 13.12.2024.
//

import SwiftUICore
import SwiftUI

struct EpisodeView: View {
    var episode: EpisodeModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(episode.name)
                .font(.title)
            Text(episode.episode)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Text(episode.air_date)
                .font(.title3)
                .foregroundStyle(.secondary)
        }
        .padding(10)
        .frame(width: 300, height: 150)
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(color: .primary.opacity(0.2), radius: 5, x: 2, y: 2)
    }
}
