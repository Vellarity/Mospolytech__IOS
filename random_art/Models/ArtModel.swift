//
//  ArtModel.swift
//  random_art
//
//  Created by user on 12.06.2024.
//

import Foundation

//\(Int.random(in: 10...130000))
class ArtCall{
    func getArt() async -> ArtData {
        do {
            var response:HTTPURLResponse? = nil
            var resData:Data? = nil
            while response?.statusCode != 200 {
                let rand = Int.random(in: 10...130000) //129884
                let url = URL(string:"https://api.artic.edu/api/v1/artworks/\(rand)")
                print(rand)
                let (data, res) = try await URLSession.shared.data(from:url!)
                if let httpRes = res as? HTTPURLResponse {
                    response = httpRes
                }
                resData = data
            }
            let artData = try JSONDecoder().decode(ArtData.self, from: resData!)
            return artData
        } catch let error {
            print(error.localizedDescription)
            return ArtData()
        }
        
        
        
        
        /*return await withCheckedContinuation { continuation in
            URLSession.shared.dataTask(with: url!) { (data, response, error) in
                
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse {
                    print(httpResponse.statusCode)
                    if httpResponse.statusCode == 200 {
                        print("Got 200")
                        do {
                            let artData = try JSONDecoder().decode(ArtData.self, from: data!)
                            DispatchQueue.main.async{
                                continuation.resume(returning: artData)
                            }
                        } catch {
                            print("Error while parsing data")
                        }
                    }
                }

            }.resume()
        }*/
    }
}
