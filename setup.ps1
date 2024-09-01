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
    "Rem0o.FanControl",
    "RamenSoftware.Windhawk",
    "REALiX.HWiNFO",
    "SomePythonThings.WingetUIStore",
    "twpayne.chezmoi",
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
    "LGUG2Z.komorebi"
  )
}

$insprill = @{
  Name = "Insprill"
  Winget = @(
    "Mozilla.Thunderbird",
    "LocalSend.LocalSend",
    "Nextcloud.NextcloudDesktop"
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
    if ($_.Custom && -not $DryRun) { $_.Custom.Invoke() }
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

Write-Host "Creating FanControl symlinks"
$roamingPath = [System.Environment]::GetFolderPath('ApplicationData')
New-Item -Path 'C:\Program Files (x86)\FanControl\Configurations' -ItemType SymbolicLink -Value "$roamingPath'\FanControl\Configurations'"
New-Item -Path 'C:\Program Files (x86)\FanControl\Plugins' -ItemType SymbolicLink -Value "$roamingPath\FanControl\Plugins"

Pause
