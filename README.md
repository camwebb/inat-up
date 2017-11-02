# iNat-up

Batch uploading of data and images to iNat via the API.

## Installation

 1. Clone this project.
 2. Install `gawk` ([GNU Awk](https://www.gnu.org/software/gawk/))
    v.4.0+, if necessary. (It’s almost certainly pre-installed on a
    Linux system, but some distros are still using v.3.)
 3. Make sure the first line of scripts `inatup` and `gettoken` point to your
    `gawk` executable.
 4. Copy `lib/config_template.awk` to `lib/config.awk`, and edit as
    needed (see below). 

## Use

### Getting an Authorization token

 1. [Register an app with iNat](https://www.inaturalist.org/oauth/applications)
    to get the `APPID` and `APPSECRET`. Enter these in the config file.
 2. Run `./gettoken` and follow the instructions. Paste the `AUTHTOKEN` into 
    the config file.
 
### Uploading data to iNat

 1. Prepare a plain text file, with delimiters of your choice (`|` or
    `TAB` recommended), and make sure i) the field numbers match those
    in the config file, and ii) that any header row is noted with a
    `HEADER = 1` in the config file. Extra padding spaces are allowed
    and will be removed.
 2. Place your images for each observation/collection in a directory
    under `img/` with the name of the directory exactly matching the
    collection code you specified in step 1. Avoid spaces in the name
    of the collection code (replace with a `_`.
 3. Run with `./inatup`.  The actions are logged in `upload.log`. If
    you need a list of coll. codes and their iNat obs. ID, just `grep '|'
    upload.log > coll2obsid.csv`

### Post-upload 

Some checking and tidying via the web interface is recommended.  In
particular, determinations may need to be modified.  `inatup` searches
iNat for the supplied name (genus+specificEpithet), but iNat may not
yet contain the species name. `inatup` will then search for just the
genus name and add that as the determination, with a ‘FIXME’ note
associated with the determination. To add the new taxon:

 1. First try: enter
    the name in the ‘Suggest an identification’ box and then ‘Search
    external name providers.’ Select the name if it appears.
 2. If you are an iNat Curator, add the taxon manually, an then return
    to the obs and add that name.
 3. If you are not a Curator, you are stuck. But make sure the correct
    name is indicated in the extra info box for the identification to the
    genus of your ‘new’ species.

### Deleting observations 

Observations can be delete (as a batch edit) via the general web
interface, or via this app. To delete an observation:

 1. find its
    `observation_id` (e.g., 8573308 for
     <https://www.inaturalist.org/observations/8573308>)
 2. Run `./inatup --del <observation_id>`



