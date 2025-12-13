.\bin\docfx.exe .\docfx.json
.\postbuild.ps1
.\bin\docfx.exe .\website.json
.\postbuild_website.ps1
git add .
git commit -m "updated docs"
git push 
cd website 
start .