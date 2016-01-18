if [ -z "$DOMAIN" ]; then
    case "$HOSTNAME" in
        *.*)
            DOMAIN="${HOSTNAME#*.}"
            HOSTNAME="${HOSTNAME%%.*}"
            export DOMAIN HOSTNAME
            ;;
    esac
fi
