param (
    [Parameter(Mandatory=$true)]
    [string]$SourceFolder,

    [Parameter(Mandatory=$true)]
    [string]$DestinationFolder
)

if (-not (Test-Path -Path $DestinationFolder)) {
    New-Item -ItemType Directory -Path $DestinationFolder
}

$videoFiles = Get-ChildItem -Path $SourceFolder -File -Recurse -Include *.mkv, *.mp4, *.avi, *.mov

foreach ($videoFile in $videoFiles) {
    $inputFilePath = $videoFile.FullName
    $outputFileName = [System.IO.Path]::GetFileNameWithoutExtension($videoFile.Name) + ".flac"
    $outputFilePath = Join-Path -Path $DestinationFolder -ChildPath $outputFileName

    Write-Host "Extracting audio from $inputFilePath to $outputFilePath"

    ffmpeg -i "$inputFilePath" -vn -codec:a flac "$outputFilePath"
}

Write-Host "Audio extraction and conversion to FLAC completed."