/*
 *
 * This is a sploit
 *
 */

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <stdio.h>

#define CSAW_IOCTL_BASE     0x77617363
#define CSAW_ALLOC_HANDLE   CSAW_IOCTL_BASE+1
#define CSAW_READ_HANDLE    CSAW_IOCTL_BASE+2
#define CSAW_WRITE_HANDLE   CSAW_IOCTL_BASE+3
#define CSAW_GET_CONSUMER   CSAW_IOCTL_BASE+4
#define CSAW_SET_CONSUMER   CSAW_IOCTL_BASE+5
#define CSAW_FREE_HANDLE    CSAW_IOCTL_BASE+6
#define CSAW_GET_STATS      CSAW_IOCTL_BASE+7

struct csaw_stats {
	unsigned long clients;
	unsigned long handles;
	unsigned long bytes_read;
	unsigned long bytes_written;
	char version[40];
};

int main (void) {
	struct csaw_stats csaw_stats;
	int fd = open("/dev/csaw", O_RDONLY);
	int ret = ioctl(fd, CSAW_GET_STATS, &csaw_stats);
	if (ret < 0) {
		printf("There was an error: %d\n", ret);
	}
	printf("clients: %ld\nhandles: %ld\nbytes_read: %ld\nbytes_written: %ld\n"
		"Version: %s\n",
		csaw_stats.clients, csaw_stats.handles, csaw_stats.bytes_read,
		csaw_stats.bytes_written, csaw_stats.version);
	return 0;
}
