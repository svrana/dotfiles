function unset-delete-on-terminate() {
    if [ -z "$1" ]; then
        echo "Must specify an instance id"
        return 1
    fi

    volume="${2:-/dev/sda1}"

    aws ec2 modify-instance-attribute --instance-id "$1" --block-device-mappings \
        "[{\"DeviceName\": \"$volume\",\"Ebs\":{\"DeleteOnTermination\":false}}]"
}
