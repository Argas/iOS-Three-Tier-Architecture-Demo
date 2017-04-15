//
//  IImageStorage.swift
//  SOADemo
//
//  Created by a.y.zverev on 13.04.17.
//  Copyright © 2017 a.y.zverev. All rights reserved.
//

import Foundation
import UIKit

protocol IImageStorage {
    func save(image: UIImage, for key: String)
    func fetchImage(key: String) -> UIImage?
}
