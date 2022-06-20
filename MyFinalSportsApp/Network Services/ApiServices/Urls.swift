//
//  Urls.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 19/06/2022.
//

import Foundation

struct UrlServices {
    var endPoint: String = ""
    var url: String {
        return "https://www.thesportsdb.com/api/v1/json/2/all_\(endPoint)"
    }
}

