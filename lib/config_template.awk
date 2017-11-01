function user_config() { 
  
  # --------------------- USER CONFIG HERE ----------------------------

  # Secrets and tokens
  # The Application ID you were given when you registered an app with iNat:
  APPID="...";
  # The Secret you were given when you registered an app with iNat:
  APPSECRET="...";
  # The Callback URL you registered:
  CALLBACKURL="...";

  # Paste the sting you get from `gettoken` here:
  AUTHTOKEN="...";
  
  # Input file
  INFILE = "newobs.csv";  # Name of input file (with relative path if needed)
  HEADER = 0;             # Is there a header 1 or 0
  FS="|";                 # Field separator
  
  # Map your field order, by changing values for variables (1, 2, ...)
  fCollCode =  1;  # Collection code               REQUIRED
  fCollDate =  2;  # Collection date               Optional
  fLat      =  3;  # Latitude (d.dddd)             REQUIRED
  fLong     =  4;  # Longitude (d.dddd)            REQUIRED
  fElev     =  5;  # Elevation (m)                 Optional
  fName     =  6;  # Genus, or species (no author) Optional
  fIndiv    =  7;  # Code for Individual           Optional
  fDetBy    =  8;  # Determiner                    Optional
  fDetDate  =  9;  # Determination date            Optional
  fLoc      = 10;  # Locality details              Optional
  fCollBy   = 11;  # Collectors                    Optional
  fSciName  = 12;  # Species and author            Optional

  # TimeZone of collections (from iNat list; see
  #   https://www.inaturalist.org/pages/api+reference#post-observations)
  TZ = "Osaka";

  # Common text for observation description (no line breaks):
  DESC = "";

}

