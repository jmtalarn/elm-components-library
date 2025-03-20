module Typography exposing (..)

import Html exposing (Html, h1, h2, h3, h4, h5, h6, p, small, text)


heading1 : String -> Html msg
heading1 content =
    h1 [] [ text content ]


heading2 : String -> Html msg
heading2 content =
    h2 [] [ text content ]


heading3 : String -> Html msg
heading3 content =
    h3 [] [ text content ]


heading4 : String -> Html msg
heading4 content =
    h4 [] [ text content ]


heading5 : String -> Html msg
heading5 content =
    h5 [] [ text content ]


heading6 : String -> Html msg
heading6 content =
    h6 [] [ text content ]


paragraph : String -> Html msg
paragraph content =
    p [] [ text content ]


smallText : String -> Html msg
smallText content =
    small [] [ text content ]
