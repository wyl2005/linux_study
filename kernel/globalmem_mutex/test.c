#include <stdio.h>
#include <error.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/types.h>

#include <sys/ioctl.h>

int main()
{
	int ret = 0;
	char buf[0x1000];

	int fd = open("/dev/globalmem", O_RDONLY);

	ret = read(fd, buf, 0x100);

	printf("read ret=%d, %s\n", ret, buf);


	ret = ioctl(fd, 0x01);
	printf("ioctl ret=%d\n", ret);
	perror("ioctl");

	return 0;
}

