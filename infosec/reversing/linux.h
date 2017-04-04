/*
 * Useful Linux declarations
*/

#define __int8 char
#define __int16 short
#define __int32 int
#define __int64 long long

enum fileio
{
  O_RDWR = 0x2,
  O_CREAT = 0x100,
};

enum iff
{
  IF_UP = 0x1,
  IF_BROADCAST = 0x2,
  IF_DEBUG = 0x4,
  IF_LOOPBACK = 0x8,
  IF_POINTOPOINT = 0x10,
  IF_NOTRAILERS = 0x20,
  IF_RUNNING = 0x40,
  IF_NOARP = 0x80,
  IF_PROMISC = 0x100,
  IF_ALLMULTI = 0x200,
  IF_MASTER = 0x400,
  IF_SLAVE = 0x800,
  IF_MULTICAST = 0x1000,
  IF_PORTSEL = 0x2000,
  IF_AUTOMEDIA = 0x4000,
  IF_DYNAMIC = 0x8000,
  IF_LOWER_UP = 0x10000,
};

/* 3 */
#pragma pack(push, 1)
struct __attribute__((aligned(2))) ifaddrs
{
  struct ifaddrs *ifa_next;
  char *ifa_name;
  iff ifa_flags;
  struct sockaddr *ifa_addr;
  struct sockaddr *ifa_netmask;
  struct sockaddr *ifa_dstaddr;
  void *ifa_data;
};
#pragma pack(pop)

struct sockaddr
{
  unsigned __int16 sa_family;
  char sa_data[14];
};

enum af
{
  AF_INET = 0x2,
  AF_INET6 = 0xA,
  AF_PACKET = 0x11,
};

enum sock_type_mips
{
  SOCK_DGRAM = 0x1,
  SOCK_STREAM = 0x2,
  SOCK_RAW = 0x3,
  SOCK_RDM = 0x4,
  SOCK_SEQPACKET = 0x5,
  SOCK_DCCP = 0x6,
  SOCK_PACKET = 0xA,
};

enum sock_type
{
  SOCK_STREAM = 0x1,
  SOCK_DGRAM = 0x2,
  SOCK_RAW = 0x3,
  SOCK_RDM = 0x4,
  SOCK_SEQPACKET = 0x5,
  SOCK_DCCP = 0x6,
  SOCK_PACKET = 0xA,
};

enum _ioctl
{
  FIONBIO = 0x667E,
  SIOCGIFFLAGS = 0x8913,
  SIOCSIFFLAGS = 0x8914,
  SIOCGIFHWADDR = 0x8927,
  SIOCGIFINDEX = 0x8933,
};

enum sendrecv_flags
{
  MSG_PEEK = 0x2,
  MSG_NOSIGNAL = 0x4000,
};

enum ERRNO
{
  EAGAIN = 0xB,
};

struct rtnl_link_stats
{
  int rx_packets;
  int tx_packets;
  int rx_bytes;
  int tx_bytes;
  int rx_errors;
  int tx_errors;
  int rx_dropped;
  int tx_dropped;
  int multicast;
  int collisions;
  int rx_length_errors;
  int rx_over_errors;
  int rx_crc_errors;
  int rx_frame_errors;
  int rx_fifo_errors;
  int rx_missed_errors;
  int tx_aborted_errors;
  int tx_carrier_errors;
  int tx_fifo_errors;
  int tx_heartbeat_errors;
  int tx_window_errors;
  int rx_compressed;
  int tx_compressed;
};

struct in_addr
{
  unsigned __int32 s_addr;
};

struct sockaddr_in
{
  __int16 sin_family;
  unsigned __int16 sin_port;
  struct in_addr sin_addr;
  char sin_zero[8];
};

enum prctl_option
{
  PR_SET_NAME = 0xF,
};
