# Linux Common Commands Aliases for PowerShell
# Saqlash: ~/Documents/Set-LinuxAliases.ps1
# Ishga tushirish: . ~/Documents/Set-LinuxAliases.ps1
# Doimiy qilish: PowerShell profilinga qo'shing

$aliases = @(
    # Asosiy buyruqlar
    @{Name='ll';  Command='Get-ChildItem -Force'},                    # ls -la
    @{Name='la';  Command='Get-ChildItem -Force -Hidden'},            # ls -a
    @{Name='ls';  Command='Get-ChildItem'},                           # ls
    @{Name='l';   Command='Get-ChildItem -Name'},                     # ls -1
    @{Name='tree';Command='Get-ChildItem -Recurse | Format-Table Name'},
    
    # Navigatsiya
    @{Name='cd';    Command='Set-Location'},                          # cd
    @{Name='cd..';  Command='Set-Location ..'},                       # cd ..
    @{Name='pwd';   Command='Get-Location'},                          # pwd
    @{Name='..';    Command='Set-Location ..'},                       # ..
    @{Name='...';   Command='Set-Location ../..'},                    # ../..
    
    # Fayl operatsiyalari
    @{Name='cp';    Command='Copy-Item'},                             # cp
    @{Name='mv';    Command='Move-Item'},                             # mv
    @{Name='rm';    Command='Remove-Item'},                           # rm
    @{Name='rmdir'; Command='Remove-Item -Recurse'},                  # rmdir
    @{Name='mkdir'; Command='New-Item -ItemType Directory -Force'},   # mkdir
    @{Name='touch'; Command='New-Item -ItemType File -Force'},        # touch
    @{Name='cat';   Command='Get-Content'},                           # cat
    @{Name='head';  Command='Get-Content -TotalCount'},               # head
    @{Name='tail';  Command='Get-Content -Tail'},                     # tail
    @{Name='less';  Command='Get-Content -Wait'},                     # less
    @{Name='more';  Command='Get-Content -Page'},                     # more
    
    # Matn qidiruv va tahrirlash
    @{Name='grep';   Command='Select-String'},                        # grep
    @{Name='egrep';  Command='Select-String -CaseSensitive'},         # egrep
    @{Name='find';   Command='Get-ChildItem -Recurse'},               # find
    @{Name='findstr';Command='Select-String'},                        # findstr
    @{Name='echo';   Command='Write-Output'},                         # echo
    @{Name='printf'; Command='Write-Host'},                           # printf
    @{Name='wc';     Command='Measure-Object'},                       # wc
    
    # Tizim ma'lumotlari
    @{Name='ps';     Command='Get-Process'},                          # ps
    @{Name='top';    Command='Get-Process | Sort-Object CPU -Descending | Select-Object -First 20'}, # top
    @{Name='kill';   Command='Stop-Process'},                         # kill
    @{Name='df';     Command='Get-PSDrive'},                          # df
    @{Name='du';     Command='Get-ChildItem -Recurse | Measure-Object -Property Length -Sum'}, # du
    @{Name='free';   Command='Get-CimInstance Win32_OperatingSystem | Select-Object TotalVisibleMemorySize,FreePhysicalMemory'}, # free
    @{Name='uptime'; Command='(Get-Date) - (Get-CimInstance Win32_OperatingSystem).LastBootUpTime'}, # uptime
    @{Name='whoami'; Command='WhoAmI'},                               # whoami
    @{Name='hostname';Command='Hostname'},                            # hostname
    @{Name='uname';  Command='Get-CimInstance Win32_OperatingSystem | Select-Object Caption'}, # uname
    
    # Tarmoq buyruqlari
    @{Name='ping';    Command='Test-Connection'},                     # ping
    @{Name='curl';    Command='Invoke-WebRequest'},                   # curl
    @{Name='wget';    Command='Invoke-WebRequest -OutFile'},          # wget
    @{Name='nslookup';Command='Resolve-DnsName'},                     # nslookup
    @{Name='netstat'; Command='Get-NetTCPConnection'},                # netstat
    @{Name='ipconfig';Command='Get-NetIPAddress'},                    # ifconfig
    
    # Foydali qo'shimchalar
    @{Name='clear';  Command='Clear-Host'},                           # clear
    @{Name='history';Command='Get-History'},                          # history
    @{Name='alias';  Command='Get-Alias'},                            # alias
    @{Name='which';  Command='Get-Command'},                          # which
    @{Name='man';    Command='Get-Help'},                             # man
    @{Name='help';   Command='Get-Help'},                             # help
    @{Name='exit';   Command='exit'},                                 # exit
    
    # Qo'shimcha Linux buyruqlari
    @{Name='chmod';  Command='Write-Host "Use: icacls for Windows permissions" -ForegroundColor Yellow'},
    @{Name='chown';  Command='Write-Host "Use: takeown / icacls for Windows" -ForegroundColor Yellow'},
    @{Name='ln';     Command='New-Item -ItemType SymbolicLink'},      # ln
    @{Name='diff';   Command='Compare-Object'},                       # diff
    @{Name='sort';   Command='Sort-Object'},                          # sort
    @{Name='uniq';   Command='Get-Unique'},                           # uniq
    @{Name='sed';    Command='ForEach-Object { $_ -replace'},         # sed (asosiy)
    @{Name='awk';    Command='ForEach-Object { $_.Split()}'},         # awk (asosiy)
    
    # Zip/Archive
    @{Name='tar';    Command='Write-Host "Use: Compress-Archive / Expand-Archive" -ForegroundColor Yellow'},
    @{Name='zip';    Command='Compress-Archive'},                     # zip
    @{Name='unzip';  Command='Expand-Archive'},                       # unzip
    @{Name='gzip';   Command='Write-Host "Use: Compress-Archive for Windows" -ForegroundColor Yellow'},
    
    # Jarayon boshqaruvi
    @{Name='nohup';  Command='Start-Process -NoNewWindow'},           # nohup
    @{Name='bg';     Command='Write-Host "PowerShell: Use jobs cmdlets" -ForegroundColor Yellow'},
    @{Name='fg';     Command='Write-Host "PowerShell: Use Receive-Job" -ForegroundColor Yellow'},
    @{Name='jobs';   Command='Get-Job'},                              # jobs
    
    # Qo'shimcha foydali buyruqlar
    @{Name='date';   Command='Get-Date'},                             # date
    @{Name='cal';    Command='Get-Date -Format "MMMM yyyy"'},         # cal
    @{Name='sleep';  Command='Start-Sleep'},                          # sleep
    @{Name='watch';  Command='Write-Host "Use loop with Start-Sleep" -ForegroundColor Yellow'},
    @{Name='crontab';Command='Write-Host "Use Task Scheduler (schtasks)" -ForegroundColor Yellow'},
    @{Name='env';    Command='Get-ChildItem Env:'},                   # env
    @{Name='export'; Command='Set-Item -Path Env:'},                  # export
    @{Name='source'; Command='. '},                                   # source
    @{Name='sudo';   Command='Start-Process -Verb RunAs'},            # sudo
    @{Name='su';     Command='Write-Host "Use RunAs in PowerShell" -ForegroundColor Yellow'},
    
    # Qo'shimchalar (to'liq 100 ta uchun)
    @{Name='md5sum'; Command='Get-FileHash -Algorithm MD5'},          # md5sum
    @{Name='sha1sum';Command='Get-FileHash -Algorithm SHA1'},         # sha1sum
    @{Name='sha256sum';Command='Get-FileHash -Algorithm SHA256'},     # sha256sum
    @{Name='base64'; Command='[Convert]::ToBase64String'},            # base64
    @{Name='time';   Command='Measure-Command'},                      # time
    @{Name='xargs';  Command='ForEach-Object'},                       # xargs
    @{Name='tr';     Command='ForEach-Object { $_ -replace'},         # tr
    @{Name='cut';    Command='ForEach-Object { $_.Split()[$args] }'}, # cut
    @{Name='paste';  Command='Write-Host "Join-Object module required" -ForegroundColor Yellow'},
    @{Name='join';   Command='Join-String'},                          # join
    @{Name='split';  Command='Split-Path'},                           # split
    @{Name='rev';    Command='ForEach-Object { -join $_.ToCharArray()[-1..-$_.Length] }'}, # rev
    @{Name='nl';     Command='ForEach-Object { $i=1 } { "$i $_"; $i++ }'}, # nl
    @{Name='tac';    Command='Get-Content | Select-Object -Last 99999'}, # tac
    @{Name='seq';    Command='1..'},                                  # seq
    @{Name='factor'; Command='Write-Host "Math.NET Numerics required" -ForegroundColor Yellow'},
    @{Name='bc';     Command='Invoke-Expression'},                    # bc
    @{Name='dc';     Command='Write-Host "Use [math]:: functions" -ForegroundColor Yellow'},
    @{Name='expr';   Command='Invoke-Expression'},                    # expr
    @{Name='test';   Command='Test-Path'},                            # test
    
    # Diskl va fayl tizimi
    @{Name='mount';  Command='Mount-DiskImage'},                      # mount
    @{Name='umount'; Command='Dismount-DiskImage'},                   # umount
    @{Name='fdisk';  Command='Get-Disk'},                             # fdisk
    @{Name='mkfs';   Command='Format-Volume'},                        # mkfs
    @{Name='fsck';   Command='Repair-Volume'},                        # fsck
    
    # Tizim boshqaruvi
    @{Name='systemctl';Command='Get-Service'},                        # systemctl
    @{Name='journalctl';Command='Get-WinEvent'},                      # journalctl
    @{Name='dmesg';  Command='Get-WinEvent -LogName System -MaxEvents 100'}, # dmesg
    @{Name='lsmod';  Command='Get-WmiObject Win32_SystemDriver'},     # lsmod
    @{Name='modprobe';Command='Write-Host "Use sc.exe or net start" -ForegroundColor Yellow'},
    
    # Qo'shimcha tez buyruqlar
    @{Name='g';      Command='Get-Command'},                          # tez which
    @{Name='h';      Command='Get-History'},                          # tez history
    @{Name='c';      Command='Clear-Host'},                           # tez clear
    @{Name='e';      Command='exit'},                                 # tez exit
    @{Name='reload'; Command='. $PROFILE'}                            # profiling qayta yuklash
)

# Profil faylini aniqlash
$profilePath = $PROFILE.CurrentUserAllHosts

# Profil mavjudligini tekshirish
if (-not (Test-Path $profilePath)) {
    Write-Host "Creating PowerShell profile: $profilePath" -ForegroundColor Yellow
    New-Item -Path $profilePath -ItemType File -Force | Out-Null
}

# Har bir alias uchun funksiya yaratish
Write-Host "Creating Linux aliases in PowerShell profile..." -ForegroundColor Green

foreach ($alias in $aliases) {
    $aliasName = $alias.Name
    $aliasCommand = $alias.Command
    
    # Alias funksiyasini yaratish
    $functionBody = @"
function global:$aliasName {
    param(
        [Parameter(ValueFromRemainingArguments=`$true)]
        `$Arguments
    )
    
    if (`$Arguments.Count -gt 0) {
        & { $aliasCommand } @Arguments
    } else {
        & { $aliasCommand }
    }
}
"@
    
    # Profilga qo'shish
    Add-Content -Path $profilePath -Value "`n# Linux alias: $aliasName" -Force
    Add-Content -Path $profilePath -Value $functionBody -Force
    Add-Content -Path $profilePath -Value "Set-Alias -Name $aliasName -Value $aliasName -Force" -Force
}

Write-Host "Successfully added $($aliases.Count) Linux aliases to PowerShell profile!" -ForegroundColor Green
Write-Host "`nTo use them immediately, run: . $profilePath" -ForegroundColor Yellow
Write-Host "Or restart PowerShell" -ForegroundColor Yellow

# Darhol qo'llash opsiyasi
$applyNow = Read-Host "`nApply aliases now? (Y/N)"
if ($applyNow -eq 'Y' -or $applyNow -eq 'y') {
    . $profilePath
    Write-Host "Aliases are now active!" -ForegroundColor Green
    Write-Host "Try: ll, la, grep, ps, top" -ForegroundColor Cyan
}
