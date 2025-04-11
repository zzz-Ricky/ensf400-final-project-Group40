FROM ubuntu:22.04
COPY . /project
WORKDIR /project

USER root

#install tool
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    software-properties-common
# #python
# RUN apt-get install -y python3 python3-pip && \
#     ln -s /usr/bin/python3 /usr/bin/python
#java
RUN apt-get install -y openjdk-17-jdk
RUN apt-get install -y openjdk-17-jre
# RUN java -version && python --version
RUN java -version
#unzip
RUN apt-get update && apt-get install -y unzip
# #gradle
ENV GRADLE_VERSION=8.13
RUN wget https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip -O /tmp/gradle.zip && \
    unzip /tmp/gradle.zip -d /opt && \
    rm /tmp/gradle.zip
ENV GRADLE_HOME=/opt/gradle-${GRADLE_VERSION}
ENV PATH=$PATH:$GRADLE_HOME/bin

# Install Google Chrome (needed for ChromeDriver)
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor > /usr/share/keyrings/google-chrome-keyring.gpg && \
    echo 'deb [signed-by=/usr/share/keyrings/google-chrome-keyring.gpg] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list && \
    apt-get update && apt-get install -y google-chrome-stable

#chorme driver
RUN CHROMEDRIVER_VERSION=$(wget -qO - https://chromedriver.storage.googleapis.com/LATEST_RELEASE) && \
    wget -q -O /tmp/chromedriver.zip https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip && \
    unzip /tmp/chromedriver.zip -d /usr/local/bin/ && \
    rm /tmp/chromedriver.zip
RUN chmod +x /usr/local/bin/chromedriver
RUN chromedriver --version

#Clean
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN chmod -R +x /project

EXPOSE 8080
# CMD [ "./gradlew","apprun" ]