FROM centos:centos6.7

RUN touch /var/lib/rpm/*
RUN yum install -y automake bzip2 cmake make git openssl openssl-devel patch tar wget && yum clean all
RUN wget http://people.centos.org/tru/devtools-2/devtools-2.repo -O /etc/yum.repos.d/devtools-2.repo
RUN yum -y install devtoolset-2-gcc devtoolset-2-binutils devtoolset-2-gcc-c++ cmake openssl-devel patch && yum clean all
RUN ln -s /opt/rh/devtoolset-2/root/usr/bin/gcc /usr/bin/cc
RUN ln -s /opt/rh/devtoolset-2/root/usr/bin/g++ /usr/bin/g++
RUN echo "export CC=/opt/rh/devtoolset-2/root/usr/bin/gcc" >> /root/.bashrc
RUN echo "export CPP=/opt/rh/devtoolset-2/root/usr/bin/cpp" >> /root/.bashrc
RUN echo "export CXX=/opt/rh/devtoolset-2/root/usr/bin/c++" >> /root/.bashrc

COPY ./proxysql /opt/proxysql

RUN cd /opt/proxysql && \
  make clean && \
  make -j 8 build_deps && \
  make -j 8 && \
  make install

ENTRYPOINT ["proxysql", "-f"]
