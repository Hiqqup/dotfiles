acpi| awk '{for(i=1;i<=NF;i++) if($i~/.*%.*/){print $i}}'| tr -d '\n'
