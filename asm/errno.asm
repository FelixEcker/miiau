section .data
EPERM: db "EPERM, Operation not permitted", 0
ENOENT: db "ENOENT, No such file or directory", 0
ESRCH: db "ESRCH, No such process", 0
EINTR: db "EINTR, Interrupted system call", 0
EIO: db "EIO, I/O error", 0
ENXIO: db "ENXIO, No such device or address", 0
E2BIG: db "E2BIG, Argument list too long", 0
ENOEXEC: db "ENOEXEC, Exec format error", 0
EBADF: db "EBADF, Bad file number", 0
ECHILD: db "ECHILD, No child processes", 0
EAGAIN: db "EAGAIN, Try again", 0
ENOMEM: db "ENOMEM, Out of memory", 0
EACCES: db "EACCES, Permission denied", 0
EFAULT: db "EFAULT, Bad address", 0
ENOTBLK: db "ENOTBLK, Block device required", 0
EBUSY: db "EBUSY, Device or resource busy", 0
EEXIST: db "EEXIST, File exists", 0
EXDEV: db "EXDEV, Cross-device link", 0
ENODEV: db "ENODEV, No such device", 0
ENOTDIR: db "ENOTDIR, Not a directory", 0
EISDIR: db "EISDIR, Is a directory", 0
EINVAL: db "EINVAL, Invalid argument", 0
ENFILE: db "ENFILE, File table overflow", 0
EMFILE: db "EMFILE, Too many open files", 0
ENOTTY: db "ENOTTY, Not a typewriter", 0
ETXTBSY: db "ETXTBSY, Text file busy", 0
EFBIG: db "EFBIG, File too large", 0
ENOSPC: db "ENOSPC, No space left on device", 0
ESPIPE: db "ESPIPE, Illegal seek", 0
EROFS: db "EROFS, Read-only file system", 0
EMLINK: db "EMLINK, Too many links", 0
EPIPE: db "EPIPE, Broken pipe", 0
EDOM: db "EDOM, Math argument out of domain of func", 0
ERANGE: db "ERANGE, Math result not representable", 0
EDEADLK: db "EDEADLK, Resource deadlock would occur", 0
ENAMETOOLONG: db "ENAMETOOLONG, File name too long", 0
ENOLCK: db "ENOLCK, No record locks available", 0
ENOSYS: db "ENOSYS, Function not implemented", 0
ENOTEMPTY: db "ENOTEMPTY, Directory not empty", 0
ELOOP: db "ELOOP, Too many symbolic links encountered", 0
EWOULDBLOCK: db "EWOULDBLOCK, Operation would block", 0
ENOMSG: db "ENOMSG, No message of desired type", 0
EIDRM: db "EIDRM, Identifier removed", 0
ECHRNG: db "ECHRNG, Channel number out of range", 0
EL2NSYNC: db "EL2NSYNC, Level 2 not synchronized", 0
EL3HLT: db "EL3HLT, Level 3 halted", 0
EL3RST: db "EL3RST, Level 3 reset", 0
ELNRNG: db "ELNRNG, Link number out of range", 0
EUNATCH: db "EUNATCH, Protocol driver not attached", 0
ENOCSI: db "ENOCSI, No CSI structure available", 0
EL2HLT: db "EL2HLT, Level 2 halted", 0
EBADE: db "EBADE, Invalid exchange", 0
EBADR: db "EBADR, Invalid request descriptor", 0
EXFULL: db "EXFULL, Exchange full", 0
ENOANO: db "ENOANO, No anode", 0
EBADRQC: db "EBADRQC, Invalid request code", 0
EBADSLT: db "EBADSLT, Invalid slot", 0
EBFONT: db "EBFONT, Bad font file format", 0
ENOSTR: db "ENOSTR, Device not a stream", 0
ENODATA: db "ENODATA, No data available", 0
ETIME: db "ETIME, Timer expired", 0
ENOSR: db "ENOSR, Out of streams resources", 0
ENONET: db "ENONET, Machine is not on the network", 0
ENOPKG: db "ENOPKG, Package not installed", 0
EREMOTE: db "EREMOTE, Object is remote", 0
ENOLINK: db "ENOLINK, Link has been severed", 0
EADV: db "EADV, Advertise error", 0
ESRMNT: db "ESRMNT, Srmount error", 0
ECOMM: db "ECOMM, Communication error on send", 0
EPROTO: db "EPROTO, Protocol error", 0
EMULTIHOP: db "EMULTIHOP, Multihop attempted", 0
EDOTDOT: db "EDOTDOT, RFS specific error", 0
EBADMSG: db "EBADMSG, Not a data message", 0
EOVERFLOW: db "EOVERFLOW, Value too large for defined data type", 0
ENOTUNIQ: db "ENOTUNIQ, Name not unique on network", 0
EBADFD: db "EBADFD, File descriptor in bad state", 0
EREMCHG: db "EREMCHG, Remote address changed", 0
ELIBACC: db "ELIBACC, Can not access a needed shared library", 0
ELIBBAD: db "ELIBBAD, Accessing a corrupted shared library", 0
ELIBSCN: db "ELIBSCN, .lib section in a.out corrupted", 0
ELIBMAX: db "ELIBMAX, Attempting to link in too many shared libraries", 0
ELIBEXEC: db "ELIBEXEC, Cannot exec a shared library directly", 0
EILSEQ: db "EILSEQ, Illegal byte sequence", 0
ERESTART: db "ERESTART, Interrupted system call should be restarted", 0
ESTRPIPE: db "ESTRPIPE, Streams pipe error", 0
EUSERS: db "EUSERS, Too many users", 0
ENOTSOCK: db "ENOTSOCK, Socket operation on non-socket", 0
EDESTADDRREQ: db "EDESTADDRREQ, Destination address required", 0
EMSGSIZE: db "EMSGSIZE, Message too long", 0
EPROTOTYPE: db "EPROTOTYPE, Protocol wrong type for socket", 0
ENOPROTOOPT: db "ENOPROTOOPT, Protocol not available", 0
EPROTONOSUPPORT: db "EPROTONOSUPPORT, Protocol not supported", 0
ESOCKTNOSUPPORT: db "ESOCKTNOSUPPORT, Socket type not supported", 0
EOPNOTSUPP: db "EOPNOTSUPP, Operation not supported on transport endpoint", 0
EPFNOSUPPORT: db "EPFNOSUPPORT, Protocol family not supported", 0
EAFNOSUPPORT: db "EAFNOSUPPORT, Address family not supported by protocol", 0
EADDRINUSE: db "EADDRINUSE, Address already in use", 0
EADDRNOTAVAIL: db "EADDRNOTAVAIL, Cannot assign requested address", 0
ENETDOWN: db "ENETDOWN, Network is down", 0
ENETUNREACH: db "ENETUNREACH, Network is unreachable", 0
ENETRESET: db "ENETRESET, Network dropped connection because of reset", 0
ECONNABORTED: db "ECONNABORTED, Software caused connection abort", 0
ECONNRESET: db "ECONNRESET, Connection reset by peer", 0
ENOBUFS: db "ENOBUFS, No buffer space available", 0
EISCONN: db "EISCONN, Transport endpoint is already connected", 0
ENOTCONN: db "ENOTCONN, Transport endpoint is not connected", 0
ESHUTDOWN: db "ESHUTDOWN, Cannot send after transport endpoint shutdown", 0
ETOOMANYREFS: db "ETOOMANYREFS, Too many references: cannot splice", 0
ETIMEDOUT: db "ETIMEDOUT, Connection timed out", 0
ECONNREFUSED: db "ECONNREFUSED, Connection refused", 0
EHOSTDOWN: db "EHOSTDOWN, Host is down", 0
EHOSTUNREACH: db "EHOSTUNREACH, No route to host", 0
EALREADY: db "EALREADY, Operation already in progress", 0
EINPROGRESS: db "EINPROGRESS, Operation now in progress", 0
ESTALE: db "ESTALE, Stale NFS file handle", 0
EUCLEAN: db "EUCLEAN, Structure needs cleaning", 0
ENOTNAM: db "ENOTNAM, Not a XENIX named type file", 0
ENAVAIL: db "ENAVAIL, No XENIX semaphores available", 0
EISNAM: db "EISNAM, Is a named type file", 0
EREMOTEIO: db "EREMOTEIO, Remote I/O error", 0
EDQUOT: db "EDQUOT, Quota exceeded", 0
ENOMEDIUM: db "ENOMEDIUM, No medium found", 0
EMEDIUMTYPE: db "EMEDIUMTYPE, Wrong medium type", 0
ECANCELED: db "ECANCELED, Operation Canceled", 0
ENOKEY: db "ENOKEY, Required key not available", 0
EKEYEXPIRED: db "EKEYEXPIRED, Key has expired", 0
EKEYREVOKED: db "EKEYREVOKED, Key has been revoked", 0
EKEYREJECTED: db "EKEYREJECTED, Key was rejected by service", 0
EOWNERDEAD: db "EOWNERDEAD, Owner died", 0
ENOTRECOVERABLE: db "ENOTRECOVERABLE, State not recoverable", 0

PNTRS:
                dq    EPERM, ENOENT, ESRCH, EINTR, EIO, ENXIO, E2BIG, ENOEXEC, EBADF, ECHILD, EAGAIN
		dq    ENOMEM, EACCES, EFAULT, ENOTBLK, EBUSY, EEXIST, EXDEV, ENODEV, ENOTDIR, EISDIR
		dq    EINVAL,ENFILE, EMFILE, ENOTTY, ETXTBSY, EFBIG, ENOSPC, ESPIPE, EROFS, EMLINK
		dq    EPIPE, EDOM, ERANGE, EDEADLK, ENAMETOOLONG, ENOSYS, ENOTEMPTY, ELOOP, EWOULDBLOCK
		dq    ENOMSG, EIDRM, ECHRNG, EL2NSYNC, EL3HLT, EL3RST, ELNRNG, EUNATCH, ENOCSI, EL2HLT
		dq    EBADE, EBADR, EXFULL, ENOANO, EBADRQC, EBADSLT, EDEADLK, EBFONT, ENOSTR, ENODATA
		dq    ETIME, ENOSR, ENONET, ENOPKG, EREMOTE, ENOLINK, EADV, ESRMNT, ECOMM , EPROTO
		dq    EMULTIHOP, EDOTDOT, EBADMSG, EOVERFLOW, ENOTUNIQ, EBADFD, EREMCHG, ELIBACC, ELIBBAD
		dq    ELIBSCN, ELIBMAX, ELIBEXEC, EILSEQ, ERESTART, ESTRPIPE, EUSERS, ENOTSOCK
		dq    EDESTADDRREQ, EMSGSIZE, EPROTOTYPE, ENOPROTOOPT, EPROTONOSUPPORT, ESOCKTNOSUPPORT
		dq    EOPNOTSUPP, EPFNOSUPPORT, EAFNOSUPPORT, EADDRINUSE, EADDRNOTAVAIL, ENETDOWN
		dq    ENETUNREACH, ENETRESET, ECONNABORTED, ECONNRESET, ENOBUFS, EISCONN, ENOTCONN
		dq    ESHUTDOWN, ETOOMANYREFS, ETIMEDOUT, ECONNREFUSED, EHOSTDOWN, EHOSTUNREACH, EALREADY
		dq    EINPROGRESS, ESTALE, EUCLEAN, ENOTNAM, ENAVAIL, EISNAM, EREMOTEIO, EDQUOT
		dq    ENOMEDIUM, EMEDIUMTYPE, ECANCELED, ENOKEY, EKEYEXPIRED, EKEYREVOKED, EKEYREJECTED
		dq    EOWNERDEAD, ENOTRECOVERABLE

section .text
strlen:         xor rax, rax
_strlen_loop:   cmp [rdi + rax], byte 0
                jz _strlen_exit
                inc rax
                jmp _strlen_loop
_strlen_exit:   ret

errno_print:    dec rax
                mov rdi, [PNTRS + rax * 8]
                call strlen
                mov rsi, rdi
                mov rdx, rax
                
                mov rdi, FD_STDERR
                mov rax, SYSCALL_WRITE
                syscall

                push 0x0a
                mov rsi, rsp
                mov rdx, 1
                mov rax, SYSCALL_WRITE
                syscall

                pop rax

                ret
