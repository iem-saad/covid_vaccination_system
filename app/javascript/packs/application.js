// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
document.addEventListener("turbolinks:load", function() {
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
        $('[data-toggle="popover"]').popover()
    })
})
require("@rails/activestorage").start()
require("channels")

Rails.start()
Turbolinks.start()
ActiveStorage.start()
import "bootstrap"
require("plugins/bootstrap")
require("plugins/bootstrap.min")
require("plugins/jquery.counterup.min")
require("plugins/jquery.easing")
require("plugins/popper")
require("plugins/shuffle.min")
require("plugins/slick")
require("plugins/slick.min")
require("chartkick")
require("chart.js")
