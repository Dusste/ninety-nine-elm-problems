module Main exposing (main)

import Browser
import Html exposing (Html)
import Html.Attributes exposing (href)
import Problem1
import Problem10
import Problem11
import Problem2
import Problem3
import Problem4
import Problem5
import Problem6
import Problem7
import Problem8
import Problem9
import ProblemExtra1
import ProblemExtra2


main : Program () Model Msg
main =
    Browser.sandbox { init = initialModel, update = update, view = view }


initialModel : Model
initialModel =
    { something = ""
    }


type Msg
    = NoOp


type alias Model =
    { something : String
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model


view : Model -> Html msg
view _ =
    Html.div []
        [ mainHeading
        , infoSection
        , problem1Wrapper
        ]


mainHeading : Html msg
mainHeading =
    Html.div []
        [ Html.h1 []
            [ Html.a [ href "https://johncrane.gitbooks.io/ninety-nine-elm-problems/content/" ] [ Html.text "99 Problems solved in ELM " ]
            , Html.text "by Dusan Stevanovic"
            ]
        ]


infoSection : Html msg
infoSection =
    Html.div []
        [ Html.p []
            [ Html.text "These problems are adaptations for Elm from Ninety-Nine Haskell Problems, which are adaptations of Ninety-Nine Prolog Problems developed by Werner Hett. The title is more figurative than literal. There weren't 99 problems in the original Prolog collection. A few of the original Prolog problems don't apply to Elm. The numbering of the problems is consistent with the other collections to ease comparisons. Other adaptations include Lisp, Scala, OCaml, Python and R."
            ]
        ]


problem1Wrapper : Html msg
problem1Wrapper =
    Html.div []
        [ Html.div []
            [ Html.h2 [] [ Html.text "Problem 1" ]
            , Html.div []
                [ Html.p [] [ Html.text "Write a function last that returns the last element of a list. An empty list doesn't have a last element, therefore last must return a Maybe." ]
                , Problem1.main
                ]
            , Html.div []
                [ Html.p [] [ Html.text "Input:" ]
                , Html.p [] [ Html.text "[ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]" ]
                , Html.p [] [ Html.text "Solution:" ]
                , Html.text (Debug.toString (Problem1.last [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]))
                ]
            ]
        , Html.div []
            [ Html.h2 [] [ Html.text "Problem 2" ]
            , Html.div []
                [ Html.p [] [ Html.text "Implement the function penultimate to find the next to last element of a list." ]
                , Problem2.main
                ]
            , Html.div []
                [ Html.p [] [ Html.text "Input:" ]
                , Html.p [] [ Html.text "[ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]" ]
                , Html.p [] [ Html.text "Solution:" ]
                , Html.text (Debug.toString (Problem2.penultimate [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]))
                ]
            ]
        , Html.div []
            [ Html.h2 [] [ Html.text "Problem 3" ]
            , Html.div []
                [ Html.p [] [ Html.text "Implement the function elementAt to return the n-th element of a list. The index is 1-relative, that is, the first element is at index 1." ]
                , Problem3.main
                ]
            , Html.div []
                [ Html.p [] [ Html.text "Input:" ]
                , Html.p [] [ Html.text "[ 1001, 44, 3, 789, 54, 33 ] find second(2) element in a list" ]
                , Html.p [] [ Html.text "Solution:" ]
                , Html.text (Debug.toString (Problem3.elementAt [ 1001, 44, 3, 789, 54, 33 ] 2))
                ]
            ]
        , Html.div []
            [ Html.h2 [] [ Html.text "Problem 4" ]
            , Html.div []
                [ Html.p [] [ Html.text "Elm provides the function List.length. See if you can implement it yourself." ]
                , Problem4.main
                ]
            , Html.div []
                [ Html.p [] [ Html.text "Input:" ]
                , Html.p [] [ Html.text "[1, 2, 3, 4, 3, 2, 1]" ]
                , Html.p [] [ Html.text "Solution:" ]
                , Html.text (Debug.toString (Problem4.countElements [ 1, 2, 3, 4, 3, 2, 1 ]))
                ]
            ]
        , Html.div []
            [ Html.h2 [] [ Html.text "Problem 5" ]
            , Html.div []
                [ Html.p [] [ Html.text "Elm provides the function List.reverse to reverse the order of elements in a list. See if you can implement it." ]
                , Problem5.main
                ]
            , Html.div []
                [ Html.p [] [ Html.text "Input:" ]
                , Html.p [] [ Html.text "[ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k' ]" ]
                , Html.p [] [ Html.text "Solution:" ]
                , Html.text (Debug.toString (Problem5.myReverse [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k' ]))
                ]
            ]
        , Html.div []
            [ Html.h2 [] [ Html.text "Problem 6" ]
            , Html.div []
                [ Html.p [] [ Html.text "Determine if a list is a palindrome, that is, the list is identical when read forward or backward." ]
                , Problem6.main
                ]
            , Html.div []
                [ Html.p [] [ Html.text "Input:" ]
                , Html.p [] [ Html.text "[ 1, 3, 5, 8, 5, 3, 1 ]" ]
                , Html.p [] [ Html.text "Solution:" ]
                , Html.text (Debug.toString (Problem6.isPalindrome [ 1, 3, 5, 8, 5, 3, 1 ]))
                ]
            ]
        , Html.div []
            [ Html.h2 [] [ Html.text "Problem 7" ]
            , Html.div []
                [ Html.p [] [ Html.text "Flatten a nested lists into a single list. Because Lists in Elm are homogeneous we need to define what a nested list is." ]
                , Problem7.main
                ]
            , Html.div []
                [ Html.p [] [ Html.text "Input:" ]
                , Html.p [] [ Html.text <| Debug.toString Problem7.nl2 ]
                , Html.p [] [ Html.text "Solution:" ]
                , Html.text (Debug.toString <| Problem7.flatten Problem7.nl2)
                ]
            ]
        , Html.div []
            [ Html.h2 [] [ Html.text "Extra 1" ]
            , Html.div []
                [ Html.p [] [ Html.text "Drop items from the start of a list until an item does not satisfy criteria specified by a function." ]
                , ProblemExtra1.main
                ]
            , Html.div []
                [ Html.p [] [ Html.text "Input:" ]
                , Html.p [] [ Html.text <| Debug.toString (List.range 1 10) ]
                , Html.p [] [ Html.text "Solution:" ]
                , Html.text (Debug.toString <| ProblemExtra1.dropWhile ((>) 5) (List.range 1 10))
                ]
            ]
        , Html.div []
            [ Html.h2 [] [ Html.text "Extra 2" ]
            , Html.div []
                [ Html.p [] [ Html.text "Keep elements from the start of a list while they satisfy a condition." ]
                , ProblemExtra2.main
                ]
            , Html.div []
                [ Html.p [] [ Html.text "Input:" ]
                , Html.p [] [ Html.text <| Debug.toString (List.range 1 10) ]
                , Html.p [] [ Html.text "Solution:" ]
                , Html.text (Debug.toString <| ProblemExtra2.takeWhile ((>) 5) (List.range 1 10))
                ]
            ]
        , Html.div []
            [ Html.h2 [] [ Html.text "Problem 8" ]
            , Html.div []
                [ Html.p [] [ Html.text "Write a function to remove consecutive duplicates of list elements." ]
                , Problem8.main
                ]
            , Html.div []
                [ Html.p [] [ Html.text "Input:" ]
                , Html.p [] [ Html.text <| Debug.toString [ 3, 3, 4, 3, 4, 4 ] ]
                , Html.p [] [ Html.text "Solution:" ]
                , Html.text (Debug.toString <| Problem8.noDupes [ 3, 3, 4, 3, 4, 4 ])
                ]
            ]
        , Html.div []
            [ Html.h2 [] [ Html.text "Problem 9" ]
            , Html.div []
                [ Html.p [] [ Html.text "Convert a list to a list of lists where repeated elements of the source list are packed into sublists. Elements that are not repeated should be placed in a one element sublist." ]
                , Problem9.main
                ]
            , Html.div []
                [ Html.p [] [ Html.text "Input:" ]
                , Html.p [] [ Html.text <| Debug.toString [ 1, 1, 1, 2, 3, 3, 3, 4, 4, 4, 4, 5, 6, 6 ] ]
                , Html.p [] [ Html.text "Solution:" ]
                , Html.text (Debug.toString <| Problem9.pack [ 1, 1, 1, 2, 3, 3, 3, 4, 4, 4, 4, 5, 6, 6 ])
                ]
            ]
        , Html.div []
            [ Html.h2 [] [ Html.text "Problem 10" ]
            , Html.div []
                [ Html.p [] [ Html.text "Run-length encode a list of list to a list of tuples. Unlike lists, tuples can mix types. Use tuples (n, e) to encode a list where n is the number of duplicates of the element e." ]
                , Problem10.main
                ]
            , Html.div []
                [ Html.p [] [ Html.text "Input:" ]
                , Html.p []
                    [ Html.text <|
                        Debug.toString
                            [ [ 'a', 'a', 'a' ]
                            , [ 'b' ]
                            , [ 'c', 'c', 'c' ]
                            , [ 'd', 'd', 'd', 'd' ]
                            , [ 'e' ]
                            , [ 'f', 'f' ]
                            ]
                    ]
                , Html.p [] [ Html.text "Solution:" ]
                , Html.text
                    (Debug.toString <|
                        Problem10.runLengths
                            [ [ 'a', 'a', 'a' ]
                            , [ 'b' ]
                            , [ 'c', 'c', 'c' ]
                            , [ 'd', 'd', 'd', 'd' ]
                            , [ 'e' ]
                            , [ 'f', 'f' ]
                            ]
                    )
                ]
            ]
        , Html.div []
            [ Html.h2 [] [ Html.text "Problem 11" ]
            , Html.div []
                [ Html.p [] [ Html.text "Write a function to run length encode a list, but instead of using a tuple as in problem 10, use a union data type" ]
                , Problem11.main
                ]
            , Html.div []
                [ Html.p [] [ Html.text "Input:" ]
                , Html.p [] [ Html.text <| Debug.toString [ 1, 1, 1, 1, 2, 3, 3, 4, 5, 5, 5, 5, 5, 5 ] ]
                , Html.p [] [ Html.text "Solution:" ]
                , Html.text (Debug.toString <| Problem11.rleEncode [ 1, 1, 1, 1, 2, 3, 3, 4, 5, 5, 5, 5, 5, 5 ])
                ]
            ]
        ]
