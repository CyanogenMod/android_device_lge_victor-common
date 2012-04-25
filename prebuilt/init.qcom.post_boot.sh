usb_config=`getprop persist.sys.usb.config`
case "$usb_config" in
    "") #USB persist config not set, select default configuration
        setprop persist.sys.usb.config mtp,adb
    ;;
esac
