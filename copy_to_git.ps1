$startTime = Get-Date

$sourcePath = "D:\XAMPPP\htdocs\laravel-tutorial\oliver-rein"
$targetPath = "E:\git\git-olirein"

Write-Host "?? Vergleiche lokale Dateien (von $sourcePath nach $targetPath)..."

Get-ChildItem -Recurse -File $sourcePath |
    Where-Object {
        ($_.FullName -notmatch '\\node_modules\\') -and
        ($_.FullName -notmatch '\\_work\\') -and
        ($_.FullName -notmatch '\\cache\\') -and
        ($_.FullName -notmatch '\\vendor\\') -and
        ($_.FullName -notmatch '\\handbook_admin\\') -and
        ($_.FullName -notmatch '\\storage\\')
    } | ForEach-Object {
        # Relativer Pfad zur Datei ab Source-Verzeichnis
        $relativePath = $_.FullName.Substring($sourcePath.Length).TrimStart('\') -replace '\\','/'
        $targetFile = Join-Path $targetPath ($relativePath -replace '/', '\')

        # Zielverzeichnis ggf. anlegen
        $targetDir = Split-Path $targetFile -Parent
        if (-not (Test-Path $targetDir)) {
            New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
        }

        # Vergleich
        if (-not (Test-Path $targetFile) -or $_.LastWriteTimeUtc -gt (Get-Item $targetFile).LastWriteTimeUtc) {
            Write-Host "?? Kopiere: $relativePath"
            Copy-Item $_.FullName -Destination $targetFile -Force
        }
        else {
            #Write-Host "? Überspringe: $relativePath (nicht neuer)"
        }
    }

# Laufzeit ausgeben
$endTime = Get-Date
$duration = ($endTime - $startTime).TotalSeconds
Write-Host "`n? Fertig in $([math]::Round($duration, 2)) Sekunden."
