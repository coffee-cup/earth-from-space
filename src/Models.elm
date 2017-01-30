module Models exposing (..)

import Date exposing (Date, now)
import Routing exposing (Sitemap)


type alias Url =
    String


type alias EarthId =
    String


type alias EarthData =
    { date : Date
    , earthId : EarthId
    }


initEarthData : EarthData
initEarthData =
    EarthData (Date.fromTime 0) "epic_1b_20170128005515_01"


type Status
    = Loading
    | Fetched


type alias Model =
    { earthData : EarthData
    , status : Status
    , route : Sitemap
    }


initialModel : Sitemap -> Model
initialModel sitemap =
    { earthData = initEarthData
    , status = Loading
    , route = sitemap
    }
