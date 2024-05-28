param(
    # Define a parameter to accept the directory path
    [string]$directory
)

$flacFiles = Get-ChildItem -Path $directory -Filter *.flac -Recurse

if ($flacFiles.Count -eq 0) {
    Write-Error "No FLAC files found in the specified directory: $directory"
    exit 1
}

$flacFiles | ForEach-Object -Parallel {
    $flacFile = $_
    $mp3File = [IO.Path]::ChangeExtension($flacFile.FullName, ".mp3")

    ffmpeg -loglevel warning -y -i "$($flacFile.FullName)" -ab 128k -map_metadata 0 -id3v2_version 3 "$mp3File"

    if (Test-Path $mp3File) {
        Remove-Item $flacFile.FullName
        Write-Output "Converted file: $($mp3File)"
    } else {
        Write-Error "Conversion failed for file: $($flacFile.FullName)"
    }
} -ThrottleLimit 32
