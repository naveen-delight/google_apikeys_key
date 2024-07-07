resource "google_apikeys_key" "apikey" {
  name         = var.name
  display_name = var.name
  project      = var.project

  # Geocoding API
  dynamic "restrictions" {
    for_each = var.use_geocoding ? [1] : []
    content {
      api_targets {
        service = "geocoding-backend.googleapis.com"
      }
    }
  }

  # Maps JavaScript API
  dynamic "restrictions" {
    for_each = var.use_javascript ? [1] : []
    content {
      api_targets {
        service = "maps-embed-backend.googleapis.com"
      }
    }
  }

  # Maps SDK for Android
  dynamic "restrictions" {
    for_each = var.use_sdk_for_andorid ? [1] : []
    content {
      api_targets {
        service = "maps-sdk-backend.googleapis.com"
      }
    }
  }

  # Distance Matrix API
  dynamic "restrictions" {
    for_each = var.use_distancematrix ? [1] : []
    content {
      api_targets {
        service = "distancematrix-backend.googleapis.com"
      }
    }
  }

  # Places API
  dynamic "restrictions" {
    for_each = var.use_places ? [1] : []
    content {
      api_targets {
        service = "places-backend.googleapis.com"
      }
    }
  }

  # Directions API
  dynamic "restrictions" {
    for_each = var.use_directions ? [1] : []
    content {
      api_targets {
        service = "directions-backend.googleapis.com"
      }
    }
  }

  # Cloud Datastore API
  dynamic "restrictions" {
    for_each = var.use_datastore ? [1] : []
    content {
      api_targets {
        service = "datastore.googleapis.com"
      }
      browser_key_restrictions {
      allowed_referrers = ["mpaas-dev.m-devsecops.com"]
    }
    }
  }
}


resource "google_secret_manager_secret" "google-maps-api_keys" {
  secret_id = "google-maps-api-keys"

  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "version" {
  secret      = google_secret_manager_secret.google-maps-api_keys.id
  secret_data = google_apikeys_key.apikey.key_string
}
