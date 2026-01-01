#!/usr/bin/env bash
# https://github.com/bazel-contrib/rules_go/issues/4248

if [[ -f "go.work" ]]; then
  new_args=()
  for arg in "${@}"; do
    if [[ "$arg" == "./..." ]]; then
      new_args+=($(go list -m -f '{{.Path}}' | xargs -I {} echo {}/...))
    else
      new_args+=("$arg")
    fi
  done
  set -- "${new_args[@]}"
fi
exec bazel run -- @rules_go//go/tools/gopackagesdriver "${@}"
