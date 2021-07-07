//
//  AjustesViewController.swift
//  As Descobertas de Aiô
//
//  Created by Paulo Bassani on 30/06/21.
//

import UIKit

class AjustesViewController: UIViewController {
    
    @IBOutlet weak var mainVolumeSlider: UISlider!
    @IBOutlet weak var musicVolumeSlider: UISlider!
    @IBOutlet weak var voiceVolumeSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didSwitchMainVolume(_ sender: UISwitch) {
        if sender.isOn {
            mainVolumeSlider.isEnabled = true
            mainVolumeSlider.alpha = 1
            AudioManager.shared.turnOn()
        } else {
            mainVolumeSlider.isEnabled = false
            mainVolumeSlider.alpha = 0.5
            AudioManager.shared.turnOff()
        }
    }
    
    @IBAction func didSwitchMusicVolume(_ sender: UISwitch) {
        if sender.isOn {
            musicVolumeSlider.isEnabled = true
            musicVolumeSlider.alpha = 1
            AudioManager.shared.resumeMusic()
        } else {
            musicVolumeSlider.isEnabled = false
            musicVolumeSlider.alpha = 0.5
            AudioManager.shared.pauseMusic()
        }
    }
    
    @IBAction func didSwitchVoiceVolume(_ sender: UISwitch) {
        //TODO
    }
    
    @IBAction func didChangeMainVolumeSlider(_ sender: UISlider) {
        AudioManager.shared.setMainVolume(value: sender.value)
    }
    
    @IBAction func didChangeMusicVolumeSlider(_ sender: UISlider) {
        AudioManager.shared.setMusicVolume(value: sender.value)
    }
    /*
    // MARK: - Navigation

     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
