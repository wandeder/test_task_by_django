lint: #linter for code
	poetry run flake8 --ignore=E501 menu_builder

start: #starting dev server
	poetry run python3 manage.py runserver

migrate: #make and add migrations
	poetry run python3 manage.py makemigrations menu_builder
	poetry run python3 manage.py migrate

shell: #start shell
	poetry run python3 manage.py shell_plus

export: #make export dependens from poetry on Heroku
	poetry export -f requirements.txt --output requirements.txt

admin: #create new admin
	poetry run python3 manage.py createsuperuser
