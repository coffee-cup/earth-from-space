module Earth exposing (..)

import Date exposing (Date)
import Models exposing (Url, EarthId)
import Utils exposing (stringToDate, monthToNumber)


createEarthLink : EarthId -> String -> Url
createEarthLink earthId dateString =
    let
        date =
            stringToDate dateString

        year =
            Date.year date

        month =
            Date.month date

        day =
            Date.day date
    in
        "https://epic.gsfc.nasa.gov/archive/natural/"
            ++ (toString year)
            ++ "/"
            ++ (month |> monthToNumber |> toString |> String.padLeft 2 '0')
            ++ "/"
            ++ (day |> toString |> String.padLeft 2 '0')
            ++ "/jpg/"
            ++ earthId
            ++ ".jpg"


naturalUrl : Url
naturalUrl =
    "https://epic.gsfc.nasa.gov/api/natural"
