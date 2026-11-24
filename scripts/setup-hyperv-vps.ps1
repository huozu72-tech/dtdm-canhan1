New-VMSwitch -SwitchName "CloudLab-NAT" -SwitchType Internal
$ifIndex = (Get-NetAdapter -Name "vEthernet (CloudLab-NAT)").ifIndex
New-NetIPAddress -IPAddress 192.168.100.1 -PrefixLength 24 -InterfaceIndex $ifIndex
New-NetNat -Name "CloudLab-NAT-Network" -InternalIPInterfaceAddressPrefix 192.168.100.0/24
New-VM -Name "vps-2324802010383" -MemoryStartupBytes 2GB -Generation 2 -NewVHDPath "D:\DTDM-CN\vms\vps-2324802010383.vhdx" -NewVHDSizeBytes 20GB -SwitchName "CloudLab-NAT"
Set-VMProcessor -VMName "vps-2324802010383" -Count 2
Set-VMMemory -VMName "vps-2324802010383" -DynamicMemoryEnabled $false
Set-VMFirmware -VMName "vps-2324802010383" -SecureBootTemplate "MicrosoftUEFICertificateAuthority"
Start-VM -Name "vps-2324802010383"
Checkpoint-VM -Name "vps-2324802010383" -SnapshotName "Bai1-HoanThanh-2324802010383"
