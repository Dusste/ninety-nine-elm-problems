module Problem23 exposing (..)

import Browser
import Html exposing (Html, button, div, h2, p, text)
import Html.Attributes exposing (style)
import Html.Events exposing (..)
import List exposing (drop, length, take)
import Random exposing (Generator, Seed, initialSeed, int, step)


randomSelect : Random.Seed -> Int -> List a -> ( List a, Random.Seed )
randomSelect seed n list =
    let
        ( randomInt, seed1 ) =
            Random.step (Random.int 0 n) seed
    in
    ( [], seed )



-- Main


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }



-- MODEL


type alias Model =
    { intSeed : Int
    , tested : Bool
    , failedCount : Int
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model 1 False 0, Cmd.none )



-- UPDATE


type Msg
    = Test
    | NewFace Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Test ->
            ( model, Random.generate NewFace (Random.int Random.minInt Random.maxInt) )

        NewFace newSeed ->
            ( Model newSeed True (test model.intSeed), Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    let
        stringFromList =
            Tuple.first (randomSelect (Random.initialSeed model.intSeed) 1 (List.range 1 6)) |> Debug.toString
    in
    div []
        [ viewMsg model.tested model.failedCount
        , p [] [ text ("Seed value: " ++ String.fromInt model.intSeed) ]
        , p [] [ text ("Your die roll is " ++ stringFromList) ]
        , button [ onClick Test ] [ text "Test" ]
        ]


{-| return the number of failed tests
-}
test : Int -> Int
test intSeed =
    let
        seed =
            Random.initialSeed intSeed

        ( l1, s1 ) =
            randomSelect seed 3 (List.range 1 1000)

        ( l2, s2 ) =
            randomSelect seed 3 (List.range 1 1000)

        ( l3, s3 ) =
            randomSelect s2 3 (List.range 1 1000)

        ( l4, s4 ) =
            randomSelect s3 9 (List.range 1 9)

        ( l5, s5 ) =
            randomSelect s4 3 [ "a", "b" ]

        ( l6, s6 ) =
            randomSelect s5 0 [ 'a', 'b' ]

        ( l7, s7 ) =
            randomSelect s6 -1 [ 'a', 'b' ]

        ( l8, s8 ) =
            randomSelect s6 1 []
    in
    List.length <|
        List.filter ((==) False)
            [ List.sort l1 == List.sort l2
            , l2 /= l3

            -- a billion to one that this won't match
            , List.sort l4 == List.range 1 9
            , List.sort l5 == [ "a", "b" ]
            , l6 == []
            , l7 == []
            , l8 == []
            ]


viewMsg : Bool -> Int -> Html Msg
viewMsg tested failedCount =
    if tested then
        case failedCount of
            0 ->
                Html.p [ style "color" "lime" ] [ text "Your implementation passed all tests." ]

            1 ->
                Html.p [ style "color" "red" ] [ text "Your implementation failed one test." ]

            x ->
                Html.p [ style "color" "red" ] [ text <| "Your implementation failed " ++ String.fromInt x ++ " tests." ]

    else
        Html.p [] [ text "Click the test button below" ]
