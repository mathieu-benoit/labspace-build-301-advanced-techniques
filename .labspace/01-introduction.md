# Introduction

TODOs:
- commands
- base image
- multi-stage
- distroless

TODO later:
- based on ubuntu originally
```
FROM ubuntu

RUN apt-get update -y
RUN apt-get install -y python3-pip
RUN pip3 install --upgrade pip
RUN rm -f /var/lib/lists
```

👋 Welcome to the **Labspace starter** lab! During this lab, you will learn to do the following:

- Learning Objective 1
- Learning Objective 2
- Learning Objective 3
- Learning Objective 4


## 🙋 What is a Labspace again?

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis lacinia nisi sit amet auctor accumsan. Maecenas suscipit, libero quis ullamcorper pulvinar, dolor nisl vehicula orci, vel egestas arcu nibh eget enim. 

Suspendisse potenti. Pellentesque eleifend eget ante eu egestas. 

Nunc sit amet dapibus erat. Aliquam diam arcu, fringilla hendrerit metus sed, pellentesque fringilla lacus. 

Nulla ornare nulla risus. Curabitur ut ipsum euismod, accumsan lorem eu, pretium lorem. Fusce imperdiet fermentum hendrerit.


`dive`:
```bash
DIVE_VERSION=$(curl -sL "https://api.github.com/repos/wagoodman/dive/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/')
curl -fOL "https://github.com/wagoodman/dive/releases/download/v${DIVE_VERSION}/dive_${DIVE_VERSION}_linux_amd64.deb"
sudo apt install ./dive_${DIVE_VERSION}_linux_amd64.deb
```