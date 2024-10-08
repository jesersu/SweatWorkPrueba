//
//  MoviePosterCard.swift
//  pruebaJesus
//
//  Created by Jesus Ervin Chapi Suyo on 13/09/24.
//  Copyright © 2024 Jesus Ervin Chapi Suyo. All rights reserved.
//

import SwiftUI

enum MovieThumbnailType {
    case poster(showTitle: Bool = true)
    case backdrop
    case gridView
}

struct MovieThumbnailView: View {
    
    let movie: Movie
    var thumbnailType: MovieThumbnailType = .poster()
    @StateObject var imageLoader = ImageLoader()
    
    var body: some View {
        containerView
        .onAppear {
            switch thumbnailType {
            case .poster:
                imageLoader.loadImage(with: movie.posterURL)
            case .backdrop:
                imageLoader.loadImage(with: movie.backdropURL)
            case .gridView:
                imageLoader.loadImage(with: movie.posterURL)
            }
        }
    }
    
    @ViewBuilder
    private var containerView: some View {
        if case .backdrop = thumbnailType {
            VStack(alignment: .leading, spacing: 8) {
                imageView
                Text(movie.title)
                    .font(.headline)
                    .lineLimit(1)
            }
        } else {
            imageView
        }
    }
    
    private var imageView: some View {
        ZStack {
            Color.gray.opacity(0.3)
            
            if case .poster(let showTitle) = thumbnailType, showTitle {
                Text(movie.title)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .lineLimit(4)
            }
            
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .layoutPriority(-1)
            }
        }
        .cornerRadius(8)
        .shadow(radius: 4)
    }
}

struct MoviePosterCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieThumbnailView(movie: Movie.stubbedMovie, thumbnailType: .poster(showTitle: true))
                .frame(width: 204, height: 306)
            
            MovieThumbnailView(movie: Movie.stubbedMovie, thumbnailType: .backdrop)
                .aspectRatio(16/9, contentMode: .fit)
                .frame(height: 160)
        }
    }
}
