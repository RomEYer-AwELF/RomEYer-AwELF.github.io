#!/bin/sh

MAINIP=$(ip route get 1 | awk '{print $NF;exit}')
GATEWAYIP=$(ip route | grep default | awk '{print $3}')
SUBNET=$(ip -o -f inet addr show | awk '/scope global/{sub(/[^.]+\//,"0/",$4);print $4}' | head -1 | awk -F '/' '{print $2}')

value=$(( 0xffffffff ^ ((1 << (32 - $SUBNET)) - 1) ))
NETMASK="$(( (value >> 24) & 0xff )).$(( (value >> 16) & 0xff )).$(( (value >> 8) & 0xff )).$(( value & 0xff ))"

wget -N --no-check-certificate http://shell.p1e.cn/reinstall/Network-Reinstall-System-Modify.sh && chmod a+x Network-Reinstall-System-Modify.sh

clear
echo "                                                           "
echo "###########################################################"
echo "#                                                         #"
echo "#  雨落星辰自动dd一键脚本                                 #"
echo "#                                                         #"
echo "#  最后更新: 2020-02-20   www.815494.com                  #"
echo "#  交流QQ群: 7766900                                      #"
echo "#  所有系统无特殊说明默认密码：cxthhhhh.com               #"
echo "#                                                         #"
echo "#                                                         #"
echo "###########################################################"
echo "                                                           "
echo "IP: $MAINIP"
echo "网关: $GATEWAYIP"
echo "网络掩码: $NETMASK"
echo "                                                            "                                     
echo "请选择您需要的镜像包:"
echo "  1) 一键网络重装纯净CentOS 6"
echo "  2) 一键网络重装纯净CentOS 7（推荐）"
echo "  3) 一键网络重装纯净CentOS 8"
echo "  4) 一键网络重装纯净Debian 7"
echo "  5) 一键网络重装纯净Debian 8"
echo "  6) 一键网络重装纯净Debian 9（推荐）"
echo "  7) 一键网络重装纯净Ubuntu 14.04"
echo "  8) 一键网络重装纯净Ubuntu 16.04"
echo "  9) 一键网络重装纯净Ubuntu 18.04（推荐）"
echo "  10) 一键网络重装纯净Windows Server 2003"
echo "  11) WindowsServer2003x86-精简-仅291MB-系统占用内存小(Password:WinSrv2003x86-Chinese)"
echo "  12) 一键网络重装纯净Windows 7"
echo "  13) Win7企业版-x64 支持甲骨文(Password:www.nat.ee)"
echo "  14) 一键网络重装纯净Windows10(Password:www.nat.ee)"
echo "  15) 一键网络重装纯净Windows Server 2008 R2"
echo "  16) 一键网络重装纯净Windows Server 2012 R2"
echo "  17) WinSrv2012r2x64-数据中心版-精简(Password:WinSrv2012r2x64-Chinese)"
echo "  18)一键网络重装纯净Windows Server 2016"
echo "  19)一键网络重装纯净Windows Server 2019（推荐）"
echo "  自定义安装请使用：bash Network-Reinstall-System-Modify.sh -DD "%URL%" "
echo ""
echo -n "请输入编号: "
read N
case $N in
  1) bash Network-Reinstall-System-Modify.sh -CentOS_6 ;;
  2) bash Network-Reinstall-System-Modify.sh -CentOS_7 ;;
  3) bash Network-Reinstall-System-Modify.sh -CentOS_8 ;;
  4) bash Network-Reinstall-System-Modify.sh -Debian_7 ;;
  5) bash Network-Reinstall-System-Modify.sh -Debian_8 ;;
  6) bash Network-Reinstall-System-Modify.sh -Debian_9 ;;
  7) bash Network-Reinstall-System-Modify.sh -Ubuntu_14.04 ;;
  8) bash Network-Reinstall-System-Modify.sh -Ubuntu_16.04;;
  9) bash Network-Reinstall-System-Modify.sh -Ubuntu_18.04;;
  10) bash Network-Reinstall-System-Modify.sh -Windows_Server_2003 ;;
  11) bash Network-Reinstall-System-Modify.sh -LSJ2003 ;;
  12) bash Network-Reinstall-System-Modify.sh -Windows_7_Vienna ;;
  13) bash Network-Reinstall-System-Modify.sh -Win7-Ent ;;
  14) bash Network-Reinstall-System-Modify.sh -Windows_10 ;;
  15) bash Network-Reinstall-System-Modify.sh -Windows_Server_2008R2 ;;
  16) bash Network-Reinstall-System-Modify.sh -Windows_Server_2012R2 ;;
  17) bash Network-Reinstall-System-Modify.sh -Windows_Server_2012R2_LSJ ;;
  18) bash Network-Reinstall-System-Modify.sh -Windows_Server_2016;;
  19) bash Network-Reinstall-System-Modify.sh -Windows_Server_2019;;
  *) echo "Wrong input!" ;;
esac