//
//  Model.swift
//  Oneida Online
//
//  Created by Алкександр Степанов on 11.03.2025.
//

import Foundation

struct ShopItem {
    var itemImage: String
    var itemCost: Int
}

struct Visitor: Equatable {
    var visitorImage: String
    var visitorDecireImage: String
    var desireActive = true
    var patienceActive = true
    var visitorPatience = 30
    var visitirOpacity: CGFloat = 0
    var visitorOffset: CGFloat = 0
    var visitorRoomTime = 20
}

struct Keys {
    var keyDesire: String
    var circleScale = 1
    var isChosen = false
    var guestIndexInRoom = 0
}

class Arrays {
    
    static var keysArray: [Keys] = [
    Keys(keyDesire: "desire1"),
    Keys(keyDesire: "desire1"),
    Keys(keyDesire: "desire1"),
    Keys(keyDesire: "desire1"),
    Keys(keyDesire: "desire2"),
    Keys(keyDesire: "desire2"),
    Keys(keyDesire: "desire3"),
    Keys(keyDesire: "desire3"),
    Keys(keyDesire: "desire3"),
    Keys(keyDesire: "desire3"),
    Keys(keyDesire: "desire4"),
    Keys(keyDesire: "desire4")
    ]
    
    static var visitorsArray: [Visitor] = [
    Visitor(visitorImage: "visitor1", visitorDecireImage: "desire3"),
    Visitor(visitorImage: "visitor2", visitorDecireImage: "desire3"),
    Visitor(visitorImage: "visitor3", visitorDecireImage: "desire3"),
    Visitor(visitorImage: "visitor4", visitorDecireImage: "desire0"),
    Visitor(visitorImage: "visitor5", visitorDecireImage: "desire0"),
    Visitor(visitorImage: "visitor6", visitorDecireImage: "desire0"),
    Visitor(visitorImage: "visitor7", visitorDecireImage: "desire2"),
    Visitor(visitorImage: "visitor8", visitorDecireImage: "desire2"),
    Visitor(visitorImage: "visitor9", visitorDecireImage: "desire1"),
    Visitor(visitorImage: "visitor10", visitorDecireImage: "desire1"),
    Visitor(visitorImage: "visitor11", visitorDecireImage: "desire1"),
    Visitor(visitorImage: "visitor12", visitorDecireImage: "desire4"),
    Visitor(visitorImage: "visitor13", visitorDecireImage: "desire4"),
    Visitor(visitorImage: "visitor14", visitorDecireImage: "desire4"),
    ]
    
    static var shopItemsArray: [ShopItem] =
    [
        ShopItem(itemImage: "shopItem1", itemCost: 10),
        ShopItem(itemImage: "shopItem2", itemCost: 20),
        ShopItem(itemImage: "shopItem3", itemCost: 30),
        ShopItem(itemImage: "shopItem4", itemCost: 40),
        ShopItem(itemImage: "shopItem5", itemCost: 50),
        ShopItem(itemImage: "shopItem6", itemCost: 60),
        ShopItem(itemImage: "shopItem7", itemCost: 70),
        ShopItem(itemImage: "shopItem8", itemCost: 80)
    ]
    
}
