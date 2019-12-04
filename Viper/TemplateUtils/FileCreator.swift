//
//  FileCreator.swift
//  Viper
//
//  Created by Selim KURNAZ on 19.09.2019.
//  Copyright © 2019 Selim KURNAZ. All rights reserved.
// file:///Users/selimkurnaz/Desktop/SelamXXInteractor.swift

import Foundation


class FileCreator {
    
    func createFile(content: String, fileName: String, url: URL?){
        let c = content
        var filePath = url ?? getDocumentsDirectory()
        filePath = filePath.appendingPathComponent(fileName)
        do {
            try c.write(to: filePath, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print(error)
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
}
