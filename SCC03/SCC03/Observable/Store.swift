//
//  Store.swift
//  SCC03
//
//  Created by Hoeun Lee on 11/25/23.
//

import Foundation
import Combine

class Store: ObservableObject {
    @Published var name: String = ""
    @Published var item: Item = Item()
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // item에서 값 변경이 되면 class를 참조하고 있음
        // 내부 값이 바뀌더라도 참조값은 바뀌지 않기 때문에 내부의 변경을 알기는 어렵다
        // 아래 방식으로 내부적으로 변경이 되면 변경을 알려주게 된다
        // 따라서 Item 내부의 변경을 Store의 변경으로 만들어줌
        item.objectWillChange
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
    }
}

class Item: ObservableObject {
    /*
     ObservableObject에서 @Published 값이 변경되면 해당 뷰에게 알려줌
     */
    @Published var name: String = "item name"
    @Published var price: Int = 0
    
    // var objectWillChange: ObservableObjectPublisher
    // Object Will Change가 값을 뷰에 전달하게 됨
    // ObservableObject를 다른 ObservableObject에 넣어주게 되면
    // 값의 변화를 내부에서만 알고 있게 됨
    // 즉, Item에서 값이 변화하면 Item 내부에서만 알게 되고 있고
    // Store에서는 알 수 없음!
    
    // Combine에 Publisher
    // -> 알림을 보내주는 역할
    // Item에 변경이 되면 Item 내부의 변화를 구독자에게 알려주는 objectWillChange를 구독해서 상위에서 알림을 받게 됨
}
