//
//  NetworkError.swift
//  AlbertsonsMobilityChallenge
//
//  Created by Osagie Obaze on 1/3/22.
//

import Foundation

enum NetworkError: Error, Equatable {
    case missingData
    case badServerResponse(Int)
    case badRequest
    case emptyResult
}
