//
//  ContentView.swift
//  AppClip
//
//  Created by iOS TL on 14/12/22.
//

import SwiftUI



struct ContentView: View {
    
    @State var deeplinkMovieId: Int?
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .foregroundColor(.red)
            .onContinueUserActivity(NSUserActivityTypeBrowsingWeb, perform: handleUserActivity(_:))
    }
    
    func handleUserActivity(_ userActivity: NSUserActivity) {
        guard
            let incomingURL = userActivity.webpageURL,
            let components = URLComponents(url: incomingURL, resolvingAgainstBaseURL: true),
            let queryItems = components.queryItems,
            let id = queryItems.first(where: { $0.name == "id" })?.value
        else {
            deeplinkMovieId = nil
            return
        }
        deeplinkMovieId = Int(id)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
