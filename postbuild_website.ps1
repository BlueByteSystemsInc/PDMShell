# Path to your HTML file
$filePath = "website\src\index.html"
# All tags to insert
$tagsToInsert = @"
    <!-- Open Graph Tags -->
    <meta property="og:title" content="PDMShell for SOLDIWORKS PDM Professional" />
    <meta property="og:description" content="Automate check-ins, migrations, and batch operations in SOLIDWORKS PDM using PDMShell." />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="https://pdmshell.com/src/index.html/" />
    <meta property="og:image" content="images/logo.png" />
    <!-- Twitter Cards -->
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:title" content="PDMShell for SOLDIWORKS PDM Professional" />
    <meta name="twitter:description" content="Automate your SOLIDWORKS PDM workflows effortlessly using PDMShell." />
    <meta name="twitter:image" content="images/logo.png" />

    <!-- Robots Tag -->
    <meta name="robots" content="index, follow" />

    <!-- Structured Data -->
    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "SoftwareApplication",
      "name": "PDMShell",
      "operatingSystem": "Windows",
      "applicationCategory": "CAD, SOLIDWORKS, PDM, Automation",
      "offers": {
        "@type": "Offer",
        "price": "1949.99",
        "priceCurrency": "USD"
      },
      "url": "https://pdmshell.com"
    }
    </script>
"@

# Read current HTML content
$htmlContent = Get-Content -Path $filePath -Raw

# Avoid inserting tags multiple times
if ($htmlContent -like "*rel=`"canonical`"*") {
    Write-Host "SEO tags already exist in index.html. Skipping insertion."
    exit
}

# Insert tags before </head>
if ($htmlContent -match "</head>") {
    $updatedContent = $htmlContent -replace "</head>", "$tagsToInsert`r`n</head>"
    Set-Content -Path $filePath -Value $updatedContent -Encoding UTF8
    Write-Host "SEO tags successfully inserted into index.html."
}
else {
    Write-Host "Error: Couldn't find </head> tag in index.html."
}