# iNat-up

Script for batch uploading of data and images to iNat via the API. Can
be used for research collections, or just multiple personal
observations.

**Please note**: After conferring (in Nov 2017) with the management of
iNat about the appropriateness of batch uploading research
collection/specimen data into iNat observations, I suggest the
following guidelines:

 * Observations should only be uploaded to an account with an _active_
   owner, someone who will respond to comments, be a community
   participant, and gain some personal benefit from the
   site. (K. Ueda: “If observations don't come along with the people
   who observed them, that's a problem.”)
 * Only upload observations with photographs, the majority of which
   should be field/fresh images. In some exceptional circumstances it
   may be desirable to upload images of preserved specimens.
 * _Do_ make the effort to add species to the iNat taxonomy if they do
   not already exist (see below), rather than just leaving accurate
   determinations in the extended identification notes field.

## Installation

 1. Clone this project.
 2. Install `gawk` ([GNU Awk](https://www.gnu.org/software/gawk/))
    v.4.0+, if necessary. (It’s almost certainly pre-installed on a
    Linux system, but some distros are still using v.3.)
 3. Make sure the first line of scripts `inatup` and `gettoken` point to your
    `gawk` executable.
 4. Copy `lib/config_template.awk` to `lib/config.awk`, and edit as
    needed (see below). 

### Installation on Windows

These scripts can be made to work under Windows, I think (tested only
with the `wineconsole` emulator). You will need some extra utilities:

 * `gawk.exe` from [here](https://www.klabaster.com/freeware.htm)
 * `curl.exe` from [here](https://curl.haxx.se/download.html) (use
   Win32-Generic)
 * `sort.exe` and `find.exe` from
   [here](https://sourceforge.net/projects/unxutils/files/)
 
Unzip the downloaded packages and locate the above executables. Place
them in the same directory as the `inatup` script. Then run with `gawk
-f inatup`.

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

----

## Thanks to...

T. Yahara and S. Tagane for discussions that let to the first version
of this software, and for their desire to share their plant
images. And to iNat, especially Ken-ichi Ueda.



