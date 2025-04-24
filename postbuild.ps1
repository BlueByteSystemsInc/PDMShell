# Path to your HTML file
$filePath = "docs\index.html"

# The canonical tag you want to insert
$canonicalTag = '<link rel="canonical" href="https://pdmshell.bluebyte.biz/" />'

# Load file content
$htmlContent = Get-Content -Path $filePath -Raw

# Check if canonical tag already exists
if ($htmlContent -like "*rel=`"canonical`"*") {
    Write-Host "Canonical tag already present in index.html."
    exit
}

# Insert canonical tag before </head>
if ($htmlContent -match "</head>") {
    $updatedContent = $htmlContent -replace "</head>", "    $canonicalTag`r`n</head>"
    Set-Content -Path $filePath -Value $updatedContent -Encoding UTF8
    Write-Host "Canonical tag successfully inserted."
}
else {
    Write-Host "Error: Couldn't find </head> tag in index.html."
}