module Problem19 exposing (..)

import Html exposing (Html, text)
import Html.Attributes exposing (style)
import List


rotate : Int -> List a -> List a
rotate rot list =
    let
        fromZeroToRot =
            list |> List.take rot

        afterRot =
            list |> List.drop rot
    in
    if List.isEmpty list then
        []

    else if rot < 0 then
        let
            rotFromBehind =
                if abs rot > List.length list then
                    List.length list - (abs rot - List.length list)

                else
                    List.length list - abs rot

            fromBackToRot =
                list |> List.take rotFromBehind

            dropFrom =
                list |> List.drop rotFromBehind
        in
        dropFrom ++ fromBackToRot

    else if rot > List.length list then
        let
            diff =
                rot - List.length list

            frmZeroToRot =
                list |> List.take diff

            aftrRot =
                list |> List.drop diff
        in
        aftrRot ++ frmZeroToRot

    else if rot == 0 then
        list

    else
        afterRot ++ fromZeroToRot


main : Html a
main =
    case test of
        0 ->
            Html.p [ style "color" "lime" ] [ text "Your implementation passed all tests." ]

        1 ->
            Html.p [ style "color" "red" ] [ text "Your implementation failed one test." ]

        n ->
            Html.p [ style "color" "red" ] [ text <| "Your implementation failed " ++ Debug.toString n ++ " tests." ]


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ rotate 3 [ 1, 2, 5, 5, 2, 1 ] == [ 5, 2, 1, 1, 2, 5 ]
            , rotate 13 (List.range 1 10) == [ 4, 5, 6, 7, 8, 9, 10, 1, 2, 3 ]
            , rotate 1 (List.range 1 5) == [ 2, 3, 4, 5, 1 ]
            , rotate 0 (List.range 1 5) == [ 1, 2, 3, 4, 5 ]
            , rotate -1 (List.range 1 5) == [ 5, 1, 2, 3, 4 ]
            , rotate -6 (List.range 1 5) == [ 5, 1, 2, 3, 4 ]
            , rotate 5 (List.range 1 5) == [ 1, 2, 3, 4, 5 ]
            , rotate 3 (List.range 1 5) == [ 4, 5, 1, 2, 3 ]
            , rotate 1 [ "1", "2", "3", "4" ] == [ "2", "3", "4", "1" ]
            , rotate 1 [] == []
            ]
