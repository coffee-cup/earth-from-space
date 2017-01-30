module Earth exposing (..)

import Models exposing (Url, EarthId)


createEarthLink : EarthId -> Url
createEarthLink earthId =
    "https://epic.gsfc.nasa.gov/archive/natural/2017/01/28/jpg/" ++ earthId ++ ".jpg"


naturalUrl : Url
naturalUrl =
    "https://epic.gsfc.nasa.gov/api/natural"
