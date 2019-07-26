//
//  WebSocketViewController.swift
//  DealershipExperience
//
//  Created by Moss, Jonathan (J.R.) on 7/26/19.
//  Copyright © 2019 Moss, Jonathan (J.R.). All rights reserved.
//

import UIKit
import Starscream

class WebSocketViewController: UIViewController, WebSocketDelegate {

    var socket: WebSocket!

    override func viewDidLoad() {
        super.viewDidLoad()

        var request = URLRequest(url: URL(string: "ws://40.85.178.233:42069/ws")!)
        request.timeoutInterval = 5
        socket = WebSocket(request: request)
        socket.delegate = self
        socket.connect()
      
    }
    
    
    func websocketDidConnect(socket: WebSocketClient) {
        print("websocket is connected")
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        if let e = error as? WSError {
            print("websocket is disconnected: \(e.message)")
        } else if let e = error {
            print("websocket is disconnected: \(e.localizedDescription)")
        } else {
            print("websocket disconnected")
        }
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        print("Received text: \(text)")
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("Received data: \(data.count)")
    }

    
    
    @IBAction func Unlock(_ sender: UIButton) {
         socket.write(string: "unlock")
    }
    
    @IBAction func Lock(_ sender: UIButton) {
         socket.write(string: "lock")
    }
    
    @IBAction func Start(_ sender: UIButton) {
         socket.write(string: "start")
    }
    

}
