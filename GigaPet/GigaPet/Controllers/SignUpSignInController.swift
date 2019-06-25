//
//  SignUpSignInController.swift
//  GigaPet Wire Frame
//
//  Created by Jake Connerly on 6/24/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import Foundation

//
// MARK: - HTTPMethod & Error enums
//

//added enum for HTTPMethod to prevent errors in request type
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

enum NetWorkError: Error {
    case noAuth
    case badAuth
    case otherError
    case badData
    case noDecode
}

//
// MARK: - Beginning of SignUpSignInController Class
//

class SignUpSignInController {
    
    //
    //MARK: - Properties
    //
    
    private let baseUrl = URL(string: "ADDED PLACEHOLDER")
    var bearer: Bearer?
    
    //
    // MARK: - SignUp Function
    //
    
    func signUp(with user: User, completion: @escaping (Error?) -> ()) {
        guard let signUpUrl = baseUrl?.appendingPathComponent("") else { return }
        
        var request = URLRequest(url: signUpUrl)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("ADDED PLACEHOLDER", forHTTPHeaderField: "ADDED PLACEHOLDER")
        
        let jsonEncoder = JSONEncoder()
        do {
            let jsonData = try jsonEncoder.encode(user)
            request.httpBody = jsonData
        }catch {
            print("Error encoding user Object: \(error)")
            completion(error)
            return
        }
        
        URLSession.shared.dataTask(with: request) { _, response, error in
            if let response = response as? HTTPURLResponse,
                response.statusCode != 200 {
                completion(NSError(domain: "", code: response.statusCode, userInfo: nil))
                return
            }
            if let error = error {
                completion(error)
                return
            }
            completion(nil)
            }.resume()
    }
    
}
