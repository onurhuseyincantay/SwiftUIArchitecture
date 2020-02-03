//
//  TopAnimeModel.swift
//  SwiftUIArchitecture
//
//  Created by Onur Cantay on 31/01/2020.
//  Copyright © 2020 Onur Cantay. All rights reserved.
//

import Foundation
// MARK: - TopAnime
struct TopAnimeModel: Decodable {
    let requestHash: String
    let requestCached: Bool
    let requestCacheExpiry: Int
    let top: [Top]

    enum CodingKeys: String, CodingKey {
        case requestHash = "request_hash"
        case requestCached = "request_cached"
        case requestCacheExpiry = "request_cache_expiry"
        case top
    }
}

// MARK: - Top
struct Top: Decodable {
    let malID, rank: Int
    let title: String
    let url: String
    let imageURL: String
    let type: TypeEnum
    let episodes: Int?
    let startDate, endDate: String?
    let members, score: Int

    enum CodingKeys: String, CodingKey {
        case malID = "mal_id"
        case rank, title, url
        case imageURL = "image_url"
        case type, episodes
        case startDate = "start_date"
        case endDate = "end_date"
        case members, score
    }
}

extension Top: Identifiable {
  var id: Int { malID }
}

enum TypeEnum: String, Decodable {
    case movie = "Movie"
    case ona = "ONA"
    case ova = "OVA"
    case tv = "TV"
    case unknown = "Unknown"
}
