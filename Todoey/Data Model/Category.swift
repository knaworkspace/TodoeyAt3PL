//
//  Category.swift
//  Todoey
//
//  Created by 3PL-Total on 2018/6/28.
//  Copyright © 2018年 KNA. All rights reserved.
//

import Foundation
import RealmSwift

class Category:Object{
    @objc dynamic var name:String = ""
    let items = List<Item>()
    
}
