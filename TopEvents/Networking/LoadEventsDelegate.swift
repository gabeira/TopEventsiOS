//
//  LogoDownloaderDelegate.swift
//  TopEvents
//
//  Created by Gabriel Bernardo Pereira on 25/11/18.
//  Copyright © 2018 Gabriel Bernardo Pereira. All rights reserved.
//

import Foundation

protocol LoadEventsDelegate {
    
    func didFinishLoadingEvents(_ sender:Events)
    
    func didFinishLoadingWithError(_ error:String)
}
