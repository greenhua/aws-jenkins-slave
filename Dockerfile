FROM jenkinsci/slave
USER root
RUN apt update
RUN apt install  -y docker.io curl 
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install
RUN ln -s /usr/local/bin/aws /bin/aws
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN chmod a+x ./kubectl
RUN mv ./kubectl /bin/kubectl
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
RUN  chmod 700 get_helm.sh
RUN ./get_helm.sh