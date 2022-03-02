//
//  DetailsView.swift
//  NewsFeed
//
//  Created by THANSEEF on 02/03/22.
//

import SwiftUI

struct DetailsView: View {
    
    var url : String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(url: "https://www.google.com")
    }
}


