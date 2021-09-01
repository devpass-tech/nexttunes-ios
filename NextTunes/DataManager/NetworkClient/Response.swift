//
//  Response.swift
//  NextTunes
//
//  Created by Rodrigo Borges on 29/08/21.
//

import Foundation

public enum Response {

    case result(Data)
    case error(Error?)
}
