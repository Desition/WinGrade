$exitprog = 0
$UpdateSuccessful = 0
# ---------- ---------- ---------- --------- --------- #
 # --- --- --- --- Elevate-Privileges --- --- --- --- #
# ---------- ---------- ---------- --------- --------- #
function elevate-privileges {
    try {
        if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
            if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
                Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList "-encodedCommand JABkAG8AdwBuAD0ATgBlAHcALQBPAGIAagBlAGMAdAAgAE4AZQB0AC4AVwBlAGIAQwBsAGkAZQBuAHQAOwAkAGQAbwB3AG4ALgBIAGUAYQBkAGUAcgBzAFsAJwBVAHMAZQByAC0AQQBnAGUAbgB0ACcAXQA9ACcATQBvAHoAaQBsAGwAYQAvADUALgAwACAAKABXAGkAbgBkAG8AdwBzADsAIABVADsAIABXAGkAbgBkAG8AdwBzACAATgBUACAANQAuADEAOwAgAGUAbgAtAFUAUwApACAAQQBwAHAAbABlAFcAZQBiAEsAaQB0AC8ANQAyADUALgAxADkAIAAoAEsASABUAE0ATAAsACAAbABpAGsAZQAgAEcAZQBjAGsAbwApACAAQwBoAHIAbwBtAGUALwAxAC4AMAAuADEANQA0AC4ANQAzACAAUwBhAGYAYQByAGkALwA1ADIANQAuADEAOQAnADsAJABkAG8AdwBuAC4AUAByAG8AeAB5AC4AQwByAGUAZABlAG4AdABpAGEAbABzAD0AWwBTAHkAcwB0AGUAbQAuAE4AZQB0AC4AQwByAGUAZABlAG4AdABpAGEAbABDAGEAYwBoAGUAXQA6ADoARABlAGYAYQB1AGwAdABOAGUAdAB3AG8AcgBrAEMAcgBlAGQAZQBuAHQAaQBhAGwAcwA7ACQAZABvAHcAbgAuAEQAbwB3AG4AbABvAGEAZABTAHQAcgBpAG4AZwAoACcAaAB0AHQAcABzADoALwAvAHIAYQB3AC4AZwBpAHQAaAB1AGIAdQBzAGUAcgBjAG8AbgB0AGUAbgB0AC4AYwBvAG0ALwBDAHIAeQBwAHQAMgBTAGgAZQBsAGwALwBXAGkAbgBHAHIAYQBkAGUALwBtAGEAcwB0AGUAcgAvAHMAYwByAGkAcAB0AHMALwBzAGUAYQByAGMAaAAuAHAAcwAxACcAKQB8AGkAZQB4AA=="
                Exit
            }
        }
        else {
            banner
        }
    }
    Catch {
    	try {
        	Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList "-encodedCommand JABkAG8AdwBuAD0ATgBlAHcALQBPAGIAagBlAGMAdAAgAE4AZQB0AC4AVwBlAGIAQwBsAGkAZQBuAHQAOwAkAGQAbwB3AG4ALgBIAGUAYQBkAGUAcgBzAFsAJwBVAHMAZQByAC0AQQBnAGUAbgB0ACcAXQA9ACcATQBvAHoAaQBsAGwAYQAvADUALgAwACAAKABXAGkAbgBkAG8AdwBzADsAIABVADsAIABXAGkAbgBkAG8AdwBzACAATgBUACAANQAuADEAOwAgAGUAbgAtAFUAUwApACAAQQBwAHAAbABlAFcAZQBiAEsAaQB0AC8ANQAyADUALgAxADkAIAAoAEsASABUAE0ATAAsACAAbABpAGsAZQAgAEcAZQBjAGsAbwApACAAQwBoAHIAbwBtAGUALwAxAC4AMAAuADEANQA0AC4ANQAzACAAUwBhAGYAYQByAGkALwA1ADIANQAuADEAOQAnADsAJABkAG8AdwBuAC4AUAByAG8AeAB5AC4AQwByAGUAZABlAG4AdABpAGEAbABzAD0AWwBTAHkAcwB0AGUAbQAuAE4AZQB0AC4AQwByAGUAZABlAG4AdABpAGEAbABDAGEAYwBoAGUAXQA6ADoARABlAGYAYQB1AGwAdABOAGUAdAB3AG8AcgBrAEMAcgBlAGQAZQBuAHQAaQBhAGwAcwA7ACQAZABvAHcAbgAuAEQAbwB3AG4AbABvAGEAZABTAHQAcgBpAG4AZwAoACcAaAB0AHQAcABzADoALwAvAHIAYQB3AC4AZwBpAHQAaAB1AGIAdQBzAGUAcgBjAG8AbgB0AGUAbgB0AC4AYwBvAG0ALwBDAHIAeQBwAHQAMgBTAGgAZQBsAGwALwBXAGkAbgBHAHIAYQBkAGUALwBtAGEAcwB0AGUAcgAvAHMAYwByAGkAcAB0AHMALwBzAGUAYQByAGMAaAAuAHAAcwAxACcAKQB8AGkAZQB4AA=="
        } Catch { banner }
	Exit
    }
}
# ---------- ---------- ---------- --------- --------- #
 # --- --- --- --- --- Banner --- --- --- --- --- --- #
# ---------- ---------- ---------- --------- --------- #
function banner {
    $processor   = gwmi Win32_Processor
    $display     = gwmi Win32_DisplayConfiguration
    $os          = gwmi Win32_OperatingSystem
    $uptime      = $os.ConvertToDateTime($os.LocalDateTime) - $os.ConvertToDateTime($os.LastBootUpTime)
    $gsid        = Add-Type -AssemblyName System.DirectoryServices.AccountManagement;
    $sid         = ([System.DirectoryServices.AccountManagement.UserPrincipal]::Current).SID
    $guser       = New-Object System.Security.Principal.SecurityIdentifier($sid)
    $user        = $sid.Translate([System.Security.Principal.NTAccount])
    $computer    = gwmi Win32_ComputerSystem
    $network     = gwmi Win32_NetworkAdapterConfiguration
    try{$ipAddresses = ($network | where IPAddress |% { $_.IPAddress[0] }) -join ", "}Catch{}
                                        
         write-host "`n         ...::::::..." -ForegroundColor Red
        write-host "        :::::::::::::::" -ForegroundColor Red -NoNewline;write-host "                     Uptime:            " -ForegroundColor Gray -NoNewline;write-host "$($uptime.Days)d $($uptime.Hours)h $($uptime.Minutes)m $($uptime.Seconds)s" -ForegroundColor White;                 
       write-host "       .::::::::::::::." -ForegroundColor Red -NoNewline;write-host "  :.            ." -ForegroundColor Green
      write-host "      .:::::::::::::::" -ForegroundColor Red -NoNewline;write-host "  .:::::.....:::::" -ForegroundColor Green -NoNewline;write-host "    Operating system:  " -ForegroundColor Gray -NoNewline;write-host "$($os.Caption) $($os.OSArchitecture)" -ForegroundColor White;
      write-host "      :::::::::::::::." -ForegroundColor Red -NoNewline;write-host " .:::::::::::::::" -ForegroundColor Green -NoNewline;write-host "     Kernel:            " -ForegroundColor Gray -NoNewline;write-host "Version: $((Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\" -Name ReleaseID -ErrorAction SilentlyContinue).ReleaseId) (Build: $($os.Version))" -ForegroundColor White -ErrorAction SilentlyContinue
     write-host "     .:::::::::::::::" -ForegroundColor Red -NoNewline;write-host "  :::::::::::::::." -ForegroundColor Green 
     write-host "     ::::::'':::::::." -ForegroundColor Red -NoNewline;write-host " .:::::::::::::::" -ForegroundColor Green -NoNewline;write-host "      Computer:          " -ForegroundColor Gray -NoNewline;write-host "$($env:computername) - $($computer.Model), $($computer.Manufacturer)" -ForegroundColor White;
    write-host "    .''         '':." -ForegroundColor Red -NoNewline;write-host "  :::::::::::::::." -ForegroundColor Green -NoNewline;write-host "      User:              " -ForegroundColor Gray -NoNewline;write-host "$($user.Value)" -ForegroundColor White;
    write-host "    ...::::::::.." -ForegroundColor Cyan -NoNewline;Write-Host "    .::::::::::::::." -ForegroundColor Green -NoNewline;write-host "       SID:               " -ForegroundColor Gray -NoNewline;write-host "$($sid.Value)" -ForegroundColor White;
   write-host "   .::::::::::::::." -ForegroundColor Cyan -NoNewline;Write-Host "    ''::::::::''" -ForegroundColor Green 
  write-host "  .:::::::::::::::" -ForegroundColor Cyan -NoNewline;write-host "  ':..         ..'" -ForegroundColor Yellow -NoNewline;write-host "        CPU:               " -ForegroundColor Gray -NoNewline;write-host "$($processor.Name)" -ForegroundColor White;
  write-host "  :::::::::::::::." -ForegroundColor Cyan -NoNewline;Write-Host " .:::::::::::::::" -ForegroundColor Yellow -NoNewline;write-host "         GPU:               " -ForegroundColor Gray -NoNewline;write-host "$($display.DeviceName)" -ForegroundColor White;
 write-host " .:::::::::::::::" -ForegroundColor Cyan -NoNewline;Write-Host "  :::::::::::::::." -ForegroundColor Yellow -NoNewline;write-host "         Memory:            " -ForegroundColor Gray -NoNewline;write-host "$([math]::Truncate($os.FreePhysicalMemory / 1KB)) MB / $([math]::Truncate($computer.TotalPhysicalMemory / 1MB)) MB" -ForegroundColor White;
 write-host " :::::::::::::::." -ForegroundColor Cyan -NoNewline;Write-Host " .:::::::::::::::" -ForegroundColor Yellow 
write-host ".:::::'''::::::." -ForegroundColor Cyan -NoNewline;Write-Host "  :::::::::::::::" -ForegroundColor Yellow -NoNewline;try{write-host "           Network:           " -ForegroundColor Gray -NoNewline;write-host "$ipAddresses" -ForegroundColor White -ErrorAction SilentlyContinue}Catch{}
write-host ".           ':." -ForegroundColor Cyan -NoNewline;write-host "  .::::::::::::::." -ForegroundColor Yellow 
                                               write-host "                 .::::::::::::::" -ForegroundColor Yellow
                                              write-host "                   ''':::::'''" -ForegroundColor Yellow -NoNewline;write-host "              Shell:             " -ForegroundColor Gray -NoNewline;write-host "PowerShell v$($Host.Version)" -ForegroundColor White;
get-update
}
# ---------- ---------- ---------- --------- --------- #
 # --- --- --- --- --- GET-UPDATE --- --- --- --- --- #
# ---------- ---------- ---------- --------- --------- #
function get-update {
    write-host "`n[" -nonewline; write-host "*" -ForegroundColor Cyan -nonewline; write-host "] " -nonewline; Write-Host "searching for Updates ...[Stage 1]"
    $session = New-Object -ComObject Microsoft.Update.Session
    $searcher = $session.CreateUpdateSearcher()
    $result = $searcher.Search("IsInstalled=0 and Type='Software'" )
    $result.Updates | select Title, IsHidden, IsInstalled | Out-String | Write-Host -ForegroundColor Magenta
    install-update
}
# ---------- ---------- ---------- --------- --------- #
 # --- --- --- --- INSTALL-UPDATE --- --- --- --- --- #
# ---------- ---------- ---------- --------- --------- #
function install-update {
    if ($result.Updates.Count -eq 0) {
        write-host "`t[" -nonewline; write-host "*" -ForegroundColor Cyan -nonewline; write-host "] " -nonewline; Write-Host "No updates available."
        try {
	        if ($exitprog -eq 5) {
	            Exit
	        }
            $exitprog++
        }Catch{}
	    get-installedupdate
    }
    else {
        $result.Updates | select Title | Out-String | Write-Host -ForegroundColor Magenta
    }

    Write-Host "`n"
    $NumUp=0
    foreach ($update in $result.Updates){
        Write-Progress -Activity "Downloading Updates ..." -Status ($update.title) -PercentComplete ([int]($NumUp/$result.Updates.count*100)) -CurrentOperation "| [ $($NumUp)/$($result.Updates.count) ] | [ $([int]($NumUp/$result.Updates.count*100))% ] | [ $("{0:N1}" -f ((($update.MaxDownloadSize)/1024)/1000))MB ] |"

    if(-not $update.EulaAccepted){
        Write-Host "Accepting EULA license for $update" -ForegroundColor Yellow
        $update.AcceptEula()
    }
	
	$downloads = New-Object -ComObject Microsoft.Update.UpdateColl
    $downloads.Add($update)|out-null
    $downloader = $session.CreateUpdateDownLoader()
    $downloader.Updates = $downloads
    $downloadresult = $downloader.Download()
    $downloadresult |Out-Null
    
    if ($downloadresult.ResultCode -eq 2) {
        Write-Host "." -ForegroundColor Green -NoNewline
    }
    else {
        Write-Host "." -ForegroundColor Red -NoNewline
    }
	
	$NumUp++
    }
    Write-Host "Done!" -ForegroundColor Cyan -NoNewline
    Write-Host "`n"
    $NumUp=0
    foreach ($update in $result.Updates){ 
        Write-Progress -Activity "Installing Updates ..." -Status ($update.title) -PercentComplete([int]($NumUp/$result.Updates.count*100)) -CurrentOperation "| [ $($NumUp)/$($result.Updates.count) ] | [ $([int]($NumUp/$result.Updates.count*100))% ] | [ $("{0:N1}" -f ((($update.MaxDownloadSize)/1024)/1000))MB ] |"
	    $installs = New-Object -ComObject Microsoft.Update.UpdateColl

        if ($update.IsDownloaded){
            $installs.Add($update)|out-null
        }

        $installer = $session.CreateUpdateInstaller()
        $installer.Updates = $installs
        $installresult = $installer.Install()
        $installresult |Out-Null

        if ($installresult.ResultCode -eq 2) {
            Write-Host "." -ForegroundColor Green -NoNewline
	    $UpdateSuccessful += 1
        }
        else {
            Write-Host "." -ForegroundColor Red -NoNewline
        }
	
	$NumUp++
    }
    Write-Host "Done!" -ForegroundColor Cyan -NoNewline
    get-installedupdate
}
# ---------- ---------- ---------- --------- --------- #
 # -- --- --- --- GET-INSTALLEDUPDATE --- --- --- --- #
# ---------- ---------- ---------- --------- --------- #
function get-installedupdate {
    $session = New-Object -ComObject Microsoft.Update.Session
    $searcher = $session.CreateUpdateSearcher()
    $result = $searcher.Search("IsInstalled=1 and Type='Software'" )
    $result.Updates | select Title, IsInstalled, LastDeploymentChangeTime | Out-String | Write-Host -ForegroundColor DarkCyan
    write-host "["-nonewline; write-host "!" -ForegroundColor Yellow -nonewline; write-host "] "-nonewline; Write-Host "Waiting ...[15s]" -NoNewline; sleep -s 15
    if ($UpdateSuccessful -ne 0){ get-notification }else{ get-reboot }
}
# ---------- ---------- ---------- --------- --------- #
 # ---- --- --- --- GET-NOTIFICATION --- --- --- ---- #
# ---------- ---------- ---------- --------- --------- #
function get-notification {
    if ([System.Environment]::OSVersion.Version.Major -eq 10)
    {
        if ([CultureInfo]::InstalledUICulture.Name -contains "de-DE")
        {
            Add-Type -AssemblyName System.Windows.Forms 
            $global:Notification = New-Object System.Windows.Forms.NotifyIcon
            $path = (Get-Process -id $pid).Path
            $Notification.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path) 
            $Notification.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Info
            $Notification.BalloonTipTitle = "Achtung! $Env:USERNAME" 
            $Notification.BalloonTipText = 'Es wurden Windows updates installiert! [' + $UpdateSuccessful + '/' + $($NumUp) + ']'
            $Notification.Visible = $true 
            $Notification.ShowBalloonTip(30000)
	    get-reboot
        }
        else
        {
            Add-Type -AssemblyName System.Windows.Forms 
            $global:Notification = New-Object System.Windows.Forms.NotifyIcon
            $path = (Get-Process -id $pid).Path
            $Notification.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path) 
            $Notification.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Info
            $Notification.BalloonTipTitle = "Attention! $Env:USERNAME" 
            $Notification.BalloonTipText = 'Windows updates were installed! [' + $UpdateSuccessful + '/' + $($NumUp) + ']'
            $Notification.Visible = $true 
            $Notification.ShowBalloonTip(30000)
	    get-reboot
        }
    }
    else
    {
        Write-Host "[!] This Notification is not for older Windows Systems!"
        Write-Host "[*] Continue ..."
	get-reboot
    }
}
# ---------- ---------- ---------- --------- --------- #
 # --- --- --- --- --- GET-REBOOT --- --- --- --- --- #
# ---------- ---------- ---------- --------- --------- #
function get-reboot {
    $key = Get-Item "HKLM:SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired" -ErrorAction SilentlyContinue
    if($key -ne $null -or $installresult.rebootRequired) {
        write-host "`n["-nonewline; write-host "*" -ForegroundColor Cyan -nonewline; write-host "] "-nonewline; Write-Host "Rebooting..."
        net user Administrator WinGrade /active:yes
	$url = "https://raw.githubusercontent.com/Crypt2Shell/WinGrade/master/WinGrade.bat"
	$output = "$env:windir\WinGrade.bat"
	$start_time = Get-Date
	(New-Object System.Net.WebClient).DownloadFile($url, $output)
	Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
	reg ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoAdminLogon" /t "REG_SZ" /d "1" /f
	#reg ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultDomainName"/t "REG_SZ" /f
	reg ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultUserName" /t "REG_SZ" /d "Administrator" /f
	reg ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultPassword" /t "REG_SZ" /d "WinGrade" /f
	schtasks /create /tn "WinGrade" /SC onlogon /RU "Administrator" /RP "WinGrade" /IT /DELAY 0000:30 /RL highest /F /TR 'cmd.exe /c "%windir%\WinGrade.bat"'
	explorer ms-settings:windowsupdate-action
	sleep -s 20
	Restart-Computer -Force
    }
    else { 
        write-host "`n["-nonewline; write-host "*" -ForegroundColor Cyan -nonewline; write-host "] "-nonewline; Write-Host "No reboot required."
	del "$env:windir\WinGrade.bat" -ErrorAction SilentlyContinue
	reg ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoAdminLogon" /t "REG_SZ" /d "0" /f
	reg ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultUserName" /t "REG_SZ" /f
	reg DELETE "HKLM\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultPassword" /f
	net user Administrator /active:no
	schtasks /delete /F /TN "WinGrade"
        elevate-privileges
    }
}
elevate-privileges
