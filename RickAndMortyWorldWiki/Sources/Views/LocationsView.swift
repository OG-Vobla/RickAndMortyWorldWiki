//
//  LocationsView.swift
//  RickAndMortyWorldWiki
//
//  Created by Радэль Зубаиров on 11.12.2024.
//

import SwiftUICore
import SwiftUI

struct LocationsView: View {
    @ObservedObject private var locationViewModel: LocationViewModel = LocationViewModel()
    @State private var showingCredits: Bool = false
    @State private var selectedLocation: LocationInfoModel?
    
    var body: some View {
        HStack {
            Button("<") {
                locationViewModel.backPage()
            }
            Text("\(locationViewModel.page)")
            Button(">") {
                locationViewModel.nextPage()
            }
        }
        .frame(alignment: .top)
        VStack {
            ZStack(alignment: .top) {
                if locationViewModel.isLoading {
                    ProgressView()
                }
                else {
                    if locationViewModel.locations == nil {
                        Text("No locations yet")
                    }
                    else if locationViewModel.errorMessage != nil {
                        Text(locationViewModel.errorMessage!.localizedDescription)
                    }
                    else {
                        ScrollView {
                            VStack (spacing: 50) {
                                ForEach(locationViewModel.locations ?? [], id: \.id) { location in
                                    LocationView(location: location)
                                    .onTapGesture {
                                        selectedLocation = location
                                        showingCredits.toggle()
                                    }
                                    .sheet(isPresented: $showingCredits) {
                                        if let selectedLocation = selectedLocation {
                                            LocationInformationView(location: selectedLocation)
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
                locationViewModel.fetchLocations()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}
