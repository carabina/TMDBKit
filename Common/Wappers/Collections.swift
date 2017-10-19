//
//  Collections.swift
//  TMDBKit
//
//  Created by Siyuan Cao on 2017/10/19.
//  Copyright © 2017年 Siyuan Cao. All rights reserved.
//

import Foundation

extension TMDBManager {
    /// [Collections API](https://developers.themoviedb.org/3/collections) wrapper class.
    public class CollectionsAPIWrapper {
        /// Get collection details by id.
        ///
        /// - Parameters:
        ///   - collectionId: Collection's ID.
        ///   - language: Pass a ISO 639-1 value to display translated data for the fields that support it.
        ///     - minLength: 2
        ///     - pattern: ([a-z]{2})-([A-Z]{2})
        ///     - default: en-US
        ///   - completion: Completion handler.
        public func getDetails(collectionId: Int, language: String? = nil, completion: @escaping (ObjectReturn<TMDBCollection>) -> ()) {
            var query: [String: String] = [:]
            if let language = language {
                query["language"] = language
            }
            TMDBManager.shared.performRequest(path: "/collection/\(collectionId)", query: query, completion: completion)
        }
        
        /// Get the images for a collection by id.
        ///
        /// - Parameters:
        ///   - collectionId: Collection's ID.
        ///   - language: Pass a ISO 639-1 value to display translated data for the fields that support it.
        ///     - minLength: 2
        ///     - pattern: ([a-z]{2})-([A-Z]{2})
        ///     - default: en-US
        ///   - completion: Completion handler.
        public func getImages(collectionId: Int, language: String? = nil, completion: @escaping (ObjectReturn<TMDBImages>) -> ()) {
            var query: [String: String] = [:]
            if let language = language {
                query["language"] = language
            }
            TMDBManager.shared.performRequest(path: "/collection/\(collectionId)", query: query, completion: completion)
        }
    }
}