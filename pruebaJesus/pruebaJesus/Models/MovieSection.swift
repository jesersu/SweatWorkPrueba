//
//  MovieSection.swift
//  pruebaJesus
//
//  Created by Jesus Ervin Chapi Suyo on 10/31/21.
//  Copyright © 2024 Jesus Ervin Chapi Suyo. All rights reserved.
//

import Foundation

struct MovieSection: Identifiable {
    
    let id = UUID()
    
    let movies: [Movie]
    let endpoint: MovieListEndpoint
    var title: String {
        endpoint.description
    }
    
    var thumbnailType: MovieThumbnailType {
        endpoint.thumbnailType
    }
}

fileprivate extension MovieListEndpoint {
    
    var thumbnailType: MovieThumbnailType {
        switch self {
        case .popular:
            return .poster()
        default:
            return .backdrop
        }
    }
    
}
