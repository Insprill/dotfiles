https://github.com/jmarucha/FanControl.Liquidctl
https://github.com/liquidctl/liquidctl

Installing the Liquidctl plugin is a bit of a PITA, but here's how it's done:

Clone the repo, install dotnet targeting pack 4.8, run `dotnet build --configuration Release`.
Copy the `FanControl.Liquidctl.dll` file from `bin/Release` into the `C:\Program Files (x86)\FanControl\Plugins\Liquidctl` folder (make it if it doesn't exist).

Then to get the liquidctl lib, install it with pip
(this installs the latest version built from git)
`python -m pip install git+https://github.com/liquidctl/liquidctl#egg=liquidctl`

Then copy the liquidctl.exe it builds from `C:\Users\Insprill\AppData\Local\Programs\Python\Python39\Scripts` to `C:\Program Files (x86)\FanControl\Plugins`. It must NOT go in the Liquidctl folder, but rather right in the Plugins root.

Doing this should provide functional liquidctl support