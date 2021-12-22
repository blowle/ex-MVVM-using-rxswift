//
//  PriceTextFieldCellViewModel.swift
//  UsedGoodsUploadUsingMVVM
//
//  Created by yongcheol Lee on 2021/12/23.
//

import Foundation
import RxSwift
import RxCocoa

struct PriceTextFieldCellViewModel {
    // viewmodel -> view
    let showFreeShareButton: Signal<Bool>
    let resetPrice: Signal<Void>
    
    // view -> viewmodel
    let priceValue = PublishRelay<String?>()
    let freeShareButtonTapped = PublishRelay<Void>()
    
    init() {
        showFreeShareButton = Observable
            .merge(
                priceValue.map { $0 ?? "" == "0" },
                freeShareButtonTapped.map { _ in false }
            )
            .asSignal(onErrorJustReturn: false)
        
        resetPrice = freeShareButtonTapped
            .asSignal(onErrorSignalWith: .empty())
    }
}
