//
//  Tour.swift
//  WowBro
//
//  Created by HyunJoong on 2022/02/22.
//

import Foundation

struct Tour: Codable {
    let tourName: String
    let address: String
    let tourPhotoUrl: String
    let tourDetail: TourDetail
    let isStamped: Bool?
    let latitude: Double
    let longitude: Double
}

struct TourDetail: Codable {
    let isGood: Bool
    let webViewUrl: String
    let qrCode: String
    let storyTitle: String
    let tourStory: String
}
