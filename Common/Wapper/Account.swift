//
//  Account.swift
//  TMDBKit
//
//  Created by Siyuan Cao on 2017/10/18.
//  Copyright © 2017年 Siyuan Cao. All rights reserved.
//

import Foundation

// MARK: - [Account API](https://developers.themoviedb.org/3/account).
extension TMDBManager {
    /// Get your account details.
    public func getDetails(completion: @escaping (ObjectReturn<TMDBUser>) -> ()) {
        performRequest(path: "/account", needAuthentication: true, completion: completion)
    }
    
    /// Get all of the lists created by an account. Will invlude private lists if you are the owner.
    ///
    /// - Parameters:
    ///   - accountId: Account ID for the user.
    ///   - language: Pass a ISO 639-1 value to display translated data for the fields that support it.
    ///     - minLength: 2
    ///     - pattern: `([a-z]{2})-([A-Z]{2})`
    ///     - default: en-US
    ///   - page: Specify which page to query.
    ///     - Minimum: 1
    ///     - Maximum: 1000
    ///     - Default: 1
    public func getCreatedLists(accountId account: Int, language: String?, page: Int?, completion: @escaping (ObjectReturn<TMDBPaged<TMDBList>>) -> ()) {
        var query: [String: String] = [:]
        
        if let language = language {
            query["language"] = language
        }
        
        if let page = page {
            query["page"] = "\(page)"
        }
        
        performRequest(path: "/account/\(account)/lists", query: query, needAuthentication: true, completion: completion)
    }
    
    /// Get the list of your favorite movies.
    ///
    /// - Parameters:
    ///   - accountId: Account ID for the user.
    ///   - language: Pass a ISO 639-1 value to display translated data for the fields that support it.
    ///     - minLength: 2
    ///     - pattern: `([a-z]{2})-([A-Z]{2})`
    ///     - default: en-US
    ///   - sortBy: Sort the results. **Allowed Values:** `created_at.asc`, `created_at.desc`
    ///   - page: Specify which page to query.
    ///     - minimum: 1
    ///     - maximum: 1000
    ///     - default: 1
    public func getFavoriteMovies(accountId account: Int, language: String?, sortBy: String?, page: Int?, completion: @escaping (ObjectReturn<TMDBPaged<TMDBMovie>>) -> ()) {
        var query: [String: String] = [:]
        
        if let language = language {
            query["language"] = language
        }
        
        if let sortBy = sortBy {
            query["sort_by"] = sortBy
        }
        
        if let page = page {
            query["page"] = "\(page)"
        }
        performRequest(path: "/account/\(account)/favorite/movies", query: query, needAuthentication: true, completion: completion)
    }
    
    /// Get the list of your favorite TV shows.
    ///
    /// - Parameters:
    ///   - accountId: Account ID for the user.
    ///   - language: Pass a ISO 639-1 value to display translated data for the fields that support it.
    ///     - minLength: 2
    ///     - pattern: `([a-z]{2})-([A-Z]{2})`
    ///     - default: en-US
    ///   - sortBy: Sort the results. **Allowed Values:** `created_at.asc`, `created_at.desc`
    ///   - page: Specify which page to query.
    ///     - minimum: 1
    ///     - maximum: 1000
    ///     - default: 1
    public func getFavoriteTVShows(accountId account: Int, language: String?, sortBy: String?, page: Int?, completion: @escaping (ObjectReturn<TMDBPaged<TMDBTVShow>>) -> ()) {
        var query: [String: String] = [:]
        
        if let language = language {
            query["language"] = language
        }
        
        if let sortBy = sortBy {
            query["sort_by"] = sortBy
        }
        
        if let page = page {
            query["page"] = "\(page)"
        }
        performRequest(path: "/account/\(account)/favorite/tv", query: query, needAuthentication: true, completion: completion)
    }
    
    
    /// This method allows you to mark a movie or TV show as a favorite item.
    /// - TODO: Finish POST method
    ///
    /// - Parameters:
    ///   - accountId: Account ID for the user.
    ///   - requestBody: A `TMDBFavoriteMediaObject`, use `TMDBFavoriteMediaObject(mediaType:mediaId:favorite)` to init one.
    public func markAsFavorite(accountId: Int, requestBody: TMDBFavoriteMediaObject, completion: @escaping (NilReturn) -> () ) {
        
    }
    
    /// Get a list of all the movies you have rated.
    ///
    /// - Parameters:
    ///   - accountId: Account ID for the user.
    ///   - language: Pass a ISO 639-1 value to display translated data for the fields that support it.
    ///     - minLength: 2
    ///     - pattern: `([a-z]{2})-([A-Z]{2})`
    ///     - default: en-US
    ///   - sortBy: Sort the results. **Allowed Values:** `created_at.asc`, `created_at.desc`
    ///   - page: Specify which page to query.
    ///     - minimum: 1
    ///     - maximum: 1000
    ///     - default: 1
    public func getRatedMovies(accountId account: Int, language: String?, sortBy: String?, page: Int?, completion: @escaping (ObjectReturn<TMDBPaged<TMDBMovie>>) -> ()) {
        var query: [String: String] = [:]
        
        if let language = language {
            query["language"] = language
        }
        
        if let sortBy = sortBy {
            query["sort_by"] = sortBy
        }
        
        if let page = page {
            query["page"] = "\(page)"
        }
        performRequest(path: "/account/\(account)/rated/movies", query: query, needAuthentication: true, completion: completion)
    }
    
    /// Get a list of all the TV shows you have rated.
    /// - TODO: TMDBTVShow CodingKeys
    /// - Parameters:
    ///   - accountId: Account ID for the user.
    ///   - language: Pass a ISO 639-1 value to display translated data for the fields that support it.
    ///     - minLength: 2
    ///     - pattern: `([a-z]{2})-([A-Z]{2})`
    ///     - default: en-US
    ///   - sortBy: Sort the results. **Allowed Values:** `created_at.asc`, `created_at.desc`
    ///   - page: Specify which page to query.
    ///     - minimum: 1
    ///     - maximum: 1000
    ///     - default: 1
    public func getRatedTVShows(accountId account: Int, language: String?, sortBy: String?, page: Int?, completion: @escaping (ObjectReturn<TMDBPaged<TMDBTVShow>>) -> ()) {
        var query: [String: String] = [:]
        
        if let language = language {
            query["language"] = language
        }
        
        if let sortBy = sortBy {
            query["sort_by"] = sortBy
        }
        
        if let page = page {
            query["page"] = "\(page)"
        }
        performRequest(path: "/account/\(account)/rated/tv", query: query, needAuthentication: true, completion: completion)
    }
    
    /// Get a list of all the TV episodes you have rated.
    /// - TODO: TMDBTVShow CodingKeys
    /// - Parameters:
    ///   - accountId: Account ID for the user.
    ///   - language: Pass a ISO 639-1 value to display translated data for the fields that support it.
    ///     - minLength: 2
    ///     - pattern: `([a-z]{2})-([A-Z]{2})`
    ///     - default: en-US
    ///   - sortBy: Sort the results. **Allowed Values:** `created_at.asc`, `created_at.desc`
    ///   - page: Specify which page to query.
    ///     - minimum: 1
    ///     - maximum: 1000
    ///     - default: 1
    public func getRatedTVEpisodes(accountId account: Int, language: String?, sortBy: String?, page: Int?, completion: @escaping (ObjectReturn<TMDBPaged<TMDBTVShow>>) -> ()) {
        var query: [String: String] = [:]
        
        if let language = language {
            query["language"] = language
        }
        
        if let sortBy = sortBy {
            query["sort_by"] = sortBy
        }
        
        if let page = page {
            query["page"] = "\(page)"
        }
        performRequest(path: "/account/\(account)/rated/episodes", query: query, needAuthentication: true, completion: completion)
    }
    
    /// Get a list of all the movies you have added to your watchlist.
    ///
    /// - Parameters:
    ///   - accountId: Account ID for the user.
    ///   - language: Pass a ISO 639-1 value to display translated data for the fields that support it.
    ///     - minLength: 2
    ///     - pattern: `([a-z]{2})-([A-Z]{2})`
    ///     - default: en-US
    ///   - sortBy: Sort the results. **Allowed Values:** `created_at.asc`, `created_at.desc`
    ///   - page: Specify which page to query.
    ///     - minimum: 1
    ///     - maximum: 1000
    ///     - default: 1
    public func getMovieWatchlist(accountId account: Int, language: String?, sortBy: String?, page: Int?, completion: @escaping (ObjectReturn<TMDBPaged<TMDBMovie>>) -> ()) {
        var query: [String: String] = [:]
        
        if let language = language {
            query["language"] = language
        }
        
        if let sortBy = sortBy {
            query["sort_by"] = sortBy
        }
        
        if let page = page {
            query["page"] = "\(page)"
        }
        performRequest(path: "/account/\(account)/watchlist/movies", query: query, needAuthentication: true, completion: completion)
    }
    
    /// Get a list of all the TV shows you have added to your watchlist.
    ///
    /// - Parameters:
    ///   - accountId: Account ID for the user.
    ///   - language: Pass a ISO 639-1 value to display translated data for the fields that support it.
    ///     - minLength: 2
    ///     - pattern: `([a-z]{2})-([A-Z]{2})`
    ///     - default: en-US
    ///   - sortBy: Sort the results. **Allowed Values:** `created_at.asc`, `created_at.desc`
    ///   - page: Specify which page to query.
    ///     - minimum: 1
    ///     - maximum: 1000
    ///     - default: 1
    public func getTVShowWatchlist(accountId account: Int, language: String?, sortBy: String?, page: Int?, completion: @escaping (ObjectReturn<TMDBPaged<TMDBTVShow>>) -> ()) {
        var query: [String: String] = [:]
        
        if let language = language {
            query["language"] = language
        }
        
        if let sortBy = sortBy {
            query["sort_by"] = sortBy
        }
        
        if let page = page {
            query["page"] = "\(page)"
        }
        performRequest(path: "/account/\(account)/watchlist/tv", query: query, needAuthentication: true, completion: completion)
    }
    
    /// Add a movie or TV show to your watchlist.
    /// - TODO: Finish POST method
    ///
    /// - Parameters:
    ///   - accountId: Account ID for the user.
    ///   - requestBody: A `TMDBWatchlistMediaObject`, use `TMDBWatchlistMediaObject(mediaType:mediaId:favorite)` to init one.
    public func addToWatchlist(accountId: Int, requestBody: TMDBWatchlistMediaObject, completion: @escaping (NilReturn) -> () ) {
        
    }
}