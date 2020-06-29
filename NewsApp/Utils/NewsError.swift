//
//  NewsError.swift
//  NewsApp
//
//  Created by Максим Семений on 29.06.2020.
//  Copyright © 2020 Максим Семений. All rights reserved.
//

import Foundation

enum NewsError : String, Error {
    case unableToBookmark = "There was an error favoriting this user. Please try again."
    case alreadyInBookmarks = "You've already favorited this user."
}
