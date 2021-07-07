//
//  AudioManager.swift
//  As Descobertas de Aiô
//
//  Created by Paulo Bassani on 05/07/21.
//

import Foundation
import AVFoundation

class AudioManager {
    public static var shared = AudioManager()
    private var musicPlayer: AVAudioPlayer?
    private var voicePlayer: AVAudioPlayer?
    private var generalVolume:Float {
        willSet(newValue) {
            updateMusicVolume(generalVolume, newValue)
        }
    }
    private var isActive:Bool
    
    private init() {
        generalVolume = 0.5
        isActive = true
    }
    
//    public func play(url : URL?) {
//        guard let audioURL = url else { return }
//        let playerItem = AVPlayerItem(url: audioURL)
//        audioPlayer = AVPlayer(playerItem: playerItem)
//        audioPlayer?.play()
//    }
    
    public func setMainVolume(value : Float) {
        if(value == 0) {
            return
        }
        generalVolume = value
    }
    
    public func turnOn() {
        isActive = true
        playMusic()
    }
    
    public func turnOff() {
        isActive = false
        pauseMusic()
    }
    
    public func playMusic() {
        if isActive {
            if let musicURL = Bundle.main.url(forResource: "The Curious Kitten - Aaron Kenny", withExtension: "mp3") {
                do { musicPlayer = try AVAudioPlayer(contentsOf: musicURL) } catch {}
                musicPlayer?.play()
                musicPlayer?.numberOfLoops = -1
            }
        }
    }
    
    public func resumeMusic() {
        if isActive {
            musicPlayer?.play()
        }
    }
    
    public func pauseMusic() {
        musicPlayer?.pause()
    }
    
    public func setMusicVolume(value : Float) {
        musicPlayer?.volume = value*generalVolume
    }
    
    private func updateMusicVolume(_ value : Float, _ newValue : Float) {
        let musicVolume = ((musicPlayer?.volume)!)/value
        musicPlayer?.volume = musicVolume*newValue
    }
}
