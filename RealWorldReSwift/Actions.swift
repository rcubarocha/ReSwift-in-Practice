//
//  Actions.swift
//  RealWorldReSwift
//
//  Created by Tobias Ottenweller on 30.03.18.
//  Copyright © 2018 Tobias Ottenweller. All rights reserved.
//

import Foundation
import CoreLocation
import ReSwift

enum PlacesAction: Action {
    case fetch
    case set(PlacesSearchResult)
}