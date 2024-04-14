//
//  IterationView.swift
//  HapticTest
//
//  Created by chihyung park on 2024/04/14.
//

import SwiftUI

struct IterationView: View {

    var values: [String]
    
    var body: some View {
        ForEach(0..<values.count) { index in
            Text(String(describing: values[index])).tag(index)
                .background(
                    RoundedRectangle(cornerRadius: 15.0)
                        .fill(.white)
                )
        }
    }
}
