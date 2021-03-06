//
//  Change.swift
//  TMDBKit
//
//  Created by Siyuan Cao on 2017/10/23.
//  Copyright © 2017年 Siyuan Cao. All rights reserved.
//

import Foundation

public struct TMDBChangeBasic: Codable {
    public let id: Int
    public let adult: Bool?
}


public struct TMDBChangeDetailed: Codable {
    public let key: String
    public let items: [TMDBChange]
    
    public struct TMDBChange: Codable {
        public let id: String
        public let action: String
        public let time: String
        public let language: String
        public let value: String
        public let originalValue: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case action
            case time
            case language = "iso_639_1"
            case value
            case originalValue = "original_value"
        }
    }
}

public struct TMDBTVShowChanges: Codable {
    public let key: String
    public let item: [TMDBTVShowChange]
    
    public struct TMDBTVShowChange: Codable {
        public let id: String
        public let action: String
        public let value: [String: String]
    }
}

public struct TMDBPersonChanges: Codable {
    public let key: String
    public let items: [TMDBPersonChange]
    
    public struct TMDBPersonChange: Codable {
        public let id: String
        public let action: String
        public let time: String
        public let originalValue: TMDBPersonChangeOriginalValue
        
        public struct TMDBPersonChangeOriginalValue: Codable {
            public let profile: TMDBPersonChangeOriginalValueProfile
            public struct TMDBPersonChangeOriginalValueProfile: Codable {
                public let filePath: String
                enum CodingKeys: String, CodingKey {
                    case filePath = "file_path"
                }
            }
        }

        enum CodingKeys: String, CodingKey {
            case id
            case action
            case time
            case originalValue = "original_value"
        }
    }
}
