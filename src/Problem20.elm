module Problem20 exposing (..)

import Html exposing (Html, text)
import Html.Attributes exposing (style)
import List


dropAt : Int -> List a -> List a
dropAt n list =
    dropHelper list n 1


dropHelper : List a -> Int -> Int -> List a
dropHelper lst num count =
    case lst of
        [] ->
            []

        x :: xs ->
            if count /= num then
                let
                    countInc =
                        count + 1
                in
                [ x ] ++ dropHelper xs num countInc

            else
                xs ++ dropHelper [] num 1


main : Html a
main =
    case test of
        0 ->
            Html.p [ style "color" "green" ] [ text "Your implementation passed all tests." ]

        1 ->
            Html.p [ style "color" "red" ] [ text "Your implementation failed one test." ]

        n ->
            Html.p [ style "color" "red" ] [ text <| "Your implementation failed " ++ Debug.toString n ++ " tests." ]


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ dropAt 2 [ 1, 2, 5, 5, 2, 1 ] == [ 1, 5, 5, 2, 1 ]
            , dropAt 3 (List.range 1 14) == [ 1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14 ]
            , dropAt 6 (List.range 1 5) == [ 1, 2, 3, 4, 5 ]
            , dropAt 0 (List.range 1 5) == [ 1, 2, 3, 4, 5 ]
            , dropAt -1 (List.range 1 5) == [ 1, 2, 3, 4, 5 ]
            , dropAt 1 (List.range 1 5) == [ 2, 3, 4, 5 ]
            , dropAt 2 [ "1", "2", "3", "4", "5" ] == [ "1", "3", "4", "5" ]
            ]
