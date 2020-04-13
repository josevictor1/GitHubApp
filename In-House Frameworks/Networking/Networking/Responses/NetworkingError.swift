//
//  NetworkingError.swift
//  Networking
//
//  Created by José Victor Pereira Costa on 02/04/20.
//  Copyright © 2020 José Victor Pereira Costa. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
    case invalidURL
    case unknown
    case parseHTTPResponseFail
    case encoding(_ error: Error)
    case redirection(_ error: Error, response: NetworkingResponse?)
    case server(_ error: Error, response: NetworkingResponse?)
    case client(_ error: Error, response: NetworkingResponse?)
}
