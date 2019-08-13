//
//  HomeController.swift
//  Fullstack Social
//
//  Created by Konstantin Kostadinov on 13.08.19.
//  Copyright © 2019 Konstantin Kostadinov. All rights reserved.
//

import LBTATools
import WebKit

class HomeController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        showCookies()
        navigationItem.leftBarButtonItem = .init(title: "Log In", style: .plain, target: self, action: #selector(handleLogin))
        navigationItem.rightBarButtonItem = .init(title: "Fetch posts", style: .plain, target: self, action: #selector(fetchPosts))
    }
    fileprivate func showCookies(){
        HTTPCookieStorage.shared.cookies?.forEach({ (cookie) in
            print(cookie)
        })
    }

    @objc fileprivate func handleLogin(){
        print("Show login and sign up pages")
        let navController = UINavigationController(rootViewController: LoginController())
        present(navController, animated: true)
    }
    @objc fileprivate func fetchPosts(){
        print("Attempt to fetch post while anauthorized")
        
        guard let url = URL(string: "http://localhost:1337/post") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            DispatchQueue.main.async {
                if let err = err{
                    print("Failet to hit server: ", err)
                    return
                }else if let resp = resp as? HTTPURLResponse, resp.statusCode != 200{
                    print("Failed to fetch posts, statusCode: ",resp.statusCode)
                    return
                }else{
                    print("Successfully fetched posts, response data: ")
                    let html = String(data: data ?? Data(), encoding: .utf8) ?? ""
                    print(html)
                    let vc = UIViewController()
                    let webView = WKWebView()
                    webView.loadHTMLString(html, baseURL: nil)
                    vc.view.addSubview(webView)
                    webView.fillSuperview()
                    self.present(vc,animated: true)
                    
                }
            }
        }.resume()
    }
}
