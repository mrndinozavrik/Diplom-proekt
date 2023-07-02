//
//  PostModel.swift
//  Navigation
//
// Created by 마리나 on 19.06.2023.
//

import UIKit

struct PostModel {
    var author: String
    var description: String
    var image: String
    var likes: Int
    var views: Int
//    let likesButton : String
    
    static func makePostModel() -> [PostModel] {
        var  model = [PostModel]()
        model.append(PostModel(author: "BTS",  description: "BTS (корейский: 방탄소년단; японский: 防弾少年团) - мужская группа из семи участников компании BigHit Music. Они дебютировали 13 июня 2013 года с синглом No More Dream. В Японии их дебют состоялся 24 декабря 2014 года с студийным альбомом Wake Up. Название группы, означает корейское выражение Bangtan Sonyeondan, что означает - пуленепробиваемые бойскауты.", image: "bts", likes: 0, views: 0))
        model.append(PostModel(author: "TXT",  description: "TXT (투모로우바이투게더; сокращено от Tomorrow X Together) - мужская группа из пяти участников компании BigHit Music. Они дебютировали 4 марта 2019 года с альбомом The Dream Chapter : Star.", image: "txt", likes: 0, views: 0))
        model.append(PostModel(author: "Stray kids",  description: "Stray Kids (кор: 스트레이키즈; яп: ストレイキッズ) - мужская группа компании JYP Entertainment. Группа была сформирована Бан Чаном (лидером группы), который сначала сформировал подгруппу 3RACHA, а после присоединил других участников. Далее через одноименное реалити-шоу группа проходила различные испытания, чтобы вместе дебютировать на Mnet.", image: "stray", likes: 0, views: 0))
        model.append(PostModel(author: "Ateez",  description: "ATEEZ (에이티즈) - мужская группа компании KQ Entertainment. Они дебютировали 24 октября 2018 года с мини-альбомом Treasure Ep.1 : All To Zero.", image: "ateez", likes: 0, views: 0))
        model.append(PostModel(author: "Enhypen",  description: "ENHYPEN (엔하이픈) - мужская группа из семи участников компании Belift Lab, которая была сформирована в результате шоу на выживание I-LAND. Они дебютировали 30 ноября 2020 года с мини-альбомом Border : Day One.", image: "enhypen", likes: 0, views: 0))
        
        return  model
    }
}
