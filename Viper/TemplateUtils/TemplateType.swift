//
//  TemplateType.swift
//  Viper
//
//  Created by Selim KURNAZ on 19.09.2019.
//  Copyright © 2019 Selim KURNAZ. All rights reserved.
//

import Foundation


enum TemplateType {
    case Wireframe
    case Presenter
    case Interactor
    case ViewController
    case ViewInterface
    case ModuleInterface
    case InteractorIO
    
    func getResultName(name: String) -> String {
      switch self {
        case .Wireframe:
            return name+"Wireframe.swift"
        case .Presenter:
            return name+"Presenter.swift"
        case .Interactor:
            return name+"Interactor.swift"
        case .ViewController:
            return name+"ViewController.swift"
        case .ViewInterface:
            return name+"ViewInterface.swift"
        case .ModuleInterface:
            return name+"ModuleInterface.swift"
        case .InteractorIO:
            return name+"InteractorIO.swift"
        }
    }
    
    func gettemplateName(name: String) -> String {
        switch self {
        case .Wireframe:
            return "Wireframe"
        case .Presenter:
            return "Presenter"
        case .Interactor:
            return "Interactor"
        case .ViewController:
            return "ViewController"
        case .ViewInterface:
            return "ViewInterface"
        case .ModuleInterface:
            return "ModuleInterface"
        case .InteractorIO:
            return "InteractorIO"
        }
    }
}
