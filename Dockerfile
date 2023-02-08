FROM stevearc/pypicloud

EXPOSE 8080
USER root
COPY s3-postgres-docker.ini /etc/pypicloud/config.ini
COPY script.sh ./script.sh
RUN chmod +x ./script.sh
CMD [ "./script.sh" ]