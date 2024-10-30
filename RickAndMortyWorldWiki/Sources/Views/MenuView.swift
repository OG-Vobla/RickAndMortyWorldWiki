//
//  MenuView.swift
//  RickAndMortyWorldWiki
//
//  Created by Радэль Зубаиров on 29.10.2024.
//

import SwiftUICore
import SwiftUI

struct MenuView: View {
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 50) {
                NavigationLink {
                    
                } label: {
                    Text("Characters")
                }
                NavigationLink {
                    
                } label: {
                    Text("Locations")
                }
                NavigationLink {
                    
                } label: {
                    Text("Episodes")
                }
                Spacer()
            }
            .font(.system(size: 24, weight: .medium))
            .foregroundColor(.primary)
            .padding(60)
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}