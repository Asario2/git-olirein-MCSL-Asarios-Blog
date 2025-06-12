$startTime = Get-Date

$localPath = "D:\XAMPPP\htdocs\laravel-tutorial\oliver-rein"
$containerPath = "/app"
$containerName = "ds-app-1"

# 1. Zeitstempel aller Dateien im Container holen
Write-Host "? Hole Zeitstempel aller Dateien im Container..."
$containerFilesRaw = docker exec $containerName bash -c "find $containerPath -type f -exec stat -c '%Y %n' {} +"

# 2. In Hashtable speichern
$containerFiles = @{}
foreach ($line in $containerFilesRaw -split "`n") {
    if (-not [string]::IsNullOrWhiteSpace($line)) {
        $parts = $line -split ' ', 2
        $timestamp = [int64]$parts[0]
        $fullPath = $parts[1]
        $relativePath = $fullPath.Substring($containerPath.Length).TrimStart('/')
        $containerFiles[$relativePath] = $timestamp
    }
}

Write-Host "?? Starte Vergleich und Kopieren..."

# 3. Lokale Dateien vergleichen und ggf. kopieren
Get-ChildItem -Recurse -File $localPath |
    Where-Object {
        ($_.FullName -notmatch '\\node_modules\\') -and
        ($_.FullName -notmatch '\\_work\\') -and
        ($_.FullName -notmatch '\\cache\\') -and
        ($_.FullName -notmatch '\\vendor\\') -and
        ($_.FullName -notmatch '\\handbook_admin\\') -and
        ($_.FullName -notmatch '\\storage\\')
    } | ForEach-Object {
        $relativePath = $_.FullName.Substring($localPath.Length).TrimStart('\') -replace '\\','/'
        $localUnixTime = [System.DateTimeOffset]::new($_.LastWriteTimeUtc).ToUnixTimeSeconds()

        $containerModTime = if ($containerFiles.ContainsKey($relativePath)) {
            $containerFiles[$relativePath]
        } else {
            0
        }

        if ($localUnixTime -gt $containerModTime) {
            Write-Host "? Kopiere: $relativePath"
            $containerFilePath = "$containerPath/$relativePath"
            docker cp $_.FullName ($containerName + ":" + $containerFilePath)
        } else {
           # Write-Host "= Überspringe: $relativePath (nicht neuer)"
        }
    }

# 4. Zeit berechnen
$endTime = Get-Date
$duration = ($endTime - $startTime).TotalSeconds
Write-Host "`n?? Fertig in $([math]::Round($duration, 2)) Sekunden."
	