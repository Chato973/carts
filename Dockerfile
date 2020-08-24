FROM schoolofdevops/carts-maven


WORKDIR /opt/carts

COPY . .

RUN mvn package -Dskiptests && mv ./target/carts.jar /run/carts.jar && rm -r ./*

EXPOSE 80

CMD java -jar /run/carts.jar --ports=80

