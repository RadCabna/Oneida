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
    var visitorReward: Int
}

struct ServiceItem: Equatable {
    var itemName: String
    var isSelected = false
    
}

struct Keys {
    var keyDesire: String
    var circleScale = 1
    var isChosen = false
    var guestIndexInRoom = 0
}

class Arrays {
    
    static var rulesArray = ["rules1", "rules2", "rules3", "rules4", "rules5"]
    
    static var kitchenArray: [ServiceItem] = [
    ServiceItem(itemName: "bell"),
    ServiceItem(itemName: "bell")
    ]
    
    static var cleaningArray: [ServiceItem] = [
    ServiceItem(itemName: "pipidaster"),
    ServiceItem(itemName: "pipidaster")
    ]
    
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
        Visitor(visitorImage: "visitor1", visitorDecireImage: "desire3", visitorReward: 10),
        Visitor(visitorImage: "visitor2", visitorDecireImage: "desire3", visitorReward: 10),
        Visitor(visitorImage: "visitor3", visitorDecireImage: "desire3", visitorReward: 10),
        Visitor(visitorImage: "visitor4", visitorDecireImage: "desire0", visitorReward: 5),
        Visitor(visitorImage: "visitor5", visitorDecireImage: "desire0", visitorReward: 5),
        Visitor(visitorImage: "visitor6", visitorDecireImage: "desire0", visitorReward: 5),
        Visitor(visitorImage: "visitor7", visitorDecireImage: "desire2", visitorReward: 10),
        Visitor(visitorImage: "visitor8", visitorDecireImage: "desire2", visitorReward: 10),
        Visitor(visitorImage: "visitor9", visitorDecireImage: "desire1", visitorReward: 5),
        Visitor(visitorImage: "visitor10", visitorDecireImage: "desire1", visitorReward: 5),
        Visitor(visitorImage: "visitor11", visitorDecireImage: "desire1", visitorReward: 5),
        Visitor(visitorImage: "visitor12", visitorDecireImage: "desire4", visitorReward: 20),
        Visitor(visitorImage: "visitor13", visitorDecireImage: "desire4", visitorReward: 20),
        Visitor(visitorImage: "visitor14", visitorDecireImage: "desire4", visitorReward: 20),
    ]
    
    static var shopItemsArray: [ShopItem] =
    [
        ShopItem(itemImage: "shopItem1", itemCost: 8000),
        ShopItem(itemImage: "shopItem2", itemCost: 500),
        ShopItem(itemImage: "shopItem3", itemCost: 900),
        ShopItem(itemImage: "shopItem4", itemCost: 2200),
        ShopItem(itemImage: "shopItem5", itemCost: 3500),
        ShopItem(itemImage: "shopItem6", itemCost: 1760),
        ShopItem(itemImage: "shopItem7", itemCost: 1000),
        ShopItem(itemImage: "shopItem8", itemCost: 1000)
    ]
    
}
