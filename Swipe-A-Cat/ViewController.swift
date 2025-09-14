//
//  ViewController.swift
//  Swipe-A-Cat
//
//  Created by Ali Syed on 2025-09-14.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var catURL: UILabel!
    
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
    
    private func fetchData() async {
        guard let url = URL(string: "https://api.thecatapi.com/v1/images/search") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoded = try JSONDecoder().decode([Cat].self, from: data)
            print(decoded[0].url)
        } catch {
            print("error")
        }
    }


}

