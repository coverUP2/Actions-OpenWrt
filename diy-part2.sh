#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate
sed -i 's/255.255.255.255/255.255.0.0/g' package/base-files/files/bin/config_generate
sed -i 's/192.168/10.0/g' package/base-files/files/bin/config_generate
sed -i 's/ucidef_set_interface_lan 'eth0'/ucidef_set_interface_lan 'eth0 eth1 ehh2 eth3 eth4'/g' package/base-files/files/etc/board.d/99-default_network
sed -i 's/[ -d /sys/class/net/eth1 ] && ucidef_set_interface_wan 'eth1'/[ -d /sys/class/net/eth5 ] && ucidef_set_interface_wan 'eth5'/g' package/base-files/files/etc/board.d/99-default_network
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' openwrt/package/lean/default-settings/files/zzz-default-settings
sed -i 's/192.168.100.10/24/192.168.100.10/16/g' package/feeds/luci/luci-app-ipsec-server/root/etc/config/luci-app-ipsec-server
sed -i 's/255.255.255.255/255.255.0.0/g' package/feeds/luci/luci-app-ipsec-server/root/etc/init.d/luci-app-ipsec-server
sed -i 's/option bbr_cca '0'/option bbr_cca '1'/g' package/feeds/luci/luci-app-turboacc/root/etc/config/turboacc
sed -i 's/option dns_caching '0'/option dns_caching '1'/g' package/feeds/luci/luci-app-turboacc/root/etc/config/turboacc
