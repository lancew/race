module HomePage exposing (main)

import Browser
import Html exposing (Html, button, div, h1, hr, p, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    { weeks : Int
    , week : Int
    , yacht1Progress : Int
    , yacht2Progress : Int
    , yacht3Progress : Int
    }


init : Model
init =
    { weeks = 12
    , week = 1
    , yacht1Progress = 1
    , yacht2Progress = 1
    , yacht3Progress = 1
    }


type Msg
    = IncrementWeek
    | DecrementWeek


update : Msg -> Model -> Model
update msg model =
    case msg of
        IncrementWeek ->
            { model | week = model.week + 1 }

        DecrementWeek ->
            { model | week = model.week - 1 }


view : Model -> Html Msg
view model =
    div [ class "jumbotron" ]
        [ h1 [] [ text ("The Race week: " ++ String.fromInt model.week ++ " of " ++ String.fromInt model.weeks) ]
        , hr [] []
        , p []
            [ text ("Yacht 1: " ++ String.fromInt model.yacht1Progress) ]
        , p []
            [ text ("Yacht 2: " ++ String.fromInt model.yacht2Progress) ]
        , p []
            [ text ("Yacht 3: " ++ String.fromInt model.yacht3Progress) ]
        , hr [] []
        , p []
            [ text "Week : "
            , button [ onClick IncrementWeek ] [ text "+" ]
            , button [ onClick DecrementWeek ] [ text "-" ]
            ]
        ]
