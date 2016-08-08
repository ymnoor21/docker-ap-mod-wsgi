Use docker pull command: `docker pull ymnoor21/ap-mod-wsgi` to pull down the image.

Use this command: `git clone https://github.com/ymnoor21/docker-ap-mod-wsgi.git` to clone the repo.

And run these commands when setting up the project for the first time

```bash
1. docker build -t ymnoor21/ap-mod-wsgi:v1 -f Dockerfile .

2. docker create -v ~/Docker_boxes/apache2.4.18-mod_wsgi4.3.0-python3.5.2/site:/var/www/site --name django_data ubuntu:16.04 /bin/true

3. docker run -d -it --name ap-mod-wsgi --volumes-from django_data -p 8000:80 ymnoor21/ap-mod-wsgi:v1 /bin/bash

4. docker exec -it ap-mod-wsgi /bin/bash

5. cd /var/www/site
	
6. virtualenv venv

7. source venv/bin/activate
	
8. pip3 install django

9. django-admin.py startproject myproject .

10. pip3 freeze > requirements.txt
```
Add this following line to the end of this (myproject/settings.py) file:
```python
STATIC_ROOT = os.path.join(BASE_DIR, 'static/')
```
```bash
11. ./manage.py makemigrations

12. ./manage.py migrate
	
13. ./manage.py createsuperuser
	
14. ./manage.py collectstatic

15. chown -R :www-data /var/www/site

16. chmod -R 775 /var/www/site

17. deactivate
```
Now point your browser to this: http://localhost:8000
