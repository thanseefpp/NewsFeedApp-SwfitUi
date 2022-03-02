//
//  PostData.swift
//  NewsFeed
//
//  Created by THANSEEF on 02/03/22.
//

import Foundation

struct NewsData : Decodable {
    let hits : [Post]
}


struct Post : Decodable , Identifiable {
    // here id will take from the objectid
    var id : String {
        return objectID
    }
    let objectID : String
    let title : String
    let points : Int
    let url : String?
    
}
