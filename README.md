# iNat-up

Batch uploading of data and images to iNat via the API.

## Installation

 1. Clone this project.
 2. Install `gawk` ([GNU Awk](https://www.gnu.org/software/gawk/))
    v.4.0+, if nececessary. (It’s almost certainly pre-installed on a
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
    `TAB` recommended), and make sure i) the field numbers match those in
    the config file, and ii) that any header row is noted with a `HEADER
    = 1` in the config file.
 2. Place your images for each observation/collection in a directory
    under `img/` with the name of the directory exactly matching the
    collection code you specified in step 1. Avoid spaces in the name
    of the collection code (replace with a `_`.
 3. Run with `./inatup`.  The actions are logged in `upload.log`. If
    you need a list of coll. codes and their iNat obs. ID, just `grep '|'
    upload.log > coll2obsid.csv`

### Post-upload 




