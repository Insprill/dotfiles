param (
    [string]$path = (Get-Location).Path
)

function Remove-Brackets {
    param (
        [string]$path
    )
    Get-ChildItem -Path $path -Recurse | ForEach-Object {
        $newName = $_.Name -replace '\s*\[[^\]]*\]', ''
        if ($newName -ne $_.Name) {
            Rename-Item -Path $_.FullName -NewName $newName
        }
    }
}

Remove-Brackets -path $path
