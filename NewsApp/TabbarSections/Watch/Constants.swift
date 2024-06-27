//
//  Constants.swift
//  NewsApp
//
//  Created by Seymur Naim on 27.06.24.
//

import Foundation


struct Constants {
    static var ApiKey = "AIzaSyCKtz7focsUZCGrpxPA0D_bOyXF0rFIVag"
    static var PlaylistID = "PLcuvtB_dtDpzSe1nOMinHyVqCqDisKV4h"
    static var ApiUrl = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PlaylistID)&key=[\(Constants.ApiKey)]"
}

