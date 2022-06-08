//
//  ViewController.swift
//  SwiftSocketExample
//
//  Created by Arbaz Chughtai on 6/8/22.
//

import UIKit
import SwiftSocket

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func startServerTapped(_ sender: UIButton) {
       
            self.startServer()

        
    }
    @IBAction func connectToServerTapped(_ sender: UIButton) {
        print("sadsadsa")
        DispatchQueue.main.async {
            let client = TCPClient(address: "127.0.0.1", port: 2000)
            switch client.connect(timeout: 2) {
            case .failure(let error):
                print(error.localizedDescription)
            case .success:
                print("connected to server")
            }
        }
       
    }
    
    func startServer() {
        DispatchQueue.global(qos: .background).async {
        
            let server = TCPServer(address: "127.0.0.1", port: 2000)
            switch server.listen() {
            case .failure(let error):
                print(error.localizedDescription)
            case .success:
                if let client = server.accept() {
                    self.echoServer(client: client)
                }
                else {
                    
                    print("cannot listen to client")
                }
                
            }
        
        }
    }

    func echoServer(client: TCPClient) {
        
    }

}

