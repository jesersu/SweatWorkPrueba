//
//  DataFetchPhase.swift
//  pruebaJesus
//
//  Created by Jesus Ervin Chapi Suyo on 10/31/21.
//  Copyright © 2024 Jesus Ervin Chapi Suyo. All rights reserved.
//

import Foundation

enum DataFetchPhase<V> {
    
    case empty
    case success(V)
    case failure(Error)
    
    var value: V? {
        if case .success(let value) = self {
            return value
        }
        return nil
    }
    
}
