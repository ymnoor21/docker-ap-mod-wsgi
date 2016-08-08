# Instructions:

Use docker pull command: `docker pull ymnoor21/ap-mod-wsgi` to pull down the image.

Use this command: `git clone https://github.com/ymnoor21/docker-ap-mod-wsgi.git` to clone the repo.

And run these commands when setting up the project for the first time

```bash
1. docker build -t ymnoor21/ap-mod-wsgi:v1 -f Dockerfile .

2. docker create -v ~/Docker_boxes/apache2.4.18-mod_wsgi4.3.0-python3.5.2/site:/var/www/site --name django_data ubuntu:16.04 /bin/true

3. docker run -d -it --name ap-mod-wsgi --volumes-from django_data --link mysql_container:mysql -p 8000:80 ymnoor21/ap-mod-wsgi:v1 /bin/bash

4. docker exec -it ap-mod-wsgi /bin/bash

5. cd /var/www/site
	
6. virtualenv venv

7. source venv/bin/activate
	
8. pip3 install django

9. pip3 install mysqlclient

10. django-admin.py startproject myproject .

11. pip3 freeze > requirements.txt
```

Add these following lines to `myproject/settings.py` file:

- Replace database driver to `mysql`:

```python
   'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'databasename',
        'USER': 'dbuser',
        'PASSWORD': 'dbpass',
        'HOST': 'mysql_container_host_ip_or_localhost',
        'PORT': '3306',
    }
```

- Add static root:

```python
STATIC_ROOT = os.path.join(BASE_DIR, 'static/')
```

```bash
12. ./manage.py makemigrations

13. ./manage.py migrate
	
14. ./manage.py createsuperuser
	
15. ./manage.py collectstatic

16. chown -R :www-data /var/www/site

17. chmod -R 775 /var/www/site

18. deactivate
```
Now point your browser to this: http://localhost:8000
