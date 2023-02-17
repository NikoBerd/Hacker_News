//
//  ContentView.swift
//  H4X0R News
//
//  Created by Niko on 30.10.22.
//

import SwiftUI

struct ContentView: View {
  
  @ObservedObject var networkManager = NetworkManager()
  
  var body: some View {
    //creating a navigation view
    NavigationView {
      //creating a list of items
      List(networkManager.posts) { post in
        NavigationLink(destination: DetailView(url: post.url)) {
          HStack {
            Text(String(post.points))
            Text(post.title)
          }
        }
        
        
      }
      //setting the navigation bar title
      .navigationBarTitle("Hacker NEWS 👾")
    }
    .onAppear {
      self.networkManager.fetchData()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

