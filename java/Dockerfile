FROM openjdk AS build

ENV ISC_PACKAGE_INSTALLDIR /usr/irissys
ENV ISC_LIBDIR ${ISC_PACKAGE_INSTALLDIR}/dev/java/lib/JDK18
WORKDIR /java
#COPY src .
COPY --from=containers.intersystems.com/intersystems/iris:2020.1.3.521.0 $ISC_LIBDIR/*.jar /java/build/libs/
