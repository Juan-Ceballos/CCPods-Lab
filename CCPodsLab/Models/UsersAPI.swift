//
//  UsersAPI.swift
//  CCPodsLab
//
//  Created by Juan Ceballos on 3/3/20.
//  Copyright © 2020 Juan Ceballos. All rights reserved.
//

import Foundation
import Alamofire

public class UsersAPI   {
    
    static func fetchUsers(completion: @escaping ((AFResult<[User]>) -> ())) {
        
        let urlEndpoint = "https://randomuser.me/api/?results=50"
        
        guard let url = URL(string: urlEndpoint)
        else    {
            return
        }
        
        AF.request(url).response    {   (response)  in
            
            if let error = response.error   {
                completion(.failure(error))
            }
            
            else if let data = response.data    {
                do  {
                    let results = try JSONDecoder().decode(ResultsWrapper.self, from: data)
                    
                    completion(.success(results.results))
                }
                
                catch   {
                    print()
                }
            }
            
        }
        
        
        
    }
    
}
