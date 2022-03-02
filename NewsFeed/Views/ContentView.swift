//
//  ContentView.swift
//  NewsFeed
//
//  Created by THANSEEF on 02/03/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            List(networkManager.posts) { post in // trailing closure.
                //navigating to next screen.
                NavigationLink(destination: DetailsView(url: post.url), label: {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                })
            }
            .navigationBarTitle("Hacker 👨🏻‍💻 News")
        }
        
        //onappear in swiftui similer to viewdidload in swift uikit
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


//struct Post : Identifiable {
//    var id: String
//    var title : String
//}

//let posts = [
//    Post(id: "1", title: "hello"),
//    Post(id: "2", title: "hola"),
//    Post(id: "3", title: "halo")
//]
