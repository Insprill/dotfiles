param (
    [switch]$DryRun
)

# Check for administrative privileges
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Error: This script requires administrator privileges."
    Write-Host "Please run the script as an administrator."
    Pause
    exit 1
}

# Define winget applications to install

$essentials = @{
  Name = "Essentials"
  Winget = @(
    "Alacritty.Alacritty",
    "eza-community.eza",
    "Flameshot.Flameshot",
    "Microsoft.Powershell",
    "Microsoft.PowerToys",
    "Mozilla.Firefox",
    "nomacs.nomacs",
    "RamenSoftware.Windhawk",
    "REALiX.HWiNFO",
    "MartiCliment.UniGetUI",
    "twpayne.chezmoi",
    "voidtools.Everything"
    "7zip.7zip"
  )
  Choco = @(
    "autohotkey.install",
    "mpv.install",
    "nerd-fonts-Meslo"
  )
}

$development = @{
  Name = "Development"
  Winget = @(
    "JetBrains.Toolbox",
    "LLVM.LLVM", # Required for nvim-treesitter to compile
    "Neovim.Neovim",
    "Neovide.Neovide",
    "Starship.Starship"
  )
  Choco = @()
  Custom = {
    Write-Host "Installing Cygwin"
    Invoke-WebRequest "https://cygwin.com/setup-x86_64.exe" -OutFile "cygwin-setup-x86_64.exe"
    Start-Process -NoNewWindow -PassThru -Wait -FilePath "cygwin-setup-x86_64.exe" -ArgumentList "-q -P gcc-g++,mingw64-x86_64-gcc-g++,cmake,make"
    Remove-Item "cygwin-setup-x86_64.exe"
  }
}

$gaming = @{
  Name = "Gaming"
  Winget = @(
    "Valve.Steam"
  )
}

$tiling = @{
  Name = "Tiling"
  Winget = @(
    "AltSnap.AltSnap"
    "LGUG2Z.komorebi"
  )
}

$insprill = @{
  Name = "Insprill"
  Winget = @(
    "LocalSend.LocalSend",
    "Mozilla.Thunderbird",
    "Nextcloud.NextcloudDesktop"
    "Python.Python.3.9", # Required for FanControl's liquidctl plugin
    "Rem0o.FanControl"
  )
  Choco = @(
    "iperf3"
  )
}

function InstallAllWinget($group) {
  $group.Winget | ForEach-Object {
    if ($DryRun) {
      Write-Host "winget install $_"
    } else {
      Write-Host "Installing $_ with winget..."
      winget install -e --id $_ --disable-interactivity --accept-source-agreements --accept-package-agreements
    }
  }
}

function InstallAllChoco($group) {
  $group.Winget | ForEach-Object {
    if ($DryRun) {
      Write-Host "choco install $_"
    } else {
      Write-Host "Installing $_ with Chocolatey..."
      choco install $_ -y
    }
  }
}

function ListGroupPackages($group) {
  Write-Host "Packages in $($group.Name):"
  if ($group.Winget) { $group.Winget | ForEach-Object { Write-Host " - $_" } }
  if ($group.Choco) { $group.Choco | ForEach-Object { Write-Host " - $_" } }
  if ($group.Custom) { Write-Host " - Custom Packages" }
}

function ProcessChoice($groups) {
  $groups | ForEach-Object { ListGroupPackages($_) }
  $proceed = Read-Host "Proceed with installation? (y/N)"
  if ($proceed.ToLower() -ne "y") {
    Write-Host "Installation cancelled."
    return
  }
  $groups | ForEach-Object { 
    if ($_.Winget) { InstallAllWinget($_) }
    if ($_.Choco) { InstallAllChoco($_) }
    if ($_.Custom -and -not $DryRun) { $_.Custom.Invoke() }
  }
}

$groups = @($essentials, $development, $gaming, $tiling, $insprill)

Write-Host "Available groups to install:"
for ($counter=0; $counter -lt $groups.Length; $counter++) {
    Write-Host "$counter) $($groups[$counter].Name)"
}

$selection = Read-Host "Enter the numbers of the groups you want to install (e.g. 1 2)"
if ($selection) {
    $selection = $selection.Split(" ") | ForEach-Object { $groups[$_] }
    ProcessChoice($selection)
}

$komorebicPath = "C:\Program Files\komorebi\bin\komorebic.exe"
if (Test-Path $komorebicPath) {
  Write-Host "Updating komorebic applications"
  Start-Process -FilePath "$komorebicPath" -ArgumentList "fetch-asc"
}

Write-Host "Installing liquidctl"
if (!$DryRun) {
    C:\Users\Insprill\AppData\Local\Programs\Python\Python39\python.exe -m pip install liquidctl
}

Write-Host "Creating symlinks"
$symLinks = @{
    'C:\Program Files (x86)\FanControl\Configurations' = "$env:APPDATA\FanControl\Configurations"
    'C:\Program Files (x86)\FanControl\Plugins' = "$env:APPDATA\FanControl\Plugins"
    "$env:LOCALAPPDATA\nvim" = "$env:USERPROFILE\.config\nvim"
}

foreach ($path in $symLinks.Keys) {
    if (Test-Path $path) {
        Write-Warning "Path $path already exists. Skipping creation of symlink."
    } else {
        try {
            if (!$DryRun) {
                New-Item -Path $path -ItemType SymbolicLink -Value $symLinks[$path]
            }
            Write-Host "Created symlink: $path -> $($symLinks[$path])"
        } catch {
            Write-Error "Failed to create symlink for $path. Error: $_"
        }
    }
}

Pause
