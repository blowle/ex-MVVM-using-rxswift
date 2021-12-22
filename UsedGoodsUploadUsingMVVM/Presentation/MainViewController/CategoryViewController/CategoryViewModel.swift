//
//  CategoryViewModel.swift
//  UsedGoodsUploadUsingMVVM
//
//  Created by yongcheol Lee on 2021/12/23.
//

import Foundation
import RxSwift
import RxCocoa

struct CategoryViewModel {
    let disposeBag = DisposeBag()
    
    // viewmodel -> view
    let cellData: Driver<[Category]>
    let pop: Signal<Void>
    
    // view -> viewmodel
    let itemSelected = PublishRelay<Int>()
    
    // viewmodel -> parent viewmodel
    let selectedCategory = PublishSubject<Category>()
    
    init() {
        let catetories = [
            Category(id: 1, name: "디지털/가전"),
            Category(id: 2, name: "게임"),
            Category(id: 3, name: "스포츠/레저"),
            Category(id: 4, name: "유아/아동용품"),
            Category(id: 5, name: "여성패션/잡화"),
            Category(id: 6, name: "뷰티/미용"),
            Category(id: 7, name: "남성패션/잡화"),
            Category(id: 8, name: "생활/식품"),
            Category(id: 9, name: "가구"),
            Category(id: 10, name: "도서/티켓/취미"),
            Category(id: 11, name: "기타")
        ]
        
        cellData = Driver.just(catetories)
        
        itemSelected
            .map { catetories[$0] }
            .bind(to: selectedCategory)
            .disposed(by: disposeBag)
        
        pop = itemSelected
            .map { _ in Void() }
            .asSignal(onErrorSignalWith: .empty())
    }
}
