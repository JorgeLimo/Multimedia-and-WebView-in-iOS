//
//  ViewController.swift
//  Multimedia
//
//  Created by Alumno on 11/04/17.
//  Copyright © 2017 Jorge Luis Limo. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    
    @IBOutlet weak var imageView: UIImageView!
    
    let  imagePiqcker = UIImagePickerController()
    
    var player: AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imagePiqcker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func actonimage(_ sender: UIButton) {
        
        
        var alertController:UIAlertController
        alertController = UIAlertController(title: "Seleccione una opcion", message: "", preferredStyle: UIAlertControllerStyle.alert)

        let camara  = UIAlertAction(title: "Camara", style: UIAlertActionStyle.default, handler: { (action) in
            self.usarCamara()
        })
        
        
        let galeriaFotos  = UIAlertAction(title: "Galeria de Fotos", style: UIAlertActionStyle.default, handler: { (action) in
            self.usarGaleria()
        })
    
        alertController.addAction(camara)
        alertController.addAction(galeriaFotos)
        self.present(alertController, animated: true, completion: {
            
        })
        
    }
    
    
    @IBAction func actionSonidos(_ sender: UIButton) {
        
        let path = Bundle.main.path(forResource: "sonido.wav", ofType: nil)
        
        let url = URL(fileURLWithPath: path!)
        
        do {
            let sonido = try AVAudioPlayer(contentsOf: url)
            
            player = sonido
            //repetir 3 veces luego de su primer play
            //player?.numberOfLoops = 3
            player?.numberOfLoops = -1
            //para infinito
            //validar que solo se toque
            player?.play()
            if  (player?.isPlaying)!{
                player?.play()
            }
            
        
        } catch {
            print("error !!!!")
        }
        
        
        
    }
    
    
    
    @IBAction func accionStop(_ sender: UIButton) {
        
        if  player != nil {
            player?.stop()
            //pause
            //player?.pause()
            //continar
            //player?.play(atTime):player?.currentTime
            
            player = nil
        }
        
        
    }
    
    
    @IBAction func showVideo(_ sender: UIButton) {
        
        let path = Bundle.main.path(forResource: "small.mp4", ofType: nil)
        
        let url = URL(fileURLWithPath: path!)
        
        
        let videoPlayer = AVPlayer(url: url)
        
        
        let  playerviewcontroller = AVPlayerViewController()
        
        playerviewcontroller.player = videoPlayer
        
        
        self.present(playerviewcontroller, animated: true){}
        
    }
    
    
    func usarCamara(){
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            
            imagePiqcker.sourceType = .camera
            imagePiqcker.cameraCaptureMode = .photo
            imagePiqcker.modalPresentationStyle =  .fullScreen

            self.present(imagePiqcker, animated: true, completion: {})
            
            
        }else{
             print("Camara no disponible")
        }
        
        
    }
    
    func usarGaleria(){
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
         
            imagePiqcker.sourceType = .photoLibrary
            imagePiqcker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
           
            self.present(imagePiqcker, animated: true, completion: {})
        }
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let imageGet  = info[UIImagePickerControllerOriginalImage] as! UIImage
    
        imageView.image = imageGet
    
        self.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true)
    }
    
    
    
    
    

}

