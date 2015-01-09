# TODO: we need this to get Python 3 at least 3.4; remove when 21 becomes "the" fedora docker image
FROM fedora:21

WORKDIR /srv
RUN yum -y install python3 && pyvenv "Nw2"

ADD . /srv/Nw2/Nw2
RUN cd "Nw2" && source bin/activate && pip3 install -r "Nw2/requirements.txt"


EXPOSE 8000
CMD source /srv/Nw2/bin/activate && \
 /srv/Nw2/Nw2/manage.py runserver 0.0.0.0:8000
