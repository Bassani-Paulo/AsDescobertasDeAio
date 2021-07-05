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
        mainVolumeSlider.isEnabled = !mainVolumeSlider.isEnabled
        if mainVolumeSlider.alpha<1 {
            mainVolumeSlider.alpha = 1
        } else {
            mainVolumeSlider.alpha = 0.5
        }
    }
    
    @IBAction func didSwitchMusicVolume(_ sender: UISwitch) {
        musicVolumeSlider.isEnabled = !musicVolumeSlider.isEnabled
        if musicVolumeSlider.alpha<1 {
            musicVolumeSlider.alpha = 1
        } else {
            musicVolumeSlider.alpha = 0.5
        }
    }
    
    @IBAction func didSwitchVoiceVolume(_ sender: UISwitch) {
        voiceVolumeSlider.isEnabled = !voiceVolumeSlider.isEnabled
        if voiceVolumeSlider.alpha<1 {
            voiceVolumeSlider.alpha = 1
        } else {
            voiceVolumeSlider.alpha = 0.5
        }
    }
    
    @IBAction func didChangeMainVolumeSlider(_ sender: UISlider) {
        //audioPlayer.volume = sender.value
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
