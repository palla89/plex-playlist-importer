//
//  ViewController.swift
//  Plex Playlist Importer
//
//  created by Alberto Paladino on 28/05/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var serverURLTextField: UITextField!
    @IBOutlet weak var portTextField: UITextField!
    @IBOutlet weak var tokenTextField: UITextField!
    @IBOutlet weak var sectionIDTextField: UITextField!
    @IBOutlet weak var pathTextField: UITextField!
    
    let defaultPlexServerPort = 32400
    
    override func viewWillAppear(_ animated: Bool) {
        Environment.shared.sessionService.loadData()
        self.populateFields()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupUI()
    }
    
    func setupUI() {
        self.serverURLTextField.addBottomBorder()
        self.portTextField.addBottomBorder()
        self.tokenTextField.addBottomBorder()
        self.sectionIDTextField.addBottomBorder()
        self.pathTextField.addBottomBorder()
    }

    func populateFields() {
        self.serverURLTextField.text = Environment.shared.sessionService.serverURL
        self.tokenTextField.text = Environment.shared.sessionService.token
        self.sectionIDTextField.text = Environment.shared.sessionService.sectionID
        self.pathTextField.text = Environment.shared.sessionService.path
        self.portTextField.text = Environment.shared.sessionService.port
    }
    
    @IBAction func importPlaylistAction(_ sender: Any) {
        
        guard let serverURL = serverURLTextField.text,
              let port = portTextField.text != "" ? ((portTextField.text as NSString?)?.integerValue) : defaultPlexServerPort,
              let token = tokenTextField.text,
              let sectionId = (sectionIDTextField.text as NSString?)?.integerValue,
              let path = pathTextField.text else {
            print("error")
            return
        }
        
        // save in default
        Environment.shared.sessionService.saveDefault(serverURL: serverURLTextField.text, sectionID: self.sectionIDTextField.text, path: self.pathTextField.text, token: self.tokenTextField.text)

        Environment.shared.apiService.upload(serverURL: serverURL, port: port, token: token, sectionId: sectionId, path: path) { result in
            switch result {
                case .failure(let err):
                    debugPrint("error \(err.localizedDescription)")
                    self.createAlertError(message: "Couldn't connect to Plex Server, check your URL and Port. Remember the Http(s) in the URL!")
                case .success(_):
                    self.createAlertComplete(title: "Upload complete!", message: "Check your playlists! If nothing happened, double check your data, token or section ID or path could be wrong.")
            }
        }
    }
    
}

