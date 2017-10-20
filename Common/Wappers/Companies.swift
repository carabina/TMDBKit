//
//  Companies.swift
//  TMDBKit
//
//  Created by Siyuan Cao on 2017/10/19.
//  Copyright © 2017年 Siyuan Cao. All rights reserved.
//

import Foundation

extension TMDBManager {
    /// [Companies API](https://developers.themoviedb.org/3/companies) wrapper class.
    public class CompaniesAPIWrapper {
        /// Get a companies details by id.
        ///
        /// - Parameters:
        ///   - companyId: The company's ID.
        ///   - completion: Completion handler.
        public func getDetails(companyId: Int, completion: @escaping (ObjectReturn<TMDBCompany>) -> ()) {
            TMDBManager.shared.performRequest(path: "/company/\(companyId)", completion: completion)
        }
        
        /// Get the movies of a company by id.
        ///
        /// We highly recommend using [movie discover](https://developers.themoviedb.org/3/discover/movie-discover) instead of this method as it is much more flexible.
        /// - NOTE: I didn't see the `page` parameter on [TMDB's developer website](https://developers.themoviedb.org/3/companies/get-movies), but I tested it myself and it works.
        /// - Parameters:
        ///   - companyId: The company's ID.
        ///   - language: Pass a ISO 639-1 value to display translated data for the fields that support it.
        ///     - minLength: 2
        ///     - pattern: ([a-z]{2})-([A-Z]{2})
        ///     - default: en-US
        ///   - page: Specify which page to query.
        ///   - completion: Completion handler.
        public func getMovies(companyId: Int, language: String? = nil, page: Int? = nil, completion: @escaping (ObjectReturn<TMDBPaged<TMDBMovie>>) -> ()) {
            var query: [String: String] = [:]
            if let language = language {
                query["language"] = language
            }
            if let page = page {
                query["page"] = "\(page)"
            }
            TMDBManager.shared.performRequest(path: "/company/\(companyId)/movies",
                                              query: query,
                                              completion: completion)
        }
    }
    
    
}