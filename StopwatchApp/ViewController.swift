//
//  ViewController.swift
//  StopwatchApp
//
//  Created by Özkan CEYHAN on 20.11.2024.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var startButtonn: UIButton!
    
    @IBOutlet var stopButtonn: UIButton!
    
    
    @IBOutlet var resetButtonn: UIButton!
    
    
    @IBOutlet var tableView: UITableView!
    
    
    var timer : Timer?
    var elapsedTime : TimeInterval = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Start Button - Rounded corners
            startButtonn.layer.cornerRadius = 30
            startButtonn.clipsToBounds = true
            
            // Stop Button - Rounded corners
            stopButtonn.layer.cornerRadius = 30
            stopButtonn.clipsToBounds = true
            
            // Reset Button - Rounded corners
            resetButtonn.layer.cornerRadius = 30
            resetButtonn.clipsToBounds = true
        
    }

    @IBAction func startButton(_ sender: Any) {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        }
        playSoundForStart()
    }

    @objc func updateTime() {
        // Geçen zamanı 0.1 saniye artırıyoruz
        elapsedTime += 0.1

        // Zamanı saat, dakika, saniye ve milisaniye olarak hesaplıyoruz
        let minutes = Int(elapsedTime) / 60
        let seconds = Int(elapsedTime) % 60
        let milliseconds = Int((elapsedTime * 10).truncatingRemainder(dividingBy: 10))  // Salise kısmı

        // Zamanı formatlayıp, zaman etiketine yazdırıyoruz
        timeLabel.text = String(format: "%02d:%02d.%01d", minutes, seconds, milliseconds)
    }

    
    @IBAction func stopButton(_ sender: Any) {
        
        // Timer varsa durduruyoruz
        if timer != nil {
            timer?.invalidate() // Timer'ı durdur
            timer = nil
        }
        playSoundForStop()
    }
    
    @IBAction func resetButton(_ sender: Any) {
        // Zamanı sıfırlıyoruz
        elapsedTime = 0
        
        timer?.invalidate()
        
        timer = nil
        
        
        // Label'ı sıfırlıyoruz
        timeLabel.text = "00:00.0"
        playSoundForReset()
    }
    
    
    // Sesleri çalmak için metodlar

        func playSoundForStart() {
            // Start butonuna basıldığında çalacak ses
            AudioServicesPlaySystemSound(1018)  //
        }

        func playSoundForStop() {
            // Stop butonuna basıldığında çalacak ses
            AudioServicesPlaySystemSound(1050)  // Alarm sesi
        }

        func playSoundForReset() {
            // Reset butonuna basıldığında çalacak ses
            AudioServicesPlaySystemSound(1100)  // Tık sesi
        }
    
    
    
    
    
}

