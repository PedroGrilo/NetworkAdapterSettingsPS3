# Pedro Grilo
# https://github.com/PedroGrilo

try{

function GetIndexNetworkInterface {
    [int]$intNum = [convert]::ToInt32(((Get-NetAdapter | Where-Object {$_.Status -eq 'Up' -and $_.Name -ilike "Ethernet*"}).ifIndex), 10)
    $intNum
}


[bool] $option = $true


while($option){
    
    $boolPS3Host = Read-Host "Do you want transfer files via FTP to PS3? (Y/R(Reset))"
    
    
    if($boolPS3Host.ToUpper().Equals("Y")){
        
         [bool] $option = $false
     

         New-NetIPAddress –InterfaceIndex (GetIndexNetworkInterface) -DefaultGateway "192.168.0.1" -PrefixLength 24 -AddressFamily "IPV4" -IPAddress "192.168.0.2"
        
         Set-DNSClientServerAddress –InterfaceIndex (GetIndexNetworkInterface) –ServerAddresses 8.8.8.8 #set google DNS

         Clear-DnsClientCache

        Write-Host  "In your PS3 go to Network Options -> Internet Connection Settings -> Custom -> Wired Connection -> Manual Settings -> '1000BASE-T FULL-DUPLEX' ->"
        Write-Host "-> Manual -> And put this: "
        Write-Host  " IP ADDRESS : 192 . 168 . 0 . 5"
        Write-Host  " SUBNET MASK : 255 . 255 . 255 . 0"
        Write-Host  " DEFAULT ROUTER : 192 . 168 . 0 . 1"
        Write-Host  " PRIMARY DNS : 8 . 8 . 8 . 8"
        Write-Host  " SECONDARY DNS : 0 . 0 . 0 . 0"
        Write-Host   "-> CLICK NEXT -> Automatic -> Do Not Use -> And save it"
        Write-Host  "----------------------------------------------------------"
        Write-Host  "In your PC go to FILEZILLA and in IP Server put 192.168.0.5 and DONE :)"
    
        pause 

    }elseif($boolPS3Host.ToUpper().Equals("R")){
        
         [bool] $option = $false
          
         Set-NetIPInterface -InterfaceIndex (GetIndexNetworkInterface) -Dhcp Enabled

         Set-DnsClientServerAddress –InterfaceIndex (GetIndexNetworkInterface) -ResetServerAddresses

         Set-DNSClientServerAddress –InterfaceIndex (GetIndexNetworkInterface) –ServerAddresses 8.8.8.8 #set google DNS

         Clear-DnsClientCache

         Set-NetIPInterface –InterfaceIndex (GetIndexNetworkInterface)| Remove-NetRoute Remove-NetRoute –InterfaceIndex (GetIndexNetworkInterface) -Confirm:$false


     }else{

        "Wrong option :("
    }
    
}

}catch { "An error occurred. Try with Administrator Privileges" 
            pause }
