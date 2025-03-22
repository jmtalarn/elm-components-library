import "./style.css"
import { Elm } from './Book/Book.elm'

Elm.Book.Book.init({
  node: document.querySelector('#app'), flags: "Initial Message"
})


