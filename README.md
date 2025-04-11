# Before You Clone

Some files here will hit GitHub’s 100 MB file size limit for individual files.  Use Git LFS (Large File Storage)/ GitHub supports large files through Git LFS.
# How To Use
- Clone repo
- `cd` to repo folder
- type `bin\docfx.exe docfx.json --serve` and press enter
- go to http://localhost:8080 in your browser to view
- Ctrl + C to end the webserver
- `git add .`
- `git commit -m "added docs"`
- `git push`

# Live site

Commits will take roughly a few minutes to render on github pages. See live site [here](https://bluebytesystemsinc.github.io/docs/).

# Edits

Make changes to the src folder. It contains the toc.yml (Table of Content) and the articles in markdown (.md files)

# Images

Add images to the images folder and use `<img src="../images/myimage.png"/>` to render them.

# Tool 
Use VSCode.


