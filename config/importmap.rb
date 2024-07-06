# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "@hotwired--stimulus.js" # @3.2.2
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "trix"
pin "@rails/actiontext", to: "actiontext.esm.js"
pin "stimulus-content-loader" # @4.2.0
pin '@stimulus_reflex/futurism', to: 'futurism.min.js', preload: true
pin "@stimulus-components/content-loader", to: "@stimulus-components--content-loader.js" # @5.0.0
