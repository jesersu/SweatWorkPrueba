//
//  LoadingView.swift
//  pruebaJesus
//
//  Created by Jesus Ervin Chapi Suyo on 13/09/24.
//  Copyright © 2024 Jesus Ervin Chapi Suyo. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    
    let isLoading: Bool
    let error: NSError?
    let retryAction: (() -> ())?
    
    var body: some View {
        Group {
            if isLoading {
                HStack {
                    Spacer()
                    ActivityIndicatorView()
                    Spacer()
                }
            } else if error != nil {
                HStack {
                    Spacer()
                    VStack(spacing: 4) {
                        Text(error!.localizedDescription).font(.headline)
                        if self.retryAction != nil {
                            Button(action: self.retryAction!) {
                                Text("Retry")
                            }
                            .foregroundColor(Color.blue)
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView(isLoading: true, error: nil, retryAction: nil)
    }
}
