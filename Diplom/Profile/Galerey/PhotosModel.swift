//
//  PhotosModel.swift
//  Navigation
//
// Created by 마리나 on 19.06.2023.
//

import UIKit

struct PhotosModel {
    
    let photo: String
    
    static func makePhotosModel() -> [PhotosModel] {
//        var count = 1
        var arrayPhoto = [PhotosModel]()
        for i in 1...20 {
            arrayPhoto.append(PhotosModel(photo: String(i)))
//            count += 1
        }
        return arrayPhoto
    }
    
}
