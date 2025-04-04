//
//  SoundModel.swift
//  AppMam
//
//  Created by Mario Moreno on 4/2/25.
//

import Foundation
import SwiftUI
import AVKit

class SoundManager {
    
    static let instance = SoundManager()
    
    var player: AVAudioPlayer?
    
    enum SoundOption: String {
        case mapaJuego
        case nivel1
        case popup
        //Seccion de salon de clases
        case libro
        case mochila
        case pizarron
        case reloj
        case lapiz
        
    }
    
    func playSoundLoop(sound: SoundOption){
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = -1
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
    
    func playSound(sound: SoundOption){
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
    
    func stopSound() {
        player?.stop()
    }
        
    
}
