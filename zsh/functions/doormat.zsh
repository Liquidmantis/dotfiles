func doormat_aws_export() {
  local aws_profile
  aws_profile=$(aws configure list-profiles | fzf --height 40% --reverse --inline-info --header "Select AWS Profile" --prompt "AWS Profile: ")

  if [[ -z "${aws_profile}" ]]; then
    echo "No AWS profile selected. Aborting."
    return 1
  fi

  local tries=0
  while [[ $tries -lt 3 ]]; do
    if doormat aws export --account "${aws_profile}" --open-access-request; then
      break
    else
      echo "Failed to export AWS credentials. Retrying..."
      ((tries++))
    fi
  done
  echo "Starting doormat auth for AWS profile: ${aws_profile}"
  eval $(doormat aws export --account "${aws_profile}" --open-access-request)
}
alias dmae=doormat_aws_export
