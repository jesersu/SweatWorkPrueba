//
//  MoviePosterCarouselView.swift
//  pruebaJesus
//
//  Created by Jesus Ervin Chapi Suyo on 13/09/24.
//  Copyright © 2024 Jesus Ervin Chapi Suyo. All rights reserved.
//

import SwiftUI

struct MovieThumbnailCarouselView: View {
    
    let title: String
    let movies: [Movie]
    var thumbnailType: MovieThumbnailType = .poster()
    
    var body: some View {
        ZStack{
            VStack(alignment: .leading, spacing: 16) {
                Text(title)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                    .foregroundColor(Color.theme.text)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(alignment: .top, spacing: 16) {
                        ForEach(self.movies) { movie in
                            NavigationLink(destination: MovieDetailView(movieId: movie.id, movieTitle: movie.title)) {
                                MovieThumbnailView(movie: movie, thumbnailType: thumbnailType)
                                    .movieThumbnailViewFrame(thumbnailType: thumbnailType)
                            }.buttonStyle(.plain)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
            }
        }
 
        
    }
}

fileprivate extension View {
    
    @ViewBuilder
    func movieThumbnailViewFrame(thumbnailType: MovieThumbnailType) -> some View {
        switch thumbnailType {
        case .poster:
            self.frame(width: 150, height: 280)
        case .backdrop:
            self
                .aspectRatio(16/9, contentMode: .fit)
                .frame(height: 160)
        case .gridView:
            self.frame(width: 100, height: 250)
        }
    }
    
}


struct MoviePosterCarouselView_Previews: PreviewProvider {
    
    static let stubbedMovies = Movie.stubbedMovies
    
    static var previews: some View {
        Group {
            MovieThumbnailCarouselView(title: "Now Playing", movies: stubbedMovies, thumbnailType: .poster(showTitle: true))
            
            MovieThumbnailCarouselView(title: "Upcoming", movies: stubbedMovies, thumbnailType: .backdrop)
        }
        
    }
}
