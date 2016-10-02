//
//  Version+TCX.swift
//  Pods
//
//  Created by Jelle Vandebeeck on 02/10/2016.
//
//

import AEXML

extension Version: TCXable {

    convenience init?(tcx element: AEXMLElement) {
        // When the element is an error, don't create the instance.
        if let _ = element.error {
            return nil
        }
        self.init()

        if
            let majorVersion = element["VersionMajor"].optionalString,
            let minorVersion = element["VersionMinor"].optionalString {
            versionNumber = "\(majorVersion).\(minorVersion)"
        }
        if
            let majorBuild = element["BuildMajor"].optionalString,
            let minorBuild = element["BuildMinor"].optionalString {
            buildNumber = "\(majorBuild).\(minorBuild)"
        }
    }
    
}
