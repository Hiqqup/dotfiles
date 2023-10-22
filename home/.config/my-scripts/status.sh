delimiter=' | '
status() {

    acpi| awk '{for(i=1;i<=NF;i++) if($i~/.*%.*/){print $i}}'
    printf ' \uF240'
    printf "$delimiter"
    date +"%R"
    printf ' \uF43A'
    printf "$delimiter"
    date +"%d-%m-%y"
    printf ' \uF073 '
}
xsetroot -name "$(status | tr -d '\n')"
