#!/bin/bash
set -e
tabs 4
shopt -s expand_aliases

cd "$(dirname "$0")/ergast-f1-api"

color_green='\033[0;32m'
color_yellow='\033[0;33m'
color_off='\033[0m'

option_operation=
option_backend_port=
option_expose_database=
option_clean_docker=

function print_welcome() {
  if [[ -z "$option_operation" ]]; then
    echo -e "Please select an option:\n\t" \
      "1: (backend)    Run backend\n\t" \
      "0: (clean)      Clean docker\n\t"

    echo -n "What do you want to do? (number): "
    read -r option_operation
  fi
}

function print_help() {
  cat <<EOF
Usage: ergast [1|backend] [params...]

Options:
    -h      --help                Show this message
    -c      --clean               Remove all docker images before run (force rebuild)
    -p      --backend-port        Set backend port (ex.: -p 8000 / --backend-port 8000)
    -ed     --expose-db           Expose database port (ex.: -ed 3306 / --expose-db 3306)

EOF
  exit 0
}

function process_parameters() {
  if [[ "$1" =~ ^[0-9a-z]+ ]]; then
    option_operation=$1
    shift
  fi

  while test $# -gt 0; do
    case $1 in
    -h | --help) print_help ;;
    -c | --clean)
      option_clean_docker=true
      ;;
    -p | --backend-port)
      shift
      option_backend_port=$1
      ;;
    -ed | --expose-db)
      shift
      option_expose_database=$1
      ;;
    *)
      break
      ;;
    esac
    shift
  done
}

function run_script() {
  case "$option_operation" in
  1 | backend)
    if [[ -z "${option_backend_port}" ]]; then
      option_backend_port=8000
    fi
    ;;
  0 | clean) clean_docker_and_exit ;;
  *)
    echo "Exiting..."
    exit 0
    ;;
  esac

  if [[ "${option_clean_docker}" == true ]]; then
    clean_docker
  fi
}

function assert_command_exists() {
  if ! command -v "$1" &>/dev/null; then
    echo "$1 not installed!"
    exit
  fi
}

function assert_docker_running() {
  if ! docker info >/dev/null 2>&1; then
    echo "Docker not running!"
    exit 1
  fi
}

function get_health_state() {
  local return_code
  state=$(docker inspect -f '{{ .State.Health.Status }}' $1)
  return_code=$?
  if [ ! ${return_code} -eq 0 ]; then
    exit 1
  fi
  if [[ "${state}" == "healthy" ]]; then
    return 0
  elif [[ "${state}" == "unhealthy" ]]; then
    return 2
  elif [[ "${state}" == "starting" ]]; then
    return 1
  else
    return 3
  fi
}

function wait_for_container() {
  for _ in $(seq 60); do
    echo "Wait for backend to be healthy..."
    set +e
    get_health_state "$1"
    state=$?
    set -e
    if [ ${state} -eq 0 ]; then
      return
    fi
    sleep 1
  done

  echo "Healthcheck timeout exceeded"
  exit
}

function clean_docker_and_exit() {
  clean_docker
  echo 'Clean success!'
  exit 0
}

function clean_docker() {
  docker compose down --rmi all --remove-orphans 2>/dev/null || true
}

function stop_containers() {
  if [[ -n $(docker compose ps -q) ]]; then
    docker compose down || true
  fi
}

echo -e "Ergast API CLI v1.0.0\n"

process_parameters "$@"
print_welcome
run_script

export BE_PORT="$option_backend_port"

assert_command_exists docker
docker compose version > /dev/null
assert_docker_running
stop_containers

function run_backend() {
  local override

  if [[ -n "$option_expose_database" ]]; then
    override="-f docker-compose.ed.yaml"
  fi

  local DB_PORT COMPOSE_IGNORE_ORPHANS
  export DB_PORT="$option_expose_database"
  export COMPOSE_IGNORE_ORPHANS=true

  # shellcheck disable=SC2086
  docker compose $override up --build -d

  docker compose logs --tail 100 -f &
  sleep 1
  wait_for_container web
}

function on_exit {
  echo 'Stopping...'
  stop_containers
}

trap 'on_exit' EXIT

run_backend

function print_info() {
  local ip
  ip=$(ipconfig getifaddr "$(scutil --dns | awk -F'[()]' '$1~/if_index/ {print $2;exit;}')") || hostname -I | awk '{print $1}' || true

  echo -e "\n${color_green}ready${color_off} - Ergast API ${color_yellow}backend${color_off} started:\n\n" \
    "\thttp://localhost:${option_backend_port}\n" \
    "\thttp://${ip}:${option_backend_port}\n"

  echo -e "You can run WCS Mobil now:\n\n\tflutter run --dart-define API_URL=http://${ip}:${option_backend_port}/api/f1\n"

  echo "Press Ctrl-C to stop running"
}

(sleep 3 && print_info) &

wait
