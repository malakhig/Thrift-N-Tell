// Import and register all your controllers from the importmap under controllers/*
import { application } from "controllers/application"

// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// Import Stimulus application
import { Application } from '@hotwired/stimulus'

// Import and register the ContentLoader controller
import ContentLoader from '@stimulus-components/content-loader'
application.register('content-loader', ContentLoader)

// Optional: Lazy load controllers as they appear in the DOM (commented out as not used)
// import { lazyLoadControllersFrom } from "@hotwired/stimulus-loading"
// lazyLoadControllersFrom("controllers", application)
