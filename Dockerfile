FROM microsoft/dotnet

LABEL maintainer="gornialberto@gmail.com" Description="Docker container for running Predix .NET Core Tools"

#add the mosquitto repository, install it and create the data and log foldoer to be shared later as volumes with the host
RUN cd /opt && git clone https://github.com/gornialberto/PredixNetCore.git && \
    cd PredixNetCore && dotnet restore && dotnet build && \
    cd /opt && mkdir output

#set the environment variables
ENV baseUAAUrl=<set the base uaa url>
ENV clientID=<set the base uaa url>
ENV clientSecret=<set the base uaa url>
ENV edgeManagerBaseUrl=<set the base uaa url>
ENV csvFilePath=/opt/output/DeviceList.csv

WORKDIR /opt/PredixNetCore/GetDeviceList

#run mosquitto (it will use the standard configuration raplaced)
CMD ["dotnet run"]