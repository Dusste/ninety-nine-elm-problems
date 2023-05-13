module Problem16 exposing (..)

import Html exposing (Html, text)
import Html.Attributes exposing (style)
import List


dropNth : List a -> Int -> List a
dropNth list n =
    if n == 0 || n < 0 then
        list

    else
        dropNthHelper list n 1


dropNthHelper : List a -> Int -> Int -> List a
dropNthHelper lst everyNth iterations =
    case lst of
        [] ->
            []

        x :: xs ->
            if modBy everyNth iterations == 0 then
                dropNthHelper xs everyNth (iterations + 1)

            else
                [ x ] ++ dropNthHelper xs everyNth (iterations + 1)


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
            [ dropNth [ 1, 2, 5, 5, 2, 1 ] 2 == [ 1, 5, 2 ]
            , dropNth (List.range 1 20) 3 == [ 1, 2, 4, 5, 7, 8, 10, 11, 13, 14, 16, 17, 19, 20 ]
            , dropNth (List.range 1 5) 6 == [ 1, 2, 3, 4, 5 ]
            , dropNth (List.range 1 5) 0 == [ 1, 2, 3, 4, 5 ]
            , dropNth (List.range 1 5) -1 == [ 1, 2, 3, 4, 5 ]
            , dropNth (List.range 1 5) 1 == []
            , dropNth [ "1", "2", "3", "4", "5", "6" ] 2 == [ "1", "3", "5" ]
            ]
