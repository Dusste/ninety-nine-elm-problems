module Problem11 exposing (..)

import Html exposing (Html, text)
import Html.Attributes exposing (style)
import List


type RleCode a
    = Run Int a
    | Single a


rleEncode : List a -> List (RleCode a)
rleEncode list =
    rleEncodeHelper list 0


rleEncodeHelper : List a -> Int -> List (RleCode a)
rleEncodeHelper lst counter =
    case lst of
        [] ->
            []

        [ x ] ->
            if counter == 0 then
                [ Single x ]

            else
                [ Run (counter + 1) x ] ++ rleEncodeHelper [] 0

        x :: y :: xs ->
            -- 1 :: 1 :: [1,2,2,3,...]
            let
                continue =
                    x == y
            in
            if continue then
                rleEncodeHelper (y :: xs) (counter + 1)

            else if counter == 0 then
                Single x :: rleEncodeHelper (y :: xs) 0

            else
                [ Run (counter + 1) x ] ++ rleEncodeHelper (y :: xs) 0


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
            [ rleEncode [ 1, 1, 1, 1, 2, 5, 5, 2, 1 ]
                == [ Run 4 1, Single 2, Run 2 5, Single 2, Single 1 ]
            , rleEncode [ 2, 1, 1, 1 ] == [ Single 2, Run 3 1 ]
            , rleEncode [ 2, 2, 2, 1, 1, 1 ] == [ Run 3 2, Run 3 1 ]
            , rleEncode [ 1 ] == [ Single 1 ]
            , rleEncode [] == []
            , rleEncode [ "aa", "aa", "aa" ] == [ Run 3 "aa" ]
            , rleEncode [ "aab", "b", "b", "aa" ]
                == [ Single "aab", Run 2 "b", Single "aa" ]
            ]
