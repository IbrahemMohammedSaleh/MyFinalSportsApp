//
//  ApiServices.swift
//  MyFinalSportsApp
//
//  Created by Ibrahem's on 19/06/2022.
//

import Foundation

protocol ApiService {    
    func fetchUsers(endPoint: String, completion: @escaping ((SportsList?, Error?) -> Void))
}
