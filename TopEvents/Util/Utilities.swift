//
//  Utilities.swift
//  TopEvents
//
//  Created by Gabriel Bernardo Pereira on 25/11/18.
//  Copyright © 2018 Gabriel Bernardo Pereira. All rights reserved.
//

import UIKit
import Foundation

final class Utilities {
    
    static func showAlertViewController(title:String, message:String) -> UIAlertController {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let cancelAction = UIAlertAction(title: "OK", style: .default)
        alertViewController.addAction(cancelAction)
        return alertViewController
    }
}

extension String
{
    func parseISODate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: self) else { return nil }
        return date
    }
}

extension Date
{
    func toString() -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE d MMM yyyy - HH:mm"
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0) as TimeZone
        return dateFormatter.string(from: self)
    }
}
