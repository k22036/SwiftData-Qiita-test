//
//  Item.swift
//  SwiftData-Qiita-test
//
//  Created by k22036kk on 2024/11/29.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}


class ItemDatastore {
    // シングルトン
    @MainActor static let shared = ItemDatastore()
    
    func insert(modelContext: ModelContext, timestamp: Date) {
        modelContext.insert(Item(timestamp: timestamp))
        
        try? modelContext.save()
    }
    
    
    func delete(modelContext: ModelContext, item: Item) {
        modelContext.delete(item)
        
        try? modelContext.save()
    }
    
}
