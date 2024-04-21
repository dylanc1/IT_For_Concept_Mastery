# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript/custom", under: "custom"

pin "@canvasjs/charts", to: "https://unpkg.com/@canvasjs/charts@3.8.2/canvasjs.min.js"
pin "jquery", to: "https://unpkg.com/jquery@3.7.1/dist/jquery.js"
