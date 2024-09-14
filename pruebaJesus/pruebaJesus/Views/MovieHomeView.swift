//
//  MovieListView.swift
//  pruebaJesus
//
//  Created by Jesus Ervin Chapi Suyo on 22/05/20.
//  Copyright © 2024 Jesus Ervin Chapi Suyo. All rights reserved.
//

import SwiftUI

struct MovieHomeView: View {
    
    @StateObject private var movieHomeState = MovieHomeState()
    
    var body: some View {
 
        List {
                MovieThumbnailCarouselView(
                    title: movieHomeState.sections.first?.title ?? "",
                    movies: movieHomeState.sections.first?.movies ?? [],
                    thumbnailType: movieHomeState.sections.first?.thumbnailType ?? .poster(showTitle: false))
                
                GridView(movieSections: movieHomeState.sections)
        }

        .task {
            loadMovies(invalidateCache: false) }
        .refreshable {
            loadMovies(invalidateCache: true) }
        .overlay(DataFetchPhaseOverlayView(
            phase: movieHomeState.phase,
            retryAction: { loadMovies(invalidateCache: true) })
        )
        .listStyle(.plain)
        .navigationTitle("What do you want to watch?")
        .navigationBarTitleDisplayMode(.inline)
       
    }
    
    @Sendable
    private func loadMovies(invalidateCache: Bool) {
        Task { await movieHomeState.loadMoviesFromAllEndpoints(invalidateCache: invalidateCache) }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MovieHomeView()
        }
    }
}

