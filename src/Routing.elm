module Routing exposing (..)

import Navigation exposing (Location)
import Route exposing (..)


type Sitemap
    = HomeRoute
    | AboutRoute
    | NotFoundRoute


homeR : Route.Route Sitemap
homeR =
    HomeRoute := static ""


aboutR : Route.Route Sitemap
aboutR =
    AboutRoute := static "about"


sitemap : Route.Router Sitemap
sitemap =
    router [ homeR, aboutR ]


match : String -> Sitemap
match =
    Route.match sitemap
        >> Maybe.withDefault NotFoundRoute


toString : Sitemap -> String
toString r =
    case r of
        HomeRoute ->
            reverse homeR []

        AboutRoute ->
            reverse aboutR []

        NotFoundRoute ->
            "/404"


mainTitle : String
mainTitle =
    "Earth from Space"


pageTitle : Sitemap -> String
pageTitle r =
    case r of
        HomeRoute ->
            mainTitle

        AboutRoute ->
            mainTitle ++ " - About"

        NotFoundRoute ->
            "Not Found"


parseLocation : Location -> Sitemap
parseLocation location =
    match location.pathname


navigateTo : Sitemap -> Cmd msg
navigateTo =
    toString >> Navigation.newUrl
