# nubis-awscli

Docker container containing the aws cli tool

Run it like:

```bash
aws-vault exec nubis-training-ro -- docker run --env-file ~/.docker_env nubis-awscli s3 ls
```

Or in a script like:

```bash
AWS_COMMAND=( 'iam' 'create-virtual-mfa-device' '--virtual-mfa-device-name' "${LDAP_LOGIN}" '--outfile' "${LDAP_LOGIN}.png" '--bootstrap-method' 'QRCodePNG' )
VIRTUAL_MFA_ARN=$(aws-vault exec -n "${NUBIS_ACCOUNT}" -- \
    docker run \
        --env-file "${DOCKER_ENV_FILE}" \
        "${DOCKER_IMAGE}" ${AWS_COMMAND[@]} \
    | docker run -i "${JQ_DOCKER_IMAGE}" jq --raw-output '.VirtualMFADevice.SerialNumber // empty')
echo "${VIRTUAL_MFA_ARN}"
```
