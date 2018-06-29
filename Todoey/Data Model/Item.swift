//
//  Item.swift
//  Todoey
//
//  Created by 3PL-Total on 2018/6/28.
//  Copyright © 2018年 KNA. All rights reserved.
//

import Foundation
import RealmSwift

class Item:Object{
    @objc dynamic var title:String = ""
    @objc dynamic var done:Bool = false
    @objc dynamic var createdDate:Data?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
