//
//  Session.swift
//  AlbertsonsMobilityChallenge
//
//  Created by Osagie Obaze on 1/3/22.
//

import Foundation

protocol Session {
    func requestData(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: Session {
    
    func requestData(request: URLRequest, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        
        self.dataTask(with: request) { data, response, error in
            completion(data, response, error)
        }.resume()
    }
    
    
}
