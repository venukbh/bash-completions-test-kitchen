
__kitchen_command_options() {

  COMPREPLY=()
  local all="-a --all --no-all"
  local auto_init="--auto-init --no-auto-init"
  local bare="-b --bare --no-bare"
  local base_path="-t --test-base-path="
  local command="-c --command="
  local log="-l --log-level --log-overwrite --no-log-overwrite"
  local color="--color --no-color"
  local debug="-D --debug --no-debug"
  local destroy="-d --destroy="
  local driver="-D --driver="
  local gemfile="--create-gemfile --no-create-gemfile"
  local instances="--instances --no-instances"
  local json="-j --json --no-json"
  local loader="--loader --no-loader"
  local plugins="--plugins --no-plugins"
  local provisioner="-P --provisioner="
  local concurrency="-c --concurrency="
  local parallel="-p --parallel --no-parallel"

  local all_common="${log} ${color}"
  local semi_common="${concurrency} ${parallel} ${base_path}"
  local sub_commands="console converge create destroy diagnose doctor exec help init list login package setup test verify version"

  local sub_command=${COMP_WORDS[1]}
  local current_word=${COMP_WORDS[COMP_CWORD]}
  local previous_word="${COMP_WORDS[COMP_CWORD-1]}"

  case "${sub_command}" in
    console)
      COMPREPLY="" ;;
    converge)
      COMPREPLY=( $(compgen -W "${all_common} ${semi_common} ${debug}" -- "${current_word}" ) ) ;;
    create)
      COMPREPLY=( $(compgen -W "${all_common} ${semi_common}" -- "${current_word}" ) ) ;;
    destroy)
      COMPREPLY=( $(compgen -W "${all_common} ${semi_common}" -- "${current_word}" ) ) ;;
    diagnose)
      COMPREPLY=( $(compgen -W "${all_common} ${loader} ${plugins} ${instances} ${all} ${base_path}" -- "${current_word}" ) ) ;;
    doctor)
      COMPREPLY=( $(compgen -W "${all_common} ${all}" -- "${current_word}" ) ) ;;
    exec)
      COMPREPLY=( $(compgen -W "${all_common} ${command}" -- "${current_word}" ) ) ;;
    help)
      COMPREPLY=( $(compgen -W "${sub_commands}" -- "${current_word}" ) ) ;;
    init)
      COMPREPLY=( $(compgen -W "${driver} ${provisioner} ${gemfile}" -- "${current_word}" )) ;;
    list)
      COMPREPLY=( $(compgen -W "${all_common} ${debug} ${bare} ${json}" -- "${current_word}" ) ) ;;
    login)
      COMPREPLY=( $(compgen -W "${all_common}" -- "${current_word}" ) ) ;;
    package)
      COMPREPLY=( $(compgen -W "${all_common}" -- "${current_word}" ) ) ;;
    setup)
      COMPREPLY=( $(compgen -W "${all_common} ${semi_common}" -- "${current_word}" ) ) ;;
    test)
      COMPREPLY=( $(compgen -W "${all_common} ${semi_common} ${debug} ${destroy} ${auto_init}" -- "${current_word}" ) ) ;;
    verify)
      COMPREPLY=( $(compgen -W "${all_common} ${semi_common} ${debug}" -- "${current_word}" ) ) ;;
    version)
      COMPREPLY="" ;;
    *)
      COMPREPLY=( $(compgen -W "${sub_commands}" -- "${current_word}" ) ) ;;
  esac
}

complete -o default -F __kitchen_command_options kitchen
