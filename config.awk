function user_config() { 
  
  # --------------------- USER CONFIG HERE ----------------------------

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
  DESC = "Plant observed in field, photographed, and collected by one or more of T. Yahara, S. Tagane, H. Toyama, plus additional collectors in dwc:recordedBy field. Field determination by S. Tagane, unless specified in dwc:identifiedBy.";

}

