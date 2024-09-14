//
//  GridView.swift
//  pruebaJesus
//
//  Created by Jesus Ervin Chapi Suyo on 13/09/24.
//  Copyright © 2024 Jesus Chapi. All rights reserved.
//

import SwiftUI

struct GridView : View{
   ///View Properties
    @State private var selectedTab: MovieListEndpoint?
    @Environment(\.colorScheme) private var scheme
    ///taop progress
    @State private var tabProgress: CGFloat = 0
    ///Select only .nowPlaying, .upcoming, .topRated to show in gridView
    let selectedFeatures: [MovieListEndpoint] = [.nowPlaying, .upcoming, .topRated]
    
    ///
    let movieSections : [MovieSection]
   
    
    var body: some View {
        VStack(spacing: 15){
            CustomTabBar()
            
            /// Paging View using iOS 17 APIs
            GeometryReader {
                let size = $0.size
                ScrollView(.horizontal){
                    LazyHStack(spacing:0){
                        if !movieSections.isEmpty{

                            SampleView(movieSections[1].movies)
                                .id(MovieListEndpoint.nowPlaying)
                                .containerRelativeFrame(.horizontal)
                            SampleView(movieSections[2].movies)
                                .id(MovieListEndpoint.upcoming)
                                .containerRelativeFrame(.horizontal)
                            SampleView(movieSections[3].movies)
                                .id(MovieListEndpoint.topRated)
                                .containerRelativeFrame(.horizontal)
                        }
                    }
                    .scrollTargetLayout()
                    .offSetX { value in
                        ///Convertir offset into progress
                        let progress = -value / (size.width * CGFloat((MovieListEndpoint.allCases.count - 1)-1))
                        ///Capping progress BTW 0-1
                        tabProgress = max(min(progress, 1), 0)
                    }
                    
                }
                .scrollPosition(id: $selectedTab)
                .scrollIndicators(.hidden)
                .scrollTargetBehavior(.paging)
                .scrollClipDisabled()
                
            }
        }
        //.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .frame(height: 380)
       
    }
    
    @ViewBuilder
    func CustomTabBar() -> some View {
        HStack(spacing: 0){
            ForEach(selectedFeatures, id: \.rawValue){tab in
                HStack(spacing: 10){
                    Text(tab.description)
                        .font(.callout)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .contentShape(.capsule)
                .onTapGesture {
                    ///Updating tab
                    withAnimation(.snappy){
                        selectedTab = tab
                    }
                }
            }
        }
        .tabMask(tabProgress)
        
        .background{
            GeometryReader{
                let size = $0.size
                let capsuleWidth = size.width / CGFloat(MovieListEndpoint.allCases.count - 1)
                Capsule()
                    .fill(scheme == .dark ? .black : .white)
                    .frame(width: capsuleWidth)
                    .offset(x: tabProgress * (size.width - capsuleWidth))
            }
        }
        .padding(.horizontal, 15)
    }
    
    ///Card
    ///
    @ViewBuilder
    func SampleView(_ movie: [Movie]) -> some View {
       
            LazyVGrid(columns: Array(repeating: GridItem(), count: 3), content: {
                ForEach(movie.prefix(6)) { movie in
                    NavigationLink(destination: MovieDetailView(movieId: movie.id, movieTitle: movie.title)) {
                        GridImageView(movie: movie)
                            .frame(height: 150)
                    }.buttonStyle(.plain)
                }
            } )
            .padding(15)
    }
}


struct GridThumbnailCard : View{
    let movies : [Movie]

    var body: some View{
        ScrollView(.vertical) {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 3), content: {
                ForEach(movies.suffix(6)) {
                    
                    GridImageView(movie: $0)
                }
            } )
            .padding(15)
        }
        .scrollIndicators(.hidden)
        .scrollClipDisabled()
        .mask{
            Rectangle()
                .padding(.bottom, -100)
        }
    }
}

struct GridImageView: View {
    let movie : Movie
    var thumbnailType: MovieThumbnailType = .poster()
    @StateObject var imageLoader = ImageLoader()
    
    var body: some View{
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

#Preview{
    ContentView()
}
