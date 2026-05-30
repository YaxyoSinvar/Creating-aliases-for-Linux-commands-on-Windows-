# Creating-aliases-for-Linux-commands-on-Windows-
O'zbek tilida
Ishlatish bo'yicha qo'llanma
Skriptni saqlash:

powershell
# Faylni saqlang
Notepad ~/Documents/Set-LinuxAliases.ps1
# Yuqoridagi kodni joylashtiring va saqlang
Skriptni ishga tushirish:

powershell
# PowerShell-ni Administrator sifatida ishga tushiring
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
. ~/Documents/Set-LinuxAliases.ps1
Natijani tekshirish:

powershell
# Yangi aliaslarni ko'rish
Get-Alias | Where-Object {$_.Name -in @('ll','la','grep','ps','top')}

# Sinab ko'rish
ll
la
pwd
grep "test" file.txt
Ingliz tilida (English)
User Guide
Saving the script:

powershell
# Save the file
Notepad ~/Documents/Set-LinuxAliases.ps1
# Paste the code above and save it
Running the script:

powershell
# Run PowerShell as Administrator
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
. ~/Documents/Set-LinuxAliases.ps1
Verifying the result:

powershell
# View the new aliases
Get-Alias | Where-Object {$_.Name -in @('ll','la','grep','ps','top')}

# Test the aliases
ll
la
pwd
grep "test" file.txt
