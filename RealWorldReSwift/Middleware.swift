//
//  Middleware.swift
//  RealWorldReSwift
//
//  Created by Tobias Ottenweller on 01.04.18.
//  Copyright © 2018 Tobias Ottenweller. All rights reserved.
//

import ReSwift
import CoreLocation

func fetchPlaces(service: PlacesServing) -> SimpleMiddleware<AppState> {

    return { fetchPlaces(action: $0, context: $1, service: service) }
}

private func fetchPlaces(action: Action, context: MiddlewareContext<AppState>, service: PlacesServing) -> Action? {

    guard
        let placesAction = action as? PlacesAction,
        case .fetch = placesAction
    else {
        return action
    }

    let fakeCoordinates = CLLocationCoordinate2D(latitude: 52.520008, longitude: 13.404954)
    let radius = 2000.0

    service.search(coordinates: fakeCoordinates, radius: radius) { result in
        guard let places = result.value else {
            return
        }

        DispatchQueue.main.async {
            let action = PlacesAction.set(places)
            context.dispatch(action)
        }
    }

    return nil
}
