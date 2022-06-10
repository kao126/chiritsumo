// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'
import "./jquery.jpostal.js"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// jpostalの記述
$(document).on('turbolinks:load', function () {
  $('#customer_postal_code').jpostal({
    // 取得する郵便番号のテキストボックスをidで指定
    postcode : ['#customer_postal_code'],
    address : {
      // 都道府県: %3 / 市区町村: %4 / 町域: %5 / 番地: %6 / 名称: %7
      "#customer_prefecture_code" : "%3",
      "#customer_address_city" : "%4",
      "#customer_address_street" : "%5%6%7"
    }
  });
});

