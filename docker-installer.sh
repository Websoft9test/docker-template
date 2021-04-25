#!/bin/bash
export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
clear

set -e
docker_download_url="https://download.docker.com/linux/static/stable/x86_64/docker-20.10.6.tgz"

# Please modify this version and time after update
version(){
    echo "version: 1.2"
    echo "updated date: 20201-04-25"
}
 
tool_list=(
git
pwgen
jq
wget
curl
)

help_str="
Usage:
  -h, --help       Show this help message         
  -r, --repo_name  The name of the warehouse
  -p, --package    Making local packs,Only when you need to pack
  -v, --version    Show version info
example: bash install.sh -r template -p  
"
make_package=false

# get parameter
getopt_cmd=$(getopt -o r:phv --long repo_name:,package,help,version -n "Parameter error" -- "$@")
eval set -- "$getopt_cmd"

while [ -n "$1" ]
do
    case "$1" in
        -r|--repo_name)
            repo_name=$2
            shift ;;
        -h|--help)
            echo -e "$help_str"
            exit ;;
        -p|--package)
            make_package=true
            shift ;;
        -v|--version)
            version
            shift ;;
         --) 
            echo -e "$help_str"
            break
            shift ;;
    esac
    shift
done

[ ! -n "$repo_name" ] && exit 0
echo "docker-$repo_name to be installed,Package as an image: $make_package"

install_tools(){
  if command -v apt > /dev/null;then  
    sudo apt update 1>/dev/null 2>&1
    sudo apt install ${tool_list[*]} -y  1>/dev/null 2>&1
  elif  command -v yum > /dev/null;then 
    sudo yum clean all 1>/dev/null 2>&1
    sudo yum makecache 1>/dev/null 2>&1
    sudo yum install ${tool_list[*]} -y 1>/dev/null 2>&1
  fi
}

download_docker_source(){
    cd /tmp/
    rm -rf docker.tgz
    sudo wget $docker_download_url -O docker.tgz 1>/dev/null 2>&1
    sudo echo -e "docker downloaded successfully"
sudo cat > /tmp/docker.service <<EOF
[Unit]
Description=Docker Application Container Engine
Documentation=https://docs.docker.com
After=network-online.target firewalld.service
Wants=network-online.target

[Service]
Type=notify
# the default is not to use systemd for cgroups because the delegate issues still
# exists and systemd currently does not support the cgroup feature set required
# for containers run by docker
ExecStart=/usr/bin/dockerd
ExecReload=/bin/kill -s HUP $MAINPID
# Having non-zero Limit*s causes performance problems due to accounting overhead
# in the kernel. We recommend using cgroups to do container-local accounting.
LimitNOFILE=infinity
LimitNPROC=infinity
LimitCORE=infinity
# Uncomment TasksMax if your systemd version supports it.
# Only systemd 226 and above support this version.
#TasksMax=infinity
TimeoutStartSec=0
# set delegate yes so that systemd does not reset the cgroups of docker containers
Delegate=yes
# kill only the docker process, not all processes in the cgroup
KillMode=process
# restart the docker process if it exits prematurely
Restart=on-failure
StartLimitBurst=3
StartLimitInterval=60s

[Install]
WantedBy=multi-user.target
EOF
}

install_docker_script(){
    curl -fsSL https://get.docker.com -o get-docker.sh &>/dev/null && sh get-docker.sh &>/dev/null
    systemctl start docker 
    systemctl enable docker  
    sudo echo -e `docker -v`
    sudo echo -e "Docker installed successfully"
}

uninstall_docker(){
    rm -f /etc/systemd/system/docker.service 
    rm -rf /usr/bin/docker*
    sudo systemctl daemon-reload
    sudo echo -e "Docker uninstalled successfully"
}

download_docker_compose(){
   curl -L "https://github.com/docker/compose/releases/download/1.29.0/docker-compose-$(uname -s)-$(uname -m)" -o /tmp/docker-compose 1>/dev/null 2>&1
   sudo chmod +x /tmp/docker-compose 
   sudo echo -e "docker-compose downloaded successfully"   
}

install_docker_compose(){ 
    curl -L "https://github.com/docker/compose/releases/download/1.29.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose 1>/dev/null 2>&1
    sudo chmod +x /usr/local/bin/docker-compose 
    ln -sf /usr/local/bin/docker-compose  /usr/local/bin/docker-compose &>/dev/mull || true
    sudo echo `docker-compose -v`
    sudo echo -e "docker-compose installed successfully"
}

save_images(){
    rm -rf /tmp/docker-$repo_name
    sudo git clone https://github.com/Websoft9/docker-$repo_name.git /tmp/docker-$repo_name
    sudo docker rmi `docker images -aq` -f &>/dev/null || true   
    cd /tmp/docker-$repo_name
    docker-compose -f $compose_file_name pull 
    echo -e "In image packaging, there is a long wait..." 
    docker save $(docker images | grep -v REPOSITORY | awk 'BEGIN{OFS=":";ORS=" "}{print $1,$2}') -o /tmp/$repo_name.tar 
    sudo echo -e "The image was successfully saved as a tar package"
}

installation(){
    rm -rf $install_dir /credentials
    mkdir -p $install_dir /credentials &&  cd $install_dir  
    sudo git clone https://github.com/Websoft9/docker-$repo_name.git $install_dir 
#db random password
    new_password=$(pwgen -ncCs 15 1)
    sudo sed -i "s/123456/$new_password/g" $install_dir/$compose_file_name &>/dev/null || true
    sudo sed -i "s/123456/$new_password/g" $install_dir/.env &>/dev/null || true
    compose_password_lines=`cat $install_dir/$compose_file_name |grep "123456" |wc -l`

if  [ -f $install_dir/.env ];then
    env_password_lines=`cat $install_dir/.env |grep "123456" |wc -l`
else
    env_password_line=0
fi

if  [ $env_password_lines -eq 0 ] && [ $compose_password_lines -eq 0 ]
    sudo echo "db password: 123456" |tee -a /credentials/password.txt
else
    sudo echo "db password: $new_password" |tee -a /credentials/password.txt
fi

    docker-compose -f $compose_file_name up -d 
}

add_install_script(){
    rm -rf /tmp/install.sh
cat > /tmp/install.sh <<-EOF
    tar -xf docker.tgz 
    sudo systemctl stop docker &>/dev/mull || true
    mv docker.service /etc/systemd/system/docker.service
    mv docker/* /usr/bin/  
    sudo systemctl daemon-reload
    sudo systemctl start docker
    sudo systemctl enable docker
    sudo echo -e \"Docker was installed successfully\"
    sudo echo `docker -v`

    mv docker-compose /usr/local/bin/docker-compose
    sudo echo "docker-compose -v"
    sudo echo -e \"docker-compose installed successfully\"

    rm -rf $install_dir /credentials
    mkdir -p $install_dir /credentials 
    docker load -i $repo_name.tar 
    cur_dir=\$(pwd)
    upper_dir=\$(dirname $install_dir)
    rm -rf \$upper_dir/$repo_name
    /bin/cp -rf \$cur_dir/docker-$repo_name \$upper_dir/$repo_name 
    cd $install_dir 
# db random password
    new_password=\$(date | md5sum | awk '{print $1}' |cut -c 3-18)
    sed -i \"s/123456/\$new_password/g\" $install_dir/$compose_file_name &>/dev/null || true
    sed -i \"s/123456/\$new_password/g\" $install_dir/.env &>/dev/null || true

    compose_password_lines=`cat $install_dir/$compose_file_name |grep \"123456\" |wc -l`

if  [ -f $install_dir/.env ];then
    env_password_lines=`cat $install_dir/.env |grep "123456" |wc -l`
else
    env_password_line=0
fi

if  [ \$env_password_lines -eq 0 ] && [ \$compose_password_lines -eq 0 ]
    sudo echo "db password: 123456" |tee -a /credentials/password.txt
else
    sudo echo "db password: \$new_password" |tee -a /credentials/password.txt
fi

    docker-compose -f $compose_file_name up -d 1>/dev/null 2>&1
EOF
    cat /tmp/install.sh |tr -d '\' &>/dev/mull
}

get_install_information(){
   install_dir=`curl -s https://raw.githubusercontent.com/Websoft9/docker-$repo_name/main/variables.json |jq -r .installpath` 1>/dev/null
   compose_file_name=`curl -s https://raw.githubusercontent.com/Websoft9/docker-$repo_name/main/variables.json |jq -r .compose_file` 1>/dev/null
if [ ! $install_dir ] && [ ! $compose_file_name ];then
       echo "variables.json has an undefined parameter"
       exit 1 
fi 
   echo $install_dir $compose_file_name
}

make_package(){
   rm -rf ~/$repo_name.tgz 
   cd /tmp && tar -zcPf ~/$repo_name.tgz ./{install.sh,$repo_name.tar,docker-$repo_name,docker.tgz,docker.service,docker-compose}
   cd ~  && sudo echo -e "Image packaging successfully"
}

install_tools

get_install_information  

if [ $make_package = false ]; then
   install_docker_script
   install_docker_compose
   installation
fi

if [ $make_package = true ]; then
   download_docker_source
   download_docker_compose
   save_images
   add_install_script
   make_package
fi

