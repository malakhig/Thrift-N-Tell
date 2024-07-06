// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require_tree
//= require bootstrap
// bootstrap_init.js
document.addEventListener('DOMContentLoaded', function () {
  var dropdownTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="dropdown"]'))
  var dropdownList = dropdownTriggerList.map(function (dropdownTriggerEl) {
    return new bootstrap.Dropdown(dropdownTriggerEl)
  })
})

import { futurize } from 'futurism'
futurize()

import "trix"
import "@rails/actiontext"

import { Turbo } from "@hotwired/turbo-rails"
import "bootstrap"

document.addEventListener("turbo:load", () => {
  var dropdownElementList = [].slice.call(document.querySelectorAll('.dropdown-toggle'))
  var dropdownList = dropdownElementList.map(function (dropdownToggleEl) {
    return new bootstrap.Dropdown(dropdownToggleEl)
  })
});

window.initMap = function(...args) {
  const event = document.createEvent("Events")
  event.initEvent("google-maps-callback", true, true)
  event.args = args
  window.dispatchEvent(event)
}
      


