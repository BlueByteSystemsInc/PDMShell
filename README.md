
# Old Documentation: 
https://bluebyte.biz/docs/pdm2excel/
https://bluebyte.biz/docs/pdm-convert-task-extended/
https://bluebyte.biz/docs/revisionsync/


# Build 

To build the docs: 

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

# Links
See how links work in introduction.md. 

# Tool 
Use VSCode.


