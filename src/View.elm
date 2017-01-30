module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, href, classList, src)
import Html.Events exposing (onClick)
import Messages exposing (Msg(..))
import Models exposing (..)
import Routing exposing (Sitemap(..))
import ViewUtils exposing (..)
import Utils exposing (..)
import Earth exposing (..)


view : Model -> Html Msg
view model =
    div [ class "ph6-ns ph4-m ph3 bg-black" ]
        [ div [ class "full" ] [ page model ]
        , footer
        ]



-- Router


page : Model -> Html Msg
page model =
    case model.route of
        HomeRoute ->
            homeView model

        AboutRoute ->
            aboutView model

        NotFoundRoute ->
            notFoundView


footer : Html Msg
footer =
    div [ class "footer pb4" ]
        [ p [ class "f5 text-lightgray" ]
            [ text "Data from "
            , a
                [ href "https://epic.gsfc.nasa.gov/about/api" ]
                [ text "DSCOVR's Earth Polychromatic Imaging Camera (EPIC)" ]
            ]
        , p [ class "f5 text-lightgray" ]
            [ text "Made with ♥ by "
            , a [ href "https://jakerunzer.xyz", class "dim pointer text-lightgray" ] [ text " jake runzer" ]
            , text "."
            ]
        ]


earthImage : EarthId -> Html Msg
earthImage earthId =
    let
        imageUrl =
            createEarthLink earthId
    in
        div [ class "earth-image fade-in" ]
            [ img [ src imageUrl ] [] ]


fetchedEarthView : EarthData -> Html Msg
fetchedEarthView earthData =
    div [ class "earth w-100 cf full vertical-center" ]
        [ div [ class "fl w-40-l w-100 fade-in" ]
            [ h1 [ class "f1 mb0 tr" ] [ text "Earth from Space" ]
            , p [ class "f3 text-lightgray tr mono" ] [ text (formatDate earthData.date) ]
            ]
        , div [ class "fl w-60-l w-100" ]
            [ earthImage earthData.earthId
            ]
        ]


earthLoader : Html Msg
earthLoader =
    div [ class "vertical-center full" ]
        [ loader
        ]


getEarthView : Model -> Html Msg
getEarthView model =
    case model.status of
        Loading ->
            earthLoader

        Fetched ->
            fetchedEarthView model.earthData



-- Routes


homeView : Model -> Html Msg
homeView model =
    div [ class "full" ]
        [ getEarthView model
        ]


aboutView : Model -> Html Msg
aboutView model =
    div [ class "about" ]
        [ headingLarge "About"
        , p [ class "measure" ] [ text "About this site." ]
        , a [ onClick ShowHome, class "f1 none dim" ] [ text "←" ]
        ]


notFoundView : Html Msg
notFoundView =
    div [ class "not-found full vertical-center" ]
        [ div []
            [ h2 [ class "f2 mv4 mono" ] [ text "¯\\_(ツ)_/¯" ]
            , p [ class "measure" ]
                [ text "Page not found. "
                , a [ onClick ShowHome, class "pointer su-colour" ] [ text "Go home" ]
                , text "."
                ]
            ]
        ]
