delimiter=' | '
status() {

    grep "^\s*w" /proc/net/wireless | awk '{ print " ",int($3 * 100 /70)}'
    sed "s/down//;s/up//" /sys/class/net/e*/operstate
    printf "$delimiter"

    acpi| awk '{for(i=1;i<=NF;i++) if($i~/.*%.*/){print $i" "}}' | tr -d  ','
    printf '\uF240'
    printf "$delimiter"
    date +"%R"
    printf ' \uF43A'
    printf "$delimiter"
    date +"%d.%m.%y"
    printf ' \uF073 '

}
dwlb -status all  "$(status | tr -d '\n')"
