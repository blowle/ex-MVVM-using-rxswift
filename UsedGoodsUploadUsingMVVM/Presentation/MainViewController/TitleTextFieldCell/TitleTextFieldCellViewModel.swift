//
//  TitleTextFieldCellViewModel.swift
//  UsedGoodsUploadUsingMVVM
//
//  Created by yongcheol Lee on 2021/12/23.
//

import UIKit
import RxCocoa


struct TitleTextFieldCellViewModel {
    let titleText = PublishRelay<String?>()
    
}
