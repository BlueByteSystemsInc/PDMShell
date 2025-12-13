.\bin\docfx.exe .\docfx.json
powershell -ExecutionPolicy Bypass -File .\postbuild.ps1
.\bin\docfx.exe .\website.json
powershell -ExecutionPolicy Bypass -File .\postbuild_website.ps1
git add .
git commit -m "updated docs"
git push 
cd website 
start .