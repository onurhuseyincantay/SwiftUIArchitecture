//
//  TopAnimeTarget.swift
//  SwiftUIArchitecture
//
//  Created by Onur Cantay on 03/02/2020.
//  Copyright © 2020 Onur Cantay. All rights reserved.
//

import Foundation
import Hover


enum TopAnimeTarget {
  case fetchTopAnimes
}

extension TopAnimeTarget: NetworkTarget {
  var baseURL: URL { URL(string: "https://api.jikan.moe/v3/")! }
  
  var path: String {
    switch self {
    case .fetchTopAnimes:
      return "top/anime/1/upcoming"
    }
  }
  
  var methodType: MethodType {
    switch self {
    case .fetchTopAnimes:
      return .get
    }
  }
  
  var workType: WorkType {
    switch self {
    case .fetchTopAnimes:
      return .requestPlain
    }
  }
  
  var providerType: AuthProviderType {
    .none
  }
  
  var contentType: ContentType? {
    .applicationJson
  }
  
  var headers: [String : String]? {
    nil
  }
}
