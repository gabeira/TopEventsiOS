//
//  LogoDownloader.swift
//  TopEvents
//
//  Created by Gabriel Bernardo Pereira on 25/11/18.
//  Copyright © 2018 Gabriel Bernardo Pereira. All rights reserved.
//

import Foundation

class EventsRequest {

    let urlString = "https://s3-ap-southeast-2.amazonaws.com/bridj-coding-challenge/events.json"
    var delegate: LoadEventsDelegate?
    
    func loadEventsFromServer(){
        guard let url = URL(string : urlString) else {
            self.delegate?.didFinishLoadingWithError("URL Error")
            return
        }
        URLSession.shared.dataTask(with: url){ (data, _, err) in
            DispatchQueue.main.async {
                if let err = err{
                    self.delegate?.didFinishLoadingWithError(err.localizedDescription)
                    return
                }
                guard let data = data else {
                    self.delegate?.didFinishLoadingWithError("Data Error")
                    return
                }
                do{
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let result = try decoder.decode(Events.self, from: data)
                    self.delegate?.didFinishLoadingEvents(result)
                } catch let jsonErr {
                    self.delegate?.didFinishLoadingWithError(jsonErr.localizedDescription)
                }
            }
            }.resume()
    }
}
