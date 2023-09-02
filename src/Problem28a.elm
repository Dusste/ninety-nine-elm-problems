module Problem28a exposing (..)

import Html exposing (Html, text)
import Html.Attributes exposing (style)
import List


sortByListLengths : List (List a) -> List (List a)
sortByListLengths xs =
    case xs of
        [] ->
            []

        [ oneList ] ->
            [ oneList ]

        firstList :: secondList :: restLists ->
            if List.length firstList < List.length secondList then
                firstList :: sortByListLengths (secondList :: restLists)

            else
                case secondList :: sortByListLengths (restLists ++ [ firstList ]) of
                    [] ->
                        []

                    [ oneList ] ->
                        [ oneList ]

                    x :: y :: rest ->
                        if List.length x < List.length y then
                            x :: sortByListLengths (y :: rest)

                        else
                            y :: sortByListLengths (rest ++ [ x ])


main : Html a
main =
    case test of
        0 ->
            Html.p [ style "color" "lime" ] [ text "Your implementation passed all tests." ]

        1 ->
            Html.p [ style "color" "orange" ] [ text "Your implementation failed one test." ]

        n ->
            Html.p [ style "color" "red" ] [ text <| "Your implementation failed " ++ Debug.toString n ++ " tests." ]


test : Int
test =
    List.length <|
        List.filter ((==) False)
            [ List.map List.length (sortByListLengths [ [], [ 1 ], List.range 1 2, List.range 1 3, List.range 1 4, List.range 1 5 ])
                == [ 0, 1, 2, 3, 4, 5 ]
            , List.map List.length (sortByListLengths [ [] ])
                == [ 0 ]
            , List.map List.length (sortByListLengths [ [], [ 1 ], List.range 1 100000, List.range 1 4, List.range 1 3, List.range 1 2 ])
                == [ 0, 1, 2, 3, 4, 100000 ]
            , List.map List.length (sortByListLengths [ [ 14 ], [ 15 ], [], [ 1 ], [ 12 ], [ 13 ] ])
                == [ 0, 1, 1, 1, 1, 1 ]
            , List.map List.length (sortByListLengths [ [ "a", "b", "c" ], [ "a", "b" ], [ "a" ] ])
                == [ 1, 2, 3 ]
            , List.map List.length (sortByListLengths [ [ 1 ], [ 2 ], [ 3, 4, 5 ], [ 6, 7, 8 ], [ 2, 3 ], [ 4, 5 ], [ 6, 7, 8, 9, 0 ] ])
                == [ 1, 1, 2, 2, 3, 3, 5 ]
            ]
