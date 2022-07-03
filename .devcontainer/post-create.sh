echo "Istalling pipx ..."
pip3 install --user pipx 

pipx install poetry
# poetry config --local virtualenvs.in-project true

if [[ -f pyproject.toml || -f poetry.lock ]]; then
    echo "Found a pyproject.toml or poetry.lock ..."
else
    echo "No pyproject.toml or poetry.lock found ..."
    poetry init
fi

if [[ -f requirements.txt ]]; then
    echo "Found a requirements.txt ..."
else
    if [[ -f pyproject.toml ]]; then
        echo "Found a pyproject.toml but not a requirements.txt ..."
        poetry export -f requirements.txt --output requirements.txt --without-hashes
    fi
fi

poetry update && poetry install
