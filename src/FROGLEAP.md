# FROGLEAP Command Documentation

## DESCRIPTION:
Frog leaps an old version as newest. 

## SYNTAX:
```bash
frogleap -search -filePath -oldVersion
```
## PARAMETERS:
- `search`: The search operation to use.
- `search`: The file(s) to be frog leaped. This is the default parameter.
- `oldVersion:` The old version to leap. This is an integer.

## EXAMPLES:
``` bash
frogleap -filePath "file1.sldprt" -oldVersion 2
```
## REMARKS:
- The `search` parameter searches the current directory and does not drill down. The search query is a PDM one, so you can use `%` for wildcard.

## TUTORIAL:
 <video src="https://bluebyte.biz/wp-content/pdmshellvideos/frogleap.mp4" autoplay muted controls style="width: 100%; border-radius: 12px;"></video>
