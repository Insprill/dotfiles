# Check for administrative privileges
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "Error: This script requires administrator privileges."
    Write-Host "Please run the script as an administrator."
    Pause
    exit 1
}

# Define winget applications to install
$wingetApps = @(
    "Alacritty.Alacritty",
    "eza-community.eza",
    "Flameshot.Flameshot",
    "LGUG2Z.komorebi",
    "LocalSend.LocalSend",
    "Microsoft.Powershell",
    "Microsoft.PowerToys",
    "Mozilla.Firefox",
    "Mozilla.Thunderbird",
    "Neovide.Neovide",
    "Nextcloud.NextcloudDesktop",
    "nomacs.nomacs",
    "RamenSoftware.Windhawk",
    "REALiX.HWiNFO",
    "SomePythonThings.WingetUIStore",
    "Starship.Starship",
    "twpayne.chezmoi",
    "Valve.Steam",
    "VideoLAN.VLC",
    "7zip.7zip"
)

# Install applications using winget
foreach ($app in $wingetApps) {
    Write-Host "Installing $app with winget..."
    #winget install $app --disable-interactivity --accept-source-agreements --accept-package-agreements
}

# Define Chocolatey applications to install
$chocoApps = @(
    "autohotkey.install",
    "iperf3",
    "nerd-fonts-Meslo"
)

# Install applications using Chocolatey
foreach ($app in $chocoApps) {
    Write-Host "Installing $app with Chocolatey..."
    #choco install $app -y
}

Write-Host "Installing Cygwin"
Invoke-WebRequest "https://cygwin.com/setup-x86_64.exe" -OutFile "cygwin-setup-x86_64.exe"
Start-Process -NoNewWindow -PassThru -Wait -FilePath "cygwin-setup-x86_64.exe" -ArgumentList "-q -P gcc-g++,mingw64-x86_64-gcc-g++,cmake,make"
Remove-Item "cygwin-setup-x86_64.exe"

Write-Host "All applications installed."

Pause
