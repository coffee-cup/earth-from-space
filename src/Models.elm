module Models exposing (..)

import Array exposing (Array)
import Routing exposing (Sitemap)


type alias Url =
    String


type alias EarthId =
    String


type alias EarthData =
    { date : String
    , earthId : EarthId
    }


type Status
    = Loading
    | Fetched
    | Error


type alias Model =
    { earthDatas : Array EarthData
    , index : Int
    , status : Status
    , route : Sitemap
    }


initialModel : Sitemap -> Model
initialModel sitemap =
    { earthDatas = Array.fromList []
    , index = 0
    , status = Loading
    , route = sitemap
    }


currentEarth : Int -> Array EarthData -> EarthData
currentEarth index earthDatas =
    let
        modIndex =
            index % (Array.length earthDatas)
    in
        Array.get modIndex earthDatas
            |> Maybe.withDefault (EarthData "" "")
