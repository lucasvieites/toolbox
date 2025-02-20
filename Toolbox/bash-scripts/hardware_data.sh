#!/bin/bash
# Uses dmidecode to fetch hardware data
# DMI_STRINGS is obtained running "/usr/sbin/dmidecode -s"
DMI_STRINGS="bios-vendor
bios-version
bios-release-date
system-manufacturer
system-product-name
system-version
system-serial-number
system-uuid
baseboard-manufacturer
baseboard-product-name
baseboard-version
baseboard-serial-number
baseboard-asset-tag
chassis-manufacturer
chassis-type
chassis-version
chassis-serial-number
chassis-asset-tag
processor-family
processor-manufacturer
processor-version
processor-frequency"

for data in $DMI_STRINGS; do
	echo -n "$data -> "
	/usr/sbin/dmidecode -s $data
done

num_cores=`cat /proc/cpuinfo | grep processor | wc -l`
echo ""
echo "Number of processor cores: " $num_cores

echo "RAM size: " `free -h | gawk  '/Mem:/{print $2}'`
