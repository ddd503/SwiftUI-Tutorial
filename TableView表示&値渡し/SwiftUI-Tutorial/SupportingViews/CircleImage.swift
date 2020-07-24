//
//  CircleImage.swift
//  SwiftUI-Tutorial
//
//  Created by kawaharadai on 2020/06/27.
//  Copyright © 2020 kawaharadai. All rights reserved.
//

import SwiftUI

struct CircleImage: View {

    var image: Image

    var body: some View {
        image
            .clipShape(Circle()) // 画像丸く
            .overlay(Circle().stroke(Color.gray, lineWidth: 4)) // 上に枠線Viewを重ねる
            .shadow(radius: 10) // 全体にshadow入れる
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("アザラシ"))
    }
}
