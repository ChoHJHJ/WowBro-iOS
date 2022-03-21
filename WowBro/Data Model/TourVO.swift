//
//  TourVO.swift
//  WowBro
//
//  Created by HyunJoong on 2022/03/16.
//

import Foundation
import Alamofire

struct TourVO: Codable {
    
    var tourName: String
    var tourPhotoUrl: String
    var tourAddress: String
    var tourTheme: String
    var tourPhotoDetailUrl: String
    var tourQRAddress: String
    var tourTitle: String
    var tourStory: String
    var tourWebUrl: String
    var tourLatitude: Double
    var tourLongitude: Double
    var qrAuth: Bool
    var likeAuth: Bool
}

//func getInfo(tourName: String?) -> [TourVO] {
//
//
////    alamo.validate().responseData(completionHandler: { response in
////        var tourThemeList: [TourVO]
////            switch response.result {
////            case let .success(data):
////                do {
////                    let decoder = JSONDecoder()
////                    tourThemeList = try decoder.decode([TourVO].self, from: data)
////                    print(tourThemeList)
////                } catch {
////                    print("에러\(response.error)")
////                }
////            case let .failure(error):
////                print("에러임\(error)")
////            }
////    })
//    return tourThemeList
//}
