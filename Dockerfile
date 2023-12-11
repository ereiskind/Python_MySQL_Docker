FROM python:<<Python_version>>

####
# Install Chrome and Selenium Chromedriver
# If placed after the pip installation and git clone in Docerfile, these commands don't execute

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c "echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' >>   /etc/apt/sources.list"
RUN apt-get -y update
RUN apt-get install -y google-chrome-stable

# Install Chromedriver
RUN apt-get install -yqq unzip
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`/chromedriver_linux64.zip
RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/

# Set display port to avoid crash
ENV DISPLAY=:99

####
# Prepare the Python Environment
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
RUN git clone <<Git_clone_URL>> ./root/<<project_file_name>>
COPY ./src/ ./root/<<project_file_name>>/
WORKDIR ./root/<<project_file_name>>