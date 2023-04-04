# gunicorn-demo
```
docker build -t gunicorn --progress=plain \
  https://github.com/WiltonCarvalho/gunicorn-demo.git#main
docker run -d --rm -p 5000:5000 --name gunicorn gunicorn
curl -fsSL localhost:5000
```
