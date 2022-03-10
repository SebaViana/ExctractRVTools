$RVTools = "C:\Program Files (x86)\Robware\RVTools" 

$Datetime = get-date -format `yyyy-MM-dd 
$Datetime2 = get-date -format `yyyy-MM-dd_HH:MM:SS
$VCServer = "test-server.vcenter.net"
$User = "administrator@vsphere.local"
$EncryptedPassword = "_RVToolsPWDASH8SyDP8ajnjLiV2wjYJBQjct9Ak2p3gPP+L0WBDc="
$XlsxDir1 = "C:\Users\Viana\Documents\ReportsRVTools"
$XlsxFile1 = $VCServer + "_" + $Datetime + "_RVToolsExport.xlsx"

Write-Host "$VCServer at $Datetime2 : Export Started"
    
$Arguments = "-u $User -p $EncryptedPassword -s $VCServer -c ExportAll2xlsx -d $XlsxDir1 -f $XlsxFile1 -DBColumnNames -ExcludeCustomAnnotations"

$Process = Start-Process -FilePath "C:\Program Files (x86)\Robware\RVTools\RVTools.exe" -ArgumentList $Arguments -NoNewWindow -Wait -PassThru

    if($Process.ExitCode -eq -1) {
        
        Write-Host "$VCServer at $Datetime2 : Connection FAILED!" -ForegroundColor Red

    } else {
        
        Write-Host "$VCServer at $Datetime2 : Export Successful" -ForegroundColor Green

    }