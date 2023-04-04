# gunicorn-demo
'''
docker build -t gunicorn https://raw.githubusercontent.com/WiltonCarvalho/gunicorn-demo/main/Dockerfile --progress=plain
docker run -d --rm -p 5000:5000 --name gunicorn gunicorn
curl -fsSL localhost:5000
'''
