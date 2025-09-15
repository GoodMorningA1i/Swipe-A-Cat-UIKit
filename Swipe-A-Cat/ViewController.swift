//
//  ViewController.swift
//  Swipe-A-Cat
//
//  Created by Ali Syed on 2025-09-14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var catImage: UIImageView!
    
    struct Cat: Decodable {
        let id: String
        let url: String
        let width: Int
        let height: Int
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await fetchData()
        }
    }
    
    func divide(_ x: Int, _ y: Int) -> Int {
        y != 0 ? x / y : 0
    }
    
    private func fetchData() async {
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([Cat].self, from: data)
            
            guard let decodedCatURL = URL(string: decoded[0].url) else {
                print("Invalid Cat URL")
                return
            }
            URLSession.shared.dataTask(with: decodedCatURL) { data, _, error in
                guard let data = data,
                      let image = UIImage(data: data),
                      error == nil else { return }
                
                DispatchQueue.main.async {
                    self.catImage.image = image
                }
                
            }.resume()
        } catch {
            print("Error in fetching data or decoding the data: \(error)")
        }
    }


}

