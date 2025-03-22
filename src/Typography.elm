module Typography exposing (heading1, heading2, heading3, heading4, heading5, heading6, headingAttrs, paragraph, smallText)

import Css exposing (..)
import Html.Styled exposing (Html, h1, h2, h3, h4, h5, h6, p)
import Html.Styled.Attributes exposing (css)
import Theme


headingAttrs : Int -> List Style
headingAttrs headingSize =
    margin2 (rem 1) (px 0) :: Theme.theme.fonts.headers headingSize


heading1 : List (Html msg) -> Html msg
heading1 content =
    h1 [ css (headingAttrs 1) ] content


heading2 : List (Html msg) -> Html msg
heading2 content =
    h2 [ css (headingAttrs 2) ] content


heading3 : List (Html msg) -> Html msg
heading3 content =
    h3 [ css (headingAttrs 3) ] content


heading4 : List (Html msg) -> Html msg
heading4 content =
    h4 [ css (headingAttrs 4) ] content


heading5 : List (Html msg) -> Html msg
heading5 content =
    h5 [ css (headingAttrs 5) ] content


heading6 : List (Html msg) -> Html msg
heading6 content =
    h6 [ css (headingAttrs 6) ] content


paragraph : List (Html msg) -> Html msg
paragraph content =
    p [ css Theme.theme.fonts.body ] content


smallText : List (Html msg) -> Html msg
smallText content =
    Html.Styled.small [ css (Theme.theme.fonts.body ++ [ fontSize (px (Theme.config.fontSize * 0.8)) ]) ] content
