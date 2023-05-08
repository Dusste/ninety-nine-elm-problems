module Problem18 exposing (..)

import Html exposing (Html, text)
import Html.Attributes exposing (style)
import List


sublist : Int -> Int -> List a -> List a
sublist start end list =
    sublistHelper start end list list 0


sublistHelper : Int -> Int -> List a -> List a -> Int -> List a
sublistHelper s e lst initialList cnt =
    let
        rStart =
            if s < 0 then
                0

            else if s > List.length initialList then
                List.length initialList + 1

            else
                s

        rEnd =
            if e < 0 then
                0

            else if e > List.length initialList then
                List.length initialList + 1

            else
                e

        count =
            cnt + 1
    in
    case lst of
        [] ->
            []

        x :: xs ->
            if count < rStart || count > rEnd then
                sublistHelper rStart rEnd xs initialList count

            else
                x :: sublistHelper rStart rEnd xs initialList count


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
            [ True
            , sublist 3 7 (List.range 1 10) == List.range 3 7 -- [1,2,3,4,5,6,7,8,9,10] -- [3,4,5,6,7]
            , sublist 2 100 [ 'a', 'b', 'c' ] == [ 'b', 'c' ]
            , sublist -1 2 (List.range 1 100) == [ 1, 2 ]
            , sublist 11 20 (List.range 1 10) == []
            , sublist -3 -2 [ -3, -2, -1, 0, 1, 2, 3 ] == []
            , sublist 5 3 [ "indices", " are", "inverted" ] == []
            , sublist 0 1 (List.range 1 10) == [ 1 ]
            , sublist -7 -3 (List.range 1 10) == []
            ]
