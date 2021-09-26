//
//  FormatterDate+Extension.swift
//  NextTunes
//
//  Created by Alexandre Cardoso on 23/09/21.
//

import Foundation

extension String {
	
	func formatterDate() -> String? {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd"
		
		guard let dateFormatterInput = dateFormatter.date(from: self)
		else { return nil }
		dateFormatter.dateFormat = "dd/MM/yyyy"
		
		return dateFormatter.string(from: dateFormatterInput)
	}
	
}
