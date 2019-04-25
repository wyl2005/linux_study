#include <sys/types.h>
#include <sys/socket.h>
#include <asm/types.h>
#include <linux/netlink.h>
#include <linux/rtnetlink.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <sys/ioctl.h>
#include <linux/if.h>
#include <string.h>
#include <errno.h>

#define BUFLEN 20480

int main(int argc, char *argv[])
{
    int fd, retval;
    char buf[BUFLEN] = {0};
    int len = BUFLEN;
    struct sockaddr_nl addr;
    struct nlmsghdr *nh;
    struct ifinfomsg *ifinfo;
    struct rtattr *attr;

    fd = socket(AF_NETLINK, SOCK_RAW, NETLINK_ROUTE);
    setsockopt(fd, SOL_SOCKET, SO_RCVBUF, &len, sizeof(len));
    memset(&addr, 0, sizeof(addr));
    addr.nl_family = AF_NETLINK;
    addr.nl_groups = RTNLGRP_LINK;
    bind(fd, (struct sockaddr*)&addr, sizeof(addr));
//    printf("netlink2 !!!\n");
    while ((retval = read(fd, buf, BUFLEN)) > 0)
    {
        for (nh = (struct nlmsghdr *)buf; NLMSG_OK(nh, retval); nh = NLMSG_NEXT(nh, retval))
        {
            if (nh->nlmsg_type == NLMSG_DONE)
                break;
            else if (nh->nlmsg_type == NLMSG_ERROR)
                return -1;
            else if (nh->nlmsg_type != RTM_NEWLINK)
                continue;
            ifinfo = NLMSG_DATA(nh);
            //printf("%u: %s \n", ifinfo->ifi_index, (ifinfo->ifi_flags & IFF_LOWER_UP) ? "up" : "down");
            attr = (struct rtattr*)(((char*)nh) + NLMSG_SPACE(sizeof(*ifinfo)));
            len = nh->nlmsg_len - NLMSG_SPACE(sizeof(*ifinfo));
            for (; RTA_OK(attr, len); attr = RTA_NEXT(attr, len))
            {
                if (attr->rta_type == IFLA_IFNAME)
                {
                    //printf(" %s", (char*)RTA_DATA(attr));
                    break;
                }
            }
            //printf("\n");

            //printf("(char*)RTA_DATA(attr) : %s \n", (char*)RTA_DATA(attr) );
            //printf("ifinfo->ifi_flags = 0x%x, IFF_LOWER_UP= 0x%x \n", ifinfo->ifi_flags, IFF_LOWER_UP );

            if ((ifinfo->ifi_flags & IFF_LOWER_UP) && (0==strncmp((char*)RTA_DATA(attr), "eth0", 5))) //eth0 up
            {
                //printf("eth0 up\n");
                if (0 != system ("/sbin/udhcpc -q -i eth0 > /dev/null 2>&1"))
                {
                    printf("/sbin/udhcpc -q -i eth0 fail: %s \n", strerror(errno));
                }
            }
            else
            {
                //printf("not eth0 up\n");
            }
            
        }
    }

    return 0;
}
