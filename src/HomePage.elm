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
    | IncrementYacht1
    | DecrementYacht1
    | IncrementYacht2
    | DecrementYacht2
    | IncrementYacht3
    | DecrementYacht3


update : Msg -> Model -> Model
update msg model =
    case msg of
        IncrementWeek ->
            { model | week = model.week + 1 }

        DecrementWeek ->
            { model | week = model.week - 1 }

        IncrementYacht1 ->
            { model | yacht1Progress = model.yacht1Progress + 1 }

        DecrementYacht1 ->
            { model | yacht1Progress = model.yacht1Progress - 1 }

        IncrementYacht2 ->
            { model | yacht2Progress = model.yacht2Progress + 1 }

        DecrementYacht2 ->
            { model | yacht2Progress = model.yacht2Progress - 1 }
        
        IncrementYacht3 ->
            { model | yacht3Progress = model.yacht3Progress + 1 }

        DecrementYacht3 ->
            { model | yacht3Progress = model.yacht3Progress - 1 }



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
        , p []
            [ text "Yacht 1 : "
            , button [ onClick IncrementYacht1 ] [ text "+" ]
            , button [ onClick DecrementYacht1 ] [ text "-" ]
            ]
        , p []
            [ text "Yacht 2 : "
            , button [ onClick IncrementYacht2 ] [ text "+" ]
            , button [ onClick DecrementYacht2 ] [ text "-" ]
            ]
        , p []
            [ text "Yacht 3 : "
            , button [ onClick IncrementYacht3 ] [ text "+" ]
            , button [ onClick DecrementYacht3 ] [ text "-" ]
            ]
        ]
