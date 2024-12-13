//
//  EpisodesView.swift
//  RickAndMortyWorldWiki
//
//  Created by Радэль Зубаиров on 13.12.2024.
//

import SwiftUICore
import SwiftUI

struct EpisodesView: View {
    @ObservedObject private var episodeViewModel: EpisodeViewModel = EpisodeViewModel()
    @State private var showingCredits: Bool = false
    @State private var selectedEpisode: EpisodeModel?
    
    var body: some View {
        HStack {
            Button("<") {
                episodeViewModel.backPage()
            }
            Text("\(episodeViewModel.page)")
            Button(">") {
                episodeViewModel.nextPage()
            }
        }
        .frame(alignment: .top)
        VStack {
            ZStack(alignment: .top) {
                if episodeViewModel.isLoading {
                    ProgressView()
                }
                else {
                    if episodeViewModel.episodes == nil {
                        Text("No locations yet")
                    }
                    else if episodeViewModel.errorMessage != nil {
                        Text(episodeViewModel.errorMessage!.localizedDescription)
                    }
                    else {
                        ScrollView {
                            VStack (spacing: 50) {
                                ForEach(episodeViewModel.episodes ?? [], id: \.id) { episode in
                                    EpisodeView(episode: episode)
                                    .onTapGesture {
                                        selectedEpisode = episode
                                        showingCredits.toggle()
                                    }
                                    .sheet(isPresented: $showingCredits) {
                                        if let selectedEpisode = selectedEpisode {
                                            EpisodeInformationView(episode: selectedEpisode)
                                        }
                                    }
                                }
                            }
                            .padding(10)
                        }
                    }
                }
            }
            .onAppear() {
                episodeViewModel.fetchEpisodes()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}
