//
//  ViewController.swift
//  Alouette
//
//  Created by techmaster on 11/1/16.
//  Copyright © 2016 techmaster. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var bird = UIImageView()
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        drawJungle()
        addBird()
        fly()
        playSong()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func drawJungle() {
        let backgroud = UIImageView(image: UIImage(named: "jungle.jpg"))
        backgroud.frame = self.view.bounds
        backgroud.contentMode = .scaleAspectFill
        self.view.addSubview(backgroud)
    }
    func addBird() {
        bird = UIImageView(frame: CGRect(x: 0, y: 0, width: 110, height: 68))
        bird.animationImages = [
            UIImage(named: "bird0.png")!,
            UIImage(named: "bird1.png")!,
            UIImage(named: "bird2.png")!,
            UIImage(named: "bird3.png")!,
            UIImage(named: "bird4.png")!,
            UIImage(named: "bird5.png")!,
        ]
        bird.animationRepeatCount = 0
        bird.animationDuration = 1
        bird.startAnimating()
        self.view.addSubview(bird)
    }
    func fly() {
        UIView.animate(withDuration: 4, animations: {
            self.bird.center = CGPoint(x: self.view.bounds.size.width, y: self.view.bounds.size.height)
            }, completion: { (finished) in
            self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1).concatenating(CGAffineTransform(rotationAngle: 45))
                
                UIView.animate(withDuration: 4, animations: {
                    self.bird.center = CGPoint(x: 0, y: self.view.bounds.size.height)
                    }, completion: { (finished) in
                        self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1).concatenating(CGAffineTransform(rotationAngle: 180))
                        UIView.animate(withDuration: 4, animations: {
                            self.bird.center = CGPoint(x: self.view.bounds.size.width, y: 0)
                            }, completion: { (finished) in
                                self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1).concatenating(CGAffineTransform(rotationAngle: 45))
                                UIView.animate(withDuration: 4, animations: {
                                    self.bird.center = CGPoint(x: 0, y: 0)
                                    }, completion: { (finished) in
                                        self.bird.transform = CGAffineTransform.identity
                                        self.fly()
                                })

                        })
                })
        })
    }
    func playSong() {
        let filePath = Bundle.main.path(forResource: "A+ – Chào Mào Mái Hót", ofType: "mp3")
        let url = URL(fileURLWithPath: filePath!)
        audioPlayer = try! AVAudioPlayer(contentsOf: url)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        // audioPlayer.stop()
    }
}

