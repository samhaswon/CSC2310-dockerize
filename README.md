# CSC2310-dockerize
For converting the completed F22 CSC2310 project into a docker container

---
## Important!
The files in this repository must be in the project's root directory

---
### Build the container
From the project's root directory:\
*Linux*
```sh
docker build -t it2 .
```
*Windows*
```ps
docker build -t it2 .
```
---
### Run the container (detached)
*Linux*
```sh
sudo docker run -dp 5000:5000 it2
```
*Windows*
```ps
docker run -dp 5000:5000 it2
```