//
//  ViewController.swift
//  Viper
//
//  Created by Selim KURNAZ on 19.09.2019.
//  Copyright © 2019 Selim KURNAZ. All rights reserved.
//

import Cocoa
import Mustache

class ViewController: NSViewController {

    var selectedFolder: URL?
    @IBOutlet weak var moduleNameTextField: NSTextField!

    
    @IBOutlet weak var copyrightTextField: NSTextField!
    @IBOutlet weak var authorNAmeTextField: NSTextField!
    @IBOutlet weak var prijectNameTextField: NSTextField!
    var templates: [TemplateType] = [.Interactor, .InteractorIO, .Wireframe, .Presenter, .ModuleInterface, .ViewController, .ViewInterface]
    var fileCreator = FileCreator()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func openTargetPath(_ sender: Any) {
        guard let window = view.window else { return }
        
        let panel = NSOpenPanel()
        panel.canChooseFiles = false
        panel.canChooseDirectories = true
        panel.allowsMultipleSelection = false
        
        panel.beginSheetModal(for: window) { (result) in
            if result == NSApplication.ModalResponse.OK {
                self.selectedFolder =  panel.urls[0]
            }
        }
    }
    
    @IBAction func generateFiles(_ sender: Any) {
        let moduleName = moduleNameTextField.stringValue
        let copyright = copyrightTextField.stringValue
        let author = authorNAmeTextField.stringValue
        let projectName = prijectNameTextField.stringValue
        
        
        for t in templates {
            let tName = t.gettemplateName(name: moduleName)
            let template = try! Template(named: tName)
            let data = [
                "name": moduleName,
                "copyright": copyright,
                "author": author,
                "projectName": projectName
            ]
            let rendering = try! template.render(data)
            let resultName = t.getResultName(name: moduleName)
            fileCreator.createFile(content: rendering, fileName: resultName, url: selectedFolder)
        }
    }
    
   
    
}

