module Problem9 exposing (main, pack)

import Html exposing (Html, text)
import Html.Attributes exposing (style)
import List


pack : List a -> List (List a)
pack lst =
    packHelper lst []


packHelper : List a -> List a -> List (List a)
packHelper list helperList =
    case list of
        [] ->
            [ [] ]

        [ a ] ->
            --[2]
            let
                isEmptyHelperList =
                    List.isEmpty helperList
            in
            if isEmptyHelperList then
                -- if helper list is empty that means last element is not same as repeated elements before - so we just append it alone
                [ helperList ++ [ a ] ]

            else
                -- we've covered this case in `if isEnd then` so we just return helperList
                [ helperList ]

        f :: s :: xs ->
            -- 1 :: 1 :: [2, 2]
            let
                isEnd =
                    List.isEmpty xs
            in
            if f == s then
                if isEnd then
                    --  last two elements are same - push them in
                    [] ++ packHelper (s :: xs) (helperList ++ [ f, s ])

                else
                    --  two same elements - push first and call list with second on the beggining
                    [] ++ packHelper (s :: xs) (helperList ++ [ f ])

            else
                -- elements don't match - return helperList with first element then call packHelper with reseted helperList
                [ helperList ++ [ f ] ] ++ packHelper (s :: xs) []


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
            [ pack [ 1, 1, 1, 1, 2, 5, 5, 7, 2, 2, 2, 1 ] == [ [ 1, 1, 1, 1 ], [ 2 ], [ 5, 5 ], [ 7 ], [ 2, 2, 2 ], [ 1 ] ]
            , pack [ 2, 1, 1, 1 ] == [ [ 2 ], [ 1, 1, 1 ] ]
            , pack [ 2, 2, 2, 1, 1, 1 ] == [ [ 2, 2, 2 ], [ 1, 1, 1 ] ]
            , pack [ 1, 1, 1, 2, 3, 3, 3, 4, 4, 4, 4, 5, 6, 6 ] == [ [ 1, 1, 1 ], [ 2 ], [ 3, 3, 3 ], [ 4, 4, 4, 4 ], [ 5 ], [ 6, 6 ] ]
            , pack [ 1, 1, 1, 1 ] == [ [ 1, 1, 1, 1 ] ]
            , pack [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ] == [ [ 1 ], [ 2 ], [ 3 ], [ 4 ], [ 5 ], [ 6 ], [ 7 ], [ 8 ], [ 9 ] ]
            , pack [ 1 ] == [ [ 1 ] ]
            , pack [] == [ [] ]
            , pack [ "aa", "aa", "aa" ] == [ [ "aa", "aa", "aa" ] ]
            , pack [ "aab", "b", "b", "aa" ] == [ [ "aab" ], [ "b", "b" ], [ "aa" ] ]
            ]
