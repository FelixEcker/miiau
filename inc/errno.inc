; errno.inc -- Helpers for errno codes                                        ;
;-----------------------------------------------------------------------------;
; Copyright (c) 2024, Marie Eckert                                            ;
; Licensed under the ISC License                                              ;
;-----------------------------------------------------------------------------;

irpv any, errno_inc { rept 0 {} rept 1 { errno_inc equ

include "inc/strlen.inc"

; errno messages

segment readable
EPERM: db "Operation not permitted", 0
ENOENT: db "No such file or directory", 0
ESRCH: db "No such process", 0
EINTR: db "Interrupted system call", 0
EIO: db "I/O error", 0
ENXIO: db "No such device or address", 0
E2BIG: db "Argument list too long", 0
ENOEXEC: db "Exec format error", 0
EBADF: db "Bad file number", 0
ECHILD: db "No child processes", 0
EAGAIN: db "Try again", 0
ENOMEM: db "Out of memory", 0
EACCES: db "Permission denied", 0
EFAULT: db "Bad address", 0
ENOTBLK: db "Block device required", 0
EBUSY: db "Device or resource busy", 0
EEXIST: db "File exists", 0
EXDEV: db "Cross-device link", 0
ENODEV: db "No such device", 0
ENOTDIR: db "Not a directory", 0
EISDIR: db "Is a directory", 0
EINVAL: db "Invalid argument", 0
ENFILE: db "File table overflow", 0
EMFILE: db "Too many open files", 0
ENOTTY: db "Not a typewriter", 0
ETXTBSY: db "Text file busy", 0
EFBIG: db "File too large", 0
ENOSPC: db "No space left on device", 0
ESPIPE: db "Illegal seek", 0
EROFS: db "Read-only file system", 0
EMLINK: db "Too many links", 0
EPIPE: db "Broken pipe", 0
EDOM: db "Math argument out of domain of func", 0
ERANGE: db "Math result not representable", 0
EDEADLK: db "Resource deadlock would occur", 0
ENAMETOOLONG: db "File name too long", 0
ENOLCK: db "No record locks available", 0
ENOSYS: db "Function not implemented", 0
ENOTEMPTY: db "Directory not empty", 0
ELOOP: db "Too many symbolic links encountered", 0
EWOULDBLOCK: db "Operation would block", 0
ENOMSG: db "No message of desired type", 0
EIDRM: db "Identifier removed", 0
ECHRNG: db "Channel number out of range", 0
EL2NSYNC: db "Level 2 not synchronized", 0
EL3HLT: db "Level 3 halted", 0
EL3RST: db "Level 3 reset", 0
ELNRNG: db "Link number out of range", 0
EUNATCH: db "Protocol driver not attached", 0
ENOCSI: db "No CSI structure available", 0
EL2HLT: db "Level 2 halted", 0
EBADE: db "Invalid exchange", 0
EBADR: db "Invalid request descriptor", 0
EXFULL: db "Exchange full", 0
ENOANO: db "No anode", 0
EBADRQC: db "Invalid request code", 0
EBADSLT: db "Invalid slot", 0
EBFONT: db "Bad font file format", 0
ENOSTR: db "Device not a stream", 0
ENODATA: db "No data available", 0
ETIME: db "Timer expired", 0
ENOSR: db "Out of streams resources", 0
ENONET: db "Machine is not on the network", 0
ENOPKG: db "Package not installed", 0
EREMOTE: db "Object is remote", 0
ENOLINK: db "Link has been severed", 0
EADV: db "Advertise error", 0
ESRMNT: db "Srmount error", 0
ECOMM: db "Communication error on send", 0
EPROTO: db "Protocol error", 0
EMULTIHOP: db "Multihop attempted", 0
EDOTDOT: db "RFS specific error", 0
EBADMSG: db "Not a data message", 0
EOVERFLOW: db "Value too large for defined data type", 0
ENOTUNIQ: db "Name not unique on network", 0
EBADFD: db "File descriptor in bad state", 0
EREMCHG: db "Remote address changed", 0
ELIBACC: db "Can not access a needed shared library", 0
ELIBBAD: db "Accessing a corrupted shared library", 0
ELIBSCN: db ".lib section in a.out corrupted", 0
ELIBMAX: db "Attempting to link in too many shared libraries", 0
ELIBEXEC: db "Cannot exec a shared library directly", 0
EILSEQ: db "Illegal byte sequence", 0
ERESTART: db "Interrupted system call should be restarted", 0
ESTRPIPE: db "Streams pipe error", 0
EUSERS: db "Too many users", 0
ENOTSOCK: db "Socket operation on non-socket", 0
EDESTADDRREQ: db "Destination address required", 0
EMSGSIZE: db "Message too long", 0
EPROTOTYPE: db "Protocol wrong type for socket", 0
ENOPROTOOPT: db "Protocol not available", 0
EPROTONOSUPPORT: db "Protocol not supported", 0
ESOCKTNOSUPPORT: db "Socket type not supported", 0
EOPNOTSUPP: db "Operation not supported on transport endpoint", 0
EPFNOSUPPORT: db "Protocol family not supported", 0
EAFNOSUPPORT: db "Address family not supported by protocol", 0
EADDRINUSE: db "Address already in use", 0
EADDRNOTAVAIL: db "Cannot assign requested address", 0
ENETDOWN: db "Network is down", 0
ENETUNREACH: db "Network is unreachable", 0
ENETRESET: db "Network dropped connection because of reset", 0
ECONNABORTED: db "Software caused connection abort", 0
ECONNRESET: db "Connection reset by peer", 0
ENOBUFS: db "No buffer space available", 0
EISCONN: db "Transport endpoint is already connected", 0
ENOTCONN: db "Transport endpoint is not connected", 0
ESHUTDOWN: db "Cannot send after transport endpoint shutdown", 0
ETOOMANYREFS: db "Too many references: cannot splice", 0
ETIMEDOUT: db "Connection timed out", 0
ECONNREFUSED: db "Connection refused", 0
EHOSTDOWN: db "Host is down", 0
EHOSTUNREACH: db "No route to host", 0
EALREADY: db "Operation already in progress", 0
EINPROGRESS: db "Operation now in progress", 0
ESTALE: db "Stale NFS file handle", 0
EUCLEAN: db "Structure needs cleaning", 0
ENOTNAM: db "Not a XENIX named type file", 0
ENAVAIL: db "No XENIX semaphores available", 0
EISNAM: db "Is a named type file", 0
EREMOTEIO: db "Remote I/O error", 0
EDQUOT: db "Quota exceeded", 0
ENOMEDIUM: db "No medium found", 0
EMEDIUMTYPE: db "Wrong medium type", 0
ECANCELED: db "Operation Canceled", 0
ENOKEY: db "Required key not available", 0
EKEYEXPIRED: db "Key has expired", 0
EKEYREVOKED: db "Key has been revoked", 0
EKEYREJECTED: db "Key was rejected by service", 0
EOWNERDEAD: db "Owner died", 0
ENOTRECOVERABLE: db "State not recoverable", 0

; errno to message lookup table
msg_ptrs:
                dq EPERM          , ENOENT         , ESRCH        , EINTR
                dq EIO            , ENXIO          , E2BIG        , ENOEXEC
                dq EBADF          , ECHILD         , EAGAIN       , ENOMEM
                dq EACCES         , EFAULT         , ENOTBLK      , EBUSY
                dq EEXIST         , EXDEV          , ENODEV       , ENOTDIR
                dq EISDIR         , EINVAL         , ENFILE       , EMFILE
                dq ENOTTY         , ETXTBSY        , EFBIG        , ENOSPC
                dq ESPIPE         , EROFS          , EMLINK       , EPIPE
                dq EDOM           , ERANGE         , EDEADLK      , ENAMETOOLONG
                dq ENOSYS         , ENOTEMPTY      , ELOOP        , EWOULDBLOCK
                dq ENOMSG         , EIDRM          , ECHRNG       , EL2NSYNC
                dq EL3HLT         , EL3RST         , ELNRNG       , EUNATCH
                dq ENOCSI         , EL2HLT         , EBADE        , EBADR
                dq EXFULL         , ENOANO         , EBADRQC      , EBADSLT
                dq EDEADLK        , EBFONT         , ENOSTR       , ENODATA
                dq ETIME          , ENOSR          , ENONET       , ENOPKG
                dq EREMOTE        , ENOLINK        , EADV         , ESRMNT
                dq ECOMM          , EPROTO         , EMULTIHOP    , EDOTDOT
                dq EBADMSG        , EOVERFLOW      , ENOTUNIQ     , EBADFD
                dq EREMCHG        , ELIBACC        , ELIBBAD      , ELIBSCN
                dq ELIBMAX        , ELIBEXEC       , EILSEQ       , ERESTART
                dq ESTRPIPE       , EUSERS         , ENOTSOCK     , EDESTADDRREQ
                dq EMSGSIZE       , EPROTOTYPE     , ENOPROTOOPT
                dq EPROTONOSUPPORT, ESOCKTNOSUPPORT, EOPNOTSUPP   , EPFNOSUPPORT
                dq EAFNOSUPPORT   , EADDRINUSE     , EADDRNOTAVAIL, ENETDOWN
                dq ENETUNREACH    , ENETRESET      , ECONNABORTED , ECONNRESET
                dq ENOBUFS        , EISCONN        , ENOTCONN     , ESHUTDOWN
                dq ETOOMANYREFS   , ETIMEDOUT      , ECONNREFUSED , EHOSTDOWN
                dq EHOSTUNREACH   , EALREADY       , EINPROGRESS  , ESTALE
                dq EUCLEAN        , ENOTNAM        , ENAVAIL      , EISNAM
                dq EREMOTEIO      , EDQUOT         , ENOMEDIUM    , EMEDIUMTYPE
                dq ECANCELED      , ENOKEY         , EKEYEXPIRED  , EKEYREVOKED
                dq EKEYREJECTED   , EOWNERDEAD     , ENOTRECOVERABLE

segment readable executable
; Prints the errno in RAX to STDERR
errno_print:    push rax                    ; Save old register states
                push rdi
                push rsi
                push rdx

                dec rax                        ; Decrement rax to use for lookup
                mov rdi, [msg_ptrs + rax * 8]  ; Look errno up in table
                call strlen                    ; Get string length of message

                mov rsi, rdi                ; Set message as source for write
                mov rdx, rax                ; Set buffer length
                mov rdi, FD_STDERR 
                mov rax, SYSCALL_WRITE
                syscall

                push 0x0a                   ; Get linefeed onto stack
                mov rsi, rsp                ; Set stack pointer as write buffer
                mov rdx, 1                  ; Write one byte from stack
                mov rax, SYSCALL_WRITE
                syscall

                add rsp, 8                  ; discard linefeed from stack

                pop rdx                     ; Restore old Register state
                pop rsi
                pop rdi
                pop rax

                ret

} ; END INCLUDE GUARD
