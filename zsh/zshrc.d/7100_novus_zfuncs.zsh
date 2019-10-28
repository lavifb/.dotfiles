# Novus upload pip package to nexus

function pipup () {
  if [ $# -ne 1 ]; then
    echo "Need 1 parameter"
    echo "Usage: $0 [path-to-whl]"
  else
    /usr/local/bin/python3 -m twine upload -r pypicloud $1
  fi
}