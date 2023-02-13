//
//  Misc.swift
//  TestTemplate
//
//  Created by Sergio García Vargas on 13/02/23.
//

import Foundation

class Misc {
    func transformDateToShow(with date: String) -> String {
        let dateFormatter = ISO8601DateFormatter()
        let dateToParse = dateFormatter.date(from: date)!
        let dateFormatterString = DateFormatter()
        dateFormatterString.dateFormat = "dd MMM, yyyy"
        return dateFormatterString.string(from: dateToParse)
    }
}
