//
//  AnimeListView.swift
//  SwiftUIArchitecture
//
//  Created by Onur Cantay on 31/01/2020.
//  Copyright © 2020 Onur Cantay. All rights reserved.
//

import SwiftUI

struct AnimeListView: View {
  @EnvironmentObject
  private var viewModel: AnimeListViewModel
  
    var body: some View {
      List(self.viewModel.topAnimes?.top ?? []) { anime in
        Text(anime.title)
      }.onAppear() {
        self.viewModel.trigger(.fetchTopAnimes)
      }
  }
  
}

struct AnimeListView_Previews: PreviewProvider {
    static var previews: some View {
        AnimeListView()
    }
}
