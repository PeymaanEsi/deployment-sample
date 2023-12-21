# PeymaanEsi
## Simple project deployment instructions
**This projects contains:** 
* Python
* Django
* Postgres
* Redis
## Phase one (Make the project)
* First make the repository
* Then add a python **virtualenv**:
> python3 -m venv .venv
* Active the venv
> source .venv/bin/activate
* Install needed packages
* Check the version of every required package (Ignore dependencies)
> pip list --outdated
* Add them to **requirements.txt** with this format:
> PACKAGE==X.Y.Z		to		PACKAGE<X.(Y+1),>=X.Y.Z
* Add ignorant files to **.gitignore**
* Copy the **Dockerfile**
* Determine the Python version in Dockerfile on the **first line**:
* > FROM python:**3.10**-alpine
* Determine the **WSGI** module in Dockerfile on the **last line**:
* > CMD ["gunicorn", "--bind", "0.0.0.0:8000", "**project.wsgi**"]
* Copy the **docker-compose.yaml** and **docker-compose.debug.yaml**
* Change the default names on both files
### Continue making the project...
## Phase two (Build)
* Execute these commands:
* > docker compose build && docker compose run --rm app sh -c "/app/manage.py makemigrations && /app/manage.py migrate && /app/manage.py createsuperuser"
## Phase three (Run)
* Run the project with 
* > docker compose up
* And End it with
* > docker compose down