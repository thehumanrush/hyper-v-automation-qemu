$imgFile = "C:\Users\bangjago\Downloads\iso\ubuntu-22.10-server-cloudimg-amd64.img"
$rootPublicKey = Get-Content "C:\Users\bangjago\.ssh\id_rsa.pub"

$gateway = "192.168.43.1"
$vm = @(
    @{name='node0';fqdn='node0';ip='192.168.43.100/24'},
    @{name='node1';fqdn='node1';ip='192.168.43.101/24'}
)

for ($i = 0; $i -lt $vm.Count; $i++) {
.\New-VMFromUbuntuImage.ps1 -SourcePath $imgFile -VMName $vm[$i].name -FQDN $vm[$i].fqdn -RootPublicKey $rootPublicKey -VHDXSizeBytes 30GB -MemoryStartupBytes 2GB -ProcessorCount 2 -SwitchName 'bridge-ultimatewarrior' -InterfaceName 'eth0' -IPAddress $vm[$i].ip -Gateway $gateway -DnsAddresses '1.1.1.1','8.8.8.8' -Verbose
}