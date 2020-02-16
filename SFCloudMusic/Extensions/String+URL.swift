//
//    String+URL.swift
//  SFCloudMusic
//
//  Created by 沈海超 on 2020/2/16.
//  Copyright © 2020 沈海超. All rights reserved.
//
extension String {
    var URLEscaped: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
    }
}
