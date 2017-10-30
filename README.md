# inat-up

Uploading of data and images to iNat via the API

## Authentication

You will need an `APP_ID` and `APP_SECRET_ID`. Create an app at <https://www.inaturalist.org/oauth/applications>.  

Log in with a browser and go to this link:

      https://www.inaturalist.org/oauth/authorize?client_id=APP_ID&\
      redirect_uri=http%3A%2F%2Ffoo.com&response_type=code

Authorize the app. You will be sent to this page:

      http://foo.com/?code=AUTH_CODE

This code indicates the user has authorized this app. Within a few
minutes (important!) send this request:
      
      curl -d client_id=APP_ID -d client_secret=APP_SECRET_ID \
        -d code=AUTH_CODE -d redirect_uri=http://foo.com \
        -d grant_type=authorization_code \
        https://www.inaturalist.org/oauth/token

You will get back some JSON:

      {
         "access_token":"AUTH_TOKEN",
         "token_type":"bearer",
         "scope":"write",
         "created_at":1508880263
       }

This `AUTH_TOKEN` can be used for a while (weeks?) to make calls to the API. 

## Using `dwc:` fields

Find the available darwin core fields with this:

      curl https://www.inaturalist.org/observation_fields.json?q=dwc

Fields and their iNat id:

      dwc:basisOfRecord     7586
      dwc:collectionCode    7584
      dwc:dateIdentified    7590
      dwc:identifiedBy      7589
      dwc:locality          7587
      dwc:occurrenceID      7261
      dwc:organismID        6934
      dwc:recordedBy        7262
      dwc:recordNumber      7256
      dwc:scientificName    7591
      dwc:verbatimElevation 7588


