module Input exposing (checkboxInput, emailInput, numberInput, passwordInput, radioInput, selectInput, textInput, textareaInput)

import Css exposing (..)
import Css.Global exposing (adjacentSiblings, typeSelector)
import Html.Styled exposing (..)
import Html.Styled.Attributes as Attributes exposing (..)
import Theme


field : List Style -> List (Html msg) -> Html msg
field style content =
    let
        fieldAttrs =
            [ css
                (Theme.theme.fonts.body
                    ++ [ displayFlex
                       , alignItems center
                       , Css.property "gap" "calc(1rem / 2 )"
                       , flexWrap Css.wrap
                       ]
                    ++ style
                )
            ]
    in
    div fieldAttrs content


inputAttrs : Attribute msg
inputAttrs =
    css
        (Theme.theme.fonts.input
            ++ [ padding <| rem 0.5
               , flexGrow (num 1)
               , flexShrink (num 1)
               , boxSizing borderBox
               , Css.maxWidth (pct 100)

               -- , borderRadius (px 4)
               --    , border3 (px 1) solid Theme.theme.colors.primaryLight
               --    , outlineColor Theme.theme.colors.primaryDark
               ]
        )


textInput : { label : String, id : String } -> List (Attribute msg) -> Html msg
textInput { label, id } attrs =
    field []
        [ Html.Styled.label [ Attributes.for id ] [ text label ]
        , input ([ inputAttrs, type_ "text", Attributes.id id, placeholder "Write your thing" ] ++ attrs) []
        ]


passwordInput : { label : String, id : String } -> List (Attribute msg) -> Html msg
passwordInput { label, id } attrs =
    field []
        [ Html.Styled.label [ Attributes.for id ] [ text label ]
        , input ([ inputAttrs, type_ "password", Attributes.id id ] ++ attrs) []
        ]


emailInput : { label : String, id : String } -> List (Attribute msg) -> Html msg
emailInput { label, id } attrs =
    field []
        [ Html.Styled.label [ Attributes.for id ] [ text label ]
        , input ([ inputAttrs, type_ "email", Attributes.id id ] ++ attrs) []
        ]


numberInput : { label : String, id : String } -> List (Attribute msg) -> Html msg
numberInput { label, id } attrs =
    field []
        [ Html.Styled.label [ Attributes.for id ] [ text label ]
        , input ([ inputAttrs, type_ "number", Attributes.id id ] ++ attrs) []
        ]


textareaInput : { label : String, id : String, textValue : String } -> List (Attribute msg) -> Html msg
textareaInput { label, id, textValue } attrs =
    field [ alignItems Css.start ]
        [ Html.Styled.label [ Attributes.for id ] [ text label ]
        , textarea (inputAttrs :: attrs) [ text textValue ]
        ]


selectInput : { label : String, id : String, options : List (Html msg) } -> List (Attribute msg) -> Html msg
selectInput { label, id, options } attrs =
    field []
        [ Html.Styled.label [ Attributes.for id ] [ text label ]
        , select (inputAttrs :: attrs) (List.map (\o -> option [] [ o ]) options)
        ]


checkboxInput : { label : String, id : String } -> List (Attribute msg) -> Html msg
checkboxInput { label, id } attrs =
    field []
        [ input
            ([ type_ "checkbox"
             , Attributes.id id
             , css
                [ Css.display Css.none
                , pseudoClass "checked"
                    [ adjacentSiblings
                        [ typeSelector "label"
                            [ pseudoClass "after"
                                [ opacity (num 1) ]
                            , pseudoClass "before"
                                [ backgroundColor Theme.theme.colors.primary ]
                            ]
                        ]
                    ]
                ]
             ]
                ++ attrs
            )
            []
        , Html.Styled.label
            [ Attributes.for id
            , css
                [ position relative
                , Css.property "padding-left" (calc (rem 1.4) plus (px (Theme.config.fontSize / 2))).value
                , pseudoClass "after"
                    [ position absolute
                    , left (px 1)
                    , top (px 4)
                    , Css.width (px 16)
                    , Css.height (px 16)
                    , Css.property "content" "\"✓\""
                    , color (rgb 255 255 255)
                    , lineHeight (rem 1)
                    , fontSize (22 |> px)
                    , fontWeight bold
                    , display block
                    , opacity (num 0)
                    , textShadow4 (px 0) (px 0) (px 1) Theme.theme.colors.primary
                    ]
                , pseudoClass "before"
                    [ position absolute
                    , left (px 0)
                    , top (px 2)
                    , Css.width (px 18)
                    , Css.height (px 18)
                    , Css.property "content" "\"\""
                    , border3 (px 1) solid <| Theme.theme.colors.primary
                    ]
                ]
            ]
            [ text label ]
        ]


radioInput : { label : String, id : String } -> List (Attribute msg) -> Html msg
radioInput { label, id } attrs =
    field []
        [ input
            ([ type_ "radio"
             , Attributes.id id

             -- , css [ Css.width (rem 1.3)
             -- , Css.height (rem 1.3)
             -- , padding (px 0)
             -- , margin (px 0)
             , css
                [ Css.display Css.none
                , pseudoClass "checked"
                    [ adjacentSiblings
                        [ typeSelector "label"
                            [ pseudoClass "after"
                                [ opacity (num 1) ]
                            ]
                        ]
                    ]
                ]
             ]
                ++ attrs
            )
            []
        , Html.Styled.label
            [ Attributes.for id
            , css
                [ position relative
                , Css.property "padding-left" (calc (rem 1.4) plus (px (Theme.config.fontSize / 2))).value
                , pseudoClass "after"
                    [ position absolute

                    -- , Css.width (rem 1.4)
                    -- , Css.height (rem 1.4)
                    , Css.property "content" "\"⬤\""
                    , color Theme.theme.colors.primary
                    , left (px 4)
                    , top (px 5)

                    --, backgroundColor Theme.theme.colors.primary
                    --, lineHeight (rem 1)
                    , fontSize (px 8)
                    , fontWeight bold
                    , display block
                    , opacity (num 0)
                    , borderRadius (pct 50)
                    , textShadow4 (px 0) (px 0) (px 1) Theme.theme.colors.primary
                    ]
                , pseudoClass "before"
                    [ position absolute
                    , left (px 0)
                    , top (px 3)
                    , Css.width (px 16)
                    , Css.height (px 16)
                    , Css.property "content" "\"\""
                    , border3 (px 1) solid <| Theme.theme.colors.primary
                    , borderRadius (pct 50)
                    ]
                ]
            ]
            [ text label ]
        ]
