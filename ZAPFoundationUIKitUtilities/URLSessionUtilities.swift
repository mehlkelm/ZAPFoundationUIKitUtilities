//
//  URLSessionUtilities.swift
//  ZAPFoundationUIKitUtilities
//
//  Created by Stefan Pauwels on 13.05.19.
//  Copyright © 2019 Zozi Apps. All rights reserved.
//

import Foundation

extension URLSession {
    public func execute(request: URLRequest?, fail: @escaping (Error) -> Void, completion: ((Data, HTTPURLResponse) -> Void)? = nil) {
        guard let request = request else {
            fail(NSError.couldNotCreateRequest)
            return
        }
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data, let urlResponse = response as? HTTPURLResponse else {
                    fail(NSError.invalidResponse)
                    return
                }
                guard urlResponse.statusCode < 500 else {
                    fail(NSError.serverError)
                    return
                }
                guard urlResponse.statusCode < 400 else {
                    fail(NSError.accessDenied)
                    return
                }
                completion?(data, urlResponse)
            }
            }.resume()
    }
    
    public func execute<kT, vT>(request: URLRequest?, fail: @escaping (Error) -> Void, completion: @escaping ([kT: vT], HTTPURLResponse) -> Void) {
        execute(request: request, fail: fail) { (data: Data, response: HTTPURLResponse) in
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                if let dict = jsonObject as? [kT: vT] {
                    completion(dict, response)
                } else {
                    fail(NSError.invalidResponse)
                }
            } catch {
                fail(error)
            }
        }
    }
    
    public func execute<T>(request: URLRequest?, fail: @escaping (Error) -> Void, completion: @escaping ([T], HTTPURLResponse) -> Void) {
        execute(request: request, fail: fail) { (data: Data, response: HTTPURLResponse) in
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                if let array = jsonObject as? [T] {
                    completion(array, response)
                } else {
                    fail(NSError.invalidResponse)
                }
            } catch {
                fail(error)
            }
        }
    }
}

extension NSError {
    public static let internalError = NSError(domain: "ZAPURLSession", code: 0, userInfo: [NSLocalizedDescriptionKey: "Internal account error!"])
    public static let couldNotCreateRequest = NSError(domain: "ZAPURLSession", code: 2, userInfo: [NSLocalizedDescriptionKey: "Could not create request!"])
    public static let accessDenied = NSError(domain: "ZAPURLSession", code: 3, userInfo: [NSLocalizedDescriptionKey: "Access denied!"])
    public static let invalidResponse = NSError(domain: "ZAPURLSession", code: 4, userInfo: [NSLocalizedDescriptionKey: "Invalid response from server!"])
    public static let serverError = NSError(domain: "ZAPURLSession", code: 6, userInfo: [NSLocalizedDescriptionKey: "Server error!"])
}
