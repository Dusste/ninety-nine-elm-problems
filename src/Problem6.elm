module Problem6 exposing (isPalindrome, main)

import Html exposing (Html, text)
import Html.Attributes exposing (style)
import List


isPalindrome : List a -> Bool
isPalindrome lst =
    let
        -- for the two occasion it will add single entry, for more than two it will add additional (ex: [1,1,2,2] == [[1], [2]] VS [1,1,1,2,2,2] == [[1], [1], [2], [2]])
        listOfDubleOccasions : List a -> List (List a)
        listOfDubleOccasions ls =
            case ls of
                [] ->
                    []

                x :: xs ->
                    if List.member x xs then
                        [ x ] :: listOfDubleOccasions xs

                    else
                        listOfDubleOccasions xs

        halfListLength : Int
        halfListLength =
            List.length lst // 2
    in
    -- half of list length should be exactly equal to length of listOfDubleOccasions
    lst
        |> listOfDubleOccasions
        |> List.concat
        |> List.length
        |> (==) halfListLength


main : Html a
main =
    case test of
        0 ->
            Html.p [ style "color" "lime" ] [ text "Your implementation passed all tests." ]

        1 ->
            Html.p [ style "color" "red" ] [ text "Your implementation failed one test." ]

        x ->
            Html.p [ style "color" "red" ] [ text <| "Your implementation failed " ++ Debug.toString x ++ " tests." ]


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ isPalindrome [ 1, 3, 5, 8, 5, 3, 1 ] == True
            , isPalindrome [ 9.87, 5.33, 6.22, 0.98, 1.01, 9.87, 5.33, 6.22, 0.98 ] == True
            , isPalindrome [ 2, 1 ] == False
            , isPalindrome [ 1 ] == True
            , isPalindrome [ 9.87, 5.33, 6.22, 0.98, 1.01 ] == False
            , isPalindrome [] == True
            , isPalindrome [ 10001, 899, 6544, 342571, 987265123, 10001, 342571, 6544, 899 ] == True
            , isPalindrome [ "aa", "bb", "aa" ] == True
            , isPalindrome [ "aab", "b", "aa" ] == False
            ]
