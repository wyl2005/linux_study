#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/ioctl.h>
#include <fcntl.h>

#define FIFO_CLEAR (0x01)

int main()
{
	int fd, num;

	fd_set rfds, wfds;

	fd = open("/dev/globalfifo", O_RDONLY | O_NONBLOCK);
	if (fd != -1) {
		//fifo clear to zero
		ioctl(fd, FIFO_CLEAR, 0);
		
		while (1) {
			FD_ZERO(&rfds);	
			FD_ZERO(&wfds);	

			FD_SET(fd, &rfds);
			FD_SET(fd, &wfds);
			
			select(fd+1, &rfds, &wfds, NULL, NULL);

			if (FD_ISSET(fd, &rfds))
				printf("Poll monitor: can be read\n");

			if (FD_ISSET(fd, &wfds))
				printf("Poll monitor: can be writen\n");
		}
	} else {
		printf("Device open failed\n");	
	}


}


