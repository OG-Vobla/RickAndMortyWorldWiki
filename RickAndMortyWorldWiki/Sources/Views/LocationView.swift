//
//  LocationView.swift
//  RickAndMortyWorldWiki
//
//  Created by Радэль Зубаиров on 13.12.2024.
//

import SwiftUICore
import SwiftUI

struct LocationView: View {
    var location: LocationInfoModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(location.name)
                .font(.title)
            Text(location.type)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .padding(10)
        .frame(width: 300, height: 150)
        .background(Color(.systemBackground))
        .cornerRadius(15)
        .shadow(color: .primary.opacity(0.2), radius: 5, x: 2, y: 2)
    }
}
