//! Generated via zig translate-c ${erlang}/usr/include/erl_driver.h

pub const ErlDrvSysInfo = extern struct {
    driver_major_version: c_int,
    driver_minor_version: c_int,
    erts_version: [*c]u8,
    otp_release: [*c]u8,
    thread_support: c_int,
    smp_support: c_int,
    async_threads: c_int,
    scheduler_threads: c_int,
    nif_major_version: c_int,
    nif_minor_version: c_int,
    dirty_scheduler_support: c_int,
};
pub const ErlDrvThreadOpts = extern struct {
    suggested_stack_size: c_int,
};
pub const ERL_DIRTY_JOB_CPU_BOUND: c_int = 1;
pub const ERL_DIRTY_JOB_IO_BOUND: c_int = 2;
pub const ErlDirtyJobFlags = c_uint;
pub const ERL_NIF_SELECT_READ: c_int = 1;
pub const ERL_NIF_SELECT_WRITE: c_int = 2;
pub const ERL_NIF_SELECT_STOP: c_int = 4;
pub const ERL_NIF_SELECT_CANCEL: c_int = 8;
pub const ERL_NIF_SELECT_CUSTOM_MSG: c_int = 16;
pub const ERL_NIF_SELECT_ERROR: c_int = 32;
pub const enum_ErlNifSelectFlags = c_uint;
pub const ErlDrvMonitor = extern struct {
    data: [32]u8,
};
pub const ErlNapiUInt64 = c_ulong;
pub const ErlNapiSInt64 = c_long;
pub const ErlNapiUInt = ErlNapiUInt64;
pub const ErlNapiSInt = ErlNapiSInt64;
pub const SysIOVec = extern struct {
    iov_base: [*c]u8,
    iov_len: usize,
};
pub const ErlDrvUInt64 = ErlNapiUInt64;
pub const ErlDrvSInt64 = ErlNapiSInt64;
pub const ErlDrvUInt = ErlNapiUInt;
pub const ErlDrvSInt = ErlNapiSInt;
pub const ErlDrvTermData = ErlNapiUInt;
pub const ErlDrvSizeT = usize;
pub const ErlDrvSSizeT = isize;
pub const struct_erl_drv_binary = extern struct {
    orig_size: ErlDrvSInt,
    orig_bytes: [1]u8,
};
pub const ErlDrvBinary = struct_erl_drv_binary;
pub const struct__erl_drv_data = opaque {};
pub const ErlDrvData = ?*struct__erl_drv_data;
pub const struct__erl_drv_event = opaque {};
pub const ErlDrvEvent = ?*struct__erl_drv_event;
pub const struct__erl_drv_port = opaque {};
pub const ErlDrvPort = ?*struct__erl_drv_port;
pub const ErlDrvThreadData = ?*struct__erl_drv_port;
pub const ErlDrvNowData = extern struct {
    megasecs: c_ulong,
    secs: c_ulong,
    microsecs: c_ulong,
};
pub const ErlDrvTime = ErlDrvSInt64;
pub const ERL_DRV_SEC: c_int = 0;
pub const ERL_DRV_MSEC: c_int = 1;
pub const ERL_DRV_USEC: c_int = 2;
pub const ERL_DRV_NSEC: c_int = 3;
pub const ErlDrvTimeUnit = c_uint;
pub const struct_erl_io_vec = extern struct {
    vsize: c_int,
    size: ErlDrvSizeT,
    iov: [*c]SysIOVec,
    binv: [*c][*c]ErlDrvBinary,
};
pub const ErlIOVec = struct_erl_io_vec;
pub const struct_ErlDrvTid_ = opaque {};
pub const ErlDrvTid = ?*struct_ErlDrvTid_;
pub const struct_ErlDrvMutex_ = opaque {};
pub const ErlDrvMutex = struct_ErlDrvMutex_;
pub const struct_ErlDrvCond_ = opaque {};
pub const ErlDrvCond = struct_ErlDrvCond_;
pub const struct_ErlDrvRWLock_ = opaque {};
pub const ErlDrvRWLock = struct_ErlDrvRWLock_;
pub const ErlDrvTSDKey = c_int;
pub const struct_erl_drv_port_data_lock = opaque {};
pub const ErlDrvPDL = ?*struct_erl_drv_port_data_lock;
pub const struct_erl_drv_entry = extern struct {
    init: ?*const fn () callconv(.C) c_int,
    start: ?*const fn (ErlDrvPort, [*c]u8) callconv(.C) ErlDrvData,
    stop: ?*const fn (ErlDrvData) callconv(.C) void,
    output: ?*const fn (ErlDrvData, [*c]u8, ErlDrvSizeT) callconv(.C) void,
    ready_input: ?*const fn (ErlDrvData, ErlDrvEvent) callconv(.C) void,
    ready_output: ?*const fn (ErlDrvData, ErlDrvEvent) callconv(.C) void,
    driver_name: [*:0]const u8, // was: driver_name: [*c]u8 - however, it should be known at comptime
    finish: ?*const fn () callconv(.C) void,
    handle: ?*anyopaque,
    control: ?*const fn (ErlDrvData, c_uint, [*c]u8, ErlDrvSizeT, [*c][*c]u8, ErlDrvSizeT) callconv(.C) ErlDrvSSizeT,
    timeout: ?*const fn (ErlDrvData) callconv(.C) void,
    outputv: ?*const fn (ErlDrvData, [*c]ErlIOVec) callconv(.C) void,
    ready_async: ?*const fn (ErlDrvData, ErlDrvThreadData) callconv(.C) void,
    flush: ?*const fn (ErlDrvData) callconv(.C) void,
    call: ?*const fn (ErlDrvData, c_uint, [*c]u8, ErlDrvSizeT, [*c][*c]u8, ErlDrvSizeT, [*c]c_uint) callconv(.C) ErlDrvSSizeT,
    unused_event_callback: ?*const fn () callconv(.C) void,
    extended_marker: c_uint, // was: c_int - however, the value ERL_DRV_EXTENDED_MARKER overflows
    major_version: c_int,
    minor_version: c_int,
    driver_flags: c_int,
    handle2: ?*anyopaque,
    process_exit: ?*const fn (ErlDrvData, [*c]ErlDrvMonitor) callconv(.C) void,
    stop_select: ?*const fn (ErlDrvEvent, ?*anyopaque) callconv(.C) void,
    emergency_close: ?*const fn (ErlDrvData) callconv(.C) void,
};
pub const ErlDrvEntry = struct_erl_drv_entry;
pub extern fn erl_drv_busy_msgq_limits(port: ErlDrvPort, low: [*c]ErlDrvSizeT, high: [*c]ErlDrvSizeT) void;
pub extern fn driver_select(port: ErlDrvPort, event: ErlDrvEvent, mode: c_int, on: c_int) c_int;
pub extern fn driver_output(port: ErlDrvPort, buf: [*c]u8, len: ErlDrvSizeT) c_int;
pub extern fn driver_output2(port: ErlDrvPort, hbuf: [*c]u8, hlen: ErlDrvSizeT, buf: [*c]u8, len: ErlDrvSizeT) c_int;
pub extern fn driver_output_binary(port: ErlDrvPort, hbuf: [*c]u8, hlen: ErlDrvSizeT, bin: [*c]ErlDrvBinary, offset: ErlDrvSizeT, len: ErlDrvSizeT) c_int;
pub extern fn driver_outputv(port: ErlDrvPort, hbuf: [*c]u8, hlen: ErlDrvSizeT, ev: [*c]ErlIOVec, skip: ErlDrvSizeT) c_int;
pub extern fn driver_vec_to_buf(ev: [*c]ErlIOVec, buf: [*c]u8, len: ErlDrvSizeT) ErlDrvSizeT;
pub extern fn driver_set_timer(port: ErlDrvPort, time: c_ulong) c_int;
pub extern fn driver_cancel_timer(port: ErlDrvPort) c_int;
pub extern fn driver_read_timer(port: ErlDrvPort, time_left: [*c]c_ulong) c_int;
pub extern fn erl_drv_consume_timeslice(port: ErlDrvPort, percent: c_int) c_int;
pub extern fn erl_errno_id(@"error": c_int) [*c]u8;
pub extern fn driver_failure_eof(port: ErlDrvPort) c_int;
pub extern fn driver_failure_atom(port: ErlDrvPort, string: [*c]u8) c_int;
pub extern fn driver_failure_posix(port: ErlDrvPort, @"error": c_int) c_int;
pub extern fn driver_failure(port: ErlDrvPort, @"error": c_int) c_int;
pub extern fn driver_exit(port: ErlDrvPort, err: c_int) c_int;
pub extern fn driver_pdl_create(ErlDrvPort) ErlDrvPDL;
pub extern fn driver_pdl_lock(ErlDrvPDL) void;
pub extern fn driver_pdl_unlock(ErlDrvPDL) void;
pub extern fn driver_pdl_get_refc(ErlDrvPDL) ErlDrvSInt;
pub extern fn driver_pdl_inc_refc(ErlDrvPDL) ErlDrvSInt;
pub extern fn driver_pdl_dec_refc(ErlDrvPDL) ErlDrvSInt;
pub extern fn driver_monitor_process(port: ErlDrvPort, process: ErlDrvTermData, monitor: [*c]ErlDrvMonitor) c_int;
pub extern fn driver_demonitor_process(port: ErlDrvPort, monitor: [*c]const ErlDrvMonitor) c_int;
pub extern fn driver_get_monitored_process(port: ErlDrvPort, monitor: [*c]const ErlDrvMonitor) ErlDrvTermData;
pub extern fn driver_compare_monitors(monitor1: [*c]const ErlDrvMonitor, monitor2: [*c]const ErlDrvMonitor) c_int;
pub extern fn set_busy_port(port: ErlDrvPort, on: c_int) void;
pub extern fn set_port_control_flags(port: ErlDrvPort, flags: c_int) void;
pub extern fn get_port_flags(port: ErlDrvPort) c_int;
pub extern fn driver_free_binary(bin: [*c]ErlDrvBinary) void;
pub extern fn driver_alloc_binary(size: ErlDrvSizeT) [*c]ErlDrvBinary;
pub extern fn driver_realloc_binary(bin: [*c]ErlDrvBinary, size: ErlDrvSizeT) [*c]ErlDrvBinary;
pub extern fn driver_binary_get_refc(dbp: [*c]ErlDrvBinary) ErlDrvSInt;
pub extern fn driver_binary_inc_refc(dbp: [*c]ErlDrvBinary) ErlDrvSInt;
pub extern fn driver_binary_dec_refc(dbp: [*c]ErlDrvBinary) ErlDrvSInt;
pub extern fn driver_free(ptr: ?*anyopaque) void;
pub extern fn driver_alloc(size: ErlDrvSizeT) ?*anyopaque;
pub extern fn driver_realloc(ptr: ?*anyopaque, size: ErlDrvSizeT) ?*anyopaque;
pub extern fn driver_enq(port: ErlDrvPort, buf: [*c]u8, len: ErlDrvSizeT) c_int;
pub extern fn driver_pushq(port: ErlDrvPort, buf: [*c]u8, len: ErlDrvSizeT) c_int;
pub extern fn driver_deq(port: ErlDrvPort, size: ErlDrvSizeT) ErlDrvSizeT;
pub extern fn driver_sizeq(port: ErlDrvPort) ErlDrvSizeT;
pub extern fn driver_enq_bin(port: ErlDrvPort, bin: [*c]ErlDrvBinary, offset: ErlDrvSizeT, len: ErlDrvSizeT) c_int;
pub extern fn driver_pushq_bin(port: ErlDrvPort, bin: [*c]ErlDrvBinary, offset: ErlDrvSizeT, len: ErlDrvSizeT) c_int;
pub extern fn driver_peekqv(port: ErlDrvPort, ev: [*c]ErlIOVec) ErlDrvSizeT;
pub extern fn driver_peekq(port: ErlDrvPort, vlen: [*c]c_int) [*c]SysIOVec;
pub extern fn driver_enqv(port: ErlDrvPort, ev: [*c]ErlIOVec, skip: ErlDrvSizeT) c_int;
pub extern fn driver_pushqv(port: ErlDrvPort, ev: [*c]ErlIOVec, skip: ErlDrvSizeT) c_int;
pub extern fn add_driver_entry(de: [*c]ErlDrvEntry) void;
pub extern fn remove_driver_entry(de: [*c]ErlDrvEntry) c_int;
pub extern fn driver_system_info(sip: [*c]ErlDrvSysInfo, si_size: usize) void;
pub extern fn erl_drv_mutex_destroy(mtx: ?*ErlDrvMutex) void;
pub extern fn erl_drv_mutex_create(name: [*c]u8) ?*ErlDrvMutex;
pub extern fn erl_drv_mutex_trylock(mtx: ?*ErlDrvMutex) c_int;
pub extern fn erl_drv_mutex_lock(mtx: ?*ErlDrvMutex) void;
pub extern fn erl_drv_mutex_unlock(mtx: ?*ErlDrvMutex) void;
pub extern fn erl_drv_cond_destroy(cnd: ?*ErlDrvCond) void;
pub extern fn erl_drv_cond_create(name: [*c]u8) ?*ErlDrvCond;
pub extern fn erl_drv_cond_signal(cnd: ?*ErlDrvCond) void;
pub extern fn erl_drv_cond_broadcast(cnd: ?*ErlDrvCond) void;
pub extern fn erl_drv_cond_wait(cnd: ?*ErlDrvCond, mtx: ?*ErlDrvMutex) void;
pub extern fn erl_drv_rwlock_destroy(rwlck: ?*ErlDrvRWLock) void;
pub extern fn erl_drv_rwlock_create(name: [*c]u8) ?*ErlDrvRWLock;
pub extern fn erl_drv_rwlock_tryrlock(rwlck: ?*ErlDrvRWLock) c_int;
pub extern fn erl_drv_rwlock_rlock(rwlck: ?*ErlDrvRWLock) void;
pub extern fn erl_drv_rwlock_runlock(rwlck: ?*ErlDrvRWLock) void;
pub extern fn erl_drv_rwlock_tryrwlock(rwlck: ?*ErlDrvRWLock) c_int;
pub extern fn erl_drv_rwlock_rwlock(rwlck: ?*ErlDrvRWLock) void;
pub extern fn erl_drv_rwlock_rwunlock(rwlck: ?*ErlDrvRWLock) void;
pub extern fn erl_drv_tsd_key_create(name: [*c]u8, key: [*c]ErlDrvTSDKey) c_int;
pub extern fn erl_drv_tsd_key_destroy(key: ErlDrvTSDKey) void;
pub extern fn erl_drv_tsd_set(key: ErlDrvTSDKey, data: ?*anyopaque) void;
pub extern fn erl_drv_tsd_get(key: ErlDrvTSDKey) ?*anyopaque;
pub extern fn erl_drv_thread_opts_destroy(opts: [*c]ErlDrvThreadOpts) void;
pub extern fn erl_drv_thread_opts_create(name: [*c]u8) [*c]ErlDrvThreadOpts;
pub extern fn erl_drv_thread_create(name: [*c]u8, tid: [*c]ErlDrvTid, func: ?*const fn (?*anyopaque) callconv(.C) ?*anyopaque, args: ?*anyopaque, opts: [*c]ErlDrvThreadOpts) c_int;
pub extern fn erl_drv_thread_self() ErlDrvTid;
pub extern fn erl_drv_equal_tids(tid1: ErlDrvTid, tid2: ErlDrvTid) c_int;
pub extern fn erl_drv_thread_exit(resp: ?*anyopaque) void;
pub extern fn erl_drv_thread_join(ErlDrvTid, respp: [*c]?*anyopaque) c_int;
pub extern fn erl_drv_mutex_name(mtx: ?*ErlDrvMutex) [*c]u8;
pub extern fn erl_drv_cond_name(cnd: ?*ErlDrvCond) [*c]u8;
pub extern fn erl_drv_rwlock_name(rwlck: ?*ErlDrvRWLock) [*c]u8;
pub extern fn erl_drv_thread_name(tid: ErlDrvTid) [*c]u8;
pub extern fn null_func() c_int;
pub extern fn driver_mk_atom([*c]u8) ErlDrvTermData;
pub extern fn driver_mk_port(ErlDrvPort) ErlDrvTermData;
pub extern fn driver_connected(ErlDrvPort) ErlDrvTermData;
pub extern fn driver_caller(ErlDrvPort) ErlDrvTermData;
pub extern const driver_term_nil: ErlDrvTermData;
pub extern fn driver_mk_term_nil() ErlDrvTermData;
pub extern fn driver_create_port(creator_port: ErlDrvPort, connected: ErlDrvTermData, name: [*c]u8, drv_data: ErlDrvData) ErlDrvPort;
pub extern fn driver_output_term(ix: ErlDrvPort, data: [*c]ErlDrvTermData, len: c_int) c_int;
pub extern fn driver_send_term(ix: ErlDrvPort, to: ErlDrvTermData, data: [*c]ErlDrvTermData, len: c_int) c_int;
pub extern fn erl_drv_output_term(port: ErlDrvTermData, data: [*c]ErlDrvTermData, len: c_int) c_int;
pub extern fn erl_drv_send_term(port: ErlDrvTermData, to: ErlDrvTermData, data: [*c]ErlDrvTermData, len: c_int) c_int;
pub extern fn driver_async_port_key(port: ErlDrvPort) c_uint;
pub extern fn driver_async(ix: ErlDrvPort, key: [*c]c_uint, async_invoke: ?*const fn (?*anyopaque) callconv(.C) void, async_data: ?*anyopaque, async_free: ?*const fn (?*anyopaque) callconv(.C) void) c_long;
pub extern fn driver_lock_driver(ix: ErlDrvPort) c_int;
pub extern fn driver_get_now(now: [*c]ErlDrvNowData) c_int;
pub extern fn erl_drv_monotonic_time(time_unit: ErlDrvTimeUnit) ErlDrvTime;
pub extern fn erl_drv_time_offset(time_unit: ErlDrvTimeUnit) ErlDrvTime;
pub extern fn erl_drv_convert_time_unit(val: ErlDrvTime, from: ErlDrvTimeUnit, to: ErlDrvTimeUnit) ErlDrvTime;
pub extern fn driver_dl_open([*c]u8) ?*anyopaque;
pub extern fn driver_dl_sym(?*anyopaque, [*c]u8) ?*anyopaque;
pub extern fn driver_dl_close(?*anyopaque) c_int;
pub extern fn driver_dl_error() [*c]u8;
pub extern fn erl_drv_putenv(key: [*c]const u8, value: [*c]u8) c_int;
pub extern fn erl_drv_getenv(key: [*c]const u8, value: [*c]u8, value_size: [*c]usize) c_int;
pub extern fn erl_drv_init_ack(ix: ErlDrvPort, res: ErlDrvData) void;
pub extern fn erl_drv_set_os_pid(ix: ErlDrvPort, pid: ErlDrvSInt) void;
pub extern fn dtrace_drvport_str(port: ErlDrvPort, port_buf: [*c]u8) void;
pub const ERL_NAPI_SINT64_MAX__ = @import("std").zig.c_translation.promoteIntLiteral(c_long, 9223372036854775807, .decimal);
pub const ERL_NAPI_SINT64_MIN__ = -ERL_NAPI_SINT64_MAX__ - @as(c_long, 1);
pub const ERTS_NAPI_TIME_ERROR__ = ERL_NAPI_SINT64_MIN__;
pub const ERL_DRV_READ = @import("std").zig.c_translation.cast(c_int, ERL_NIF_SELECT_READ);
pub const ERL_DRV_WRITE = @import("std").zig.c_translation.cast(c_int, ERL_NIF_SELECT_WRITE);
pub const ERL_DRV_USE = @import("std").zig.c_translation.cast(c_int, ERL_NIF_SELECT_STOP);
pub const ERL_DRV_USE_NO_CALLBACK = ERL_DRV_USE | (ERL_DRV_USE << @as(c_int, 1));
pub const DO_READ = ERL_DRV_READ;
pub const DO_WRITE = ERL_DRV_WRITE;
pub const ERL_DRV_EXTENDED_MARKER = @import("std").zig.c_translation.promoteIntLiteral(c_int, 0xfeeeeeed, .hexadecimal);
pub const ERL_DRV_EXTENDED_MAJOR_VERSION = @as(c_int, 3);
pub const ERL_DRV_EXTENDED_MINOR_VERSION = @as(c_int, 3);
pub const ERL_DRV_MIN_REQUIRED_MAJOR_VERSION_ON_LOAD = @as(c_int, 2);
pub const PORT_CONTROL_FLAG_BINARY = @as(c_int, 1) << @as(c_int, 0);
pub const PORT_CONTROL_FLAG_HEAVY = @as(c_int, 1) << @as(c_int, 1);
pub const PORT_FLAG_BINARY = @as(c_int, 1) << @as(c_int, 0);
pub const PORT_FLAG_LINE = @as(c_int, 1) << @as(c_int, 1);
pub const ERL_DRV_FLAG_USE_PORT_LOCKING = @as(c_int, 1) << @as(c_int, 0);
pub const ERL_DRV_FLAG_SOFT_BUSY = @as(c_int, 1) << @as(c_int, 1);
pub const ERL_DRV_FLAG_NO_BUSY_MSGQ = @as(c_int, 1) << @as(c_int, 2);
pub const ERL_DRV_FLAG_USE_INIT_ACK = @as(c_int, 1) << @as(c_int, 3);
pub const ERL_DRV_TIME_ERROR = @import("std").zig.c_translation.cast(ErlDrvSInt64, ERTS_NAPI_TIME_ERROR__);
pub const ERL_DRV_ERROR_GENERAL = @import("std").zig.c_translation.cast(ErlDrvData, -@as(c_int, 1));
pub const ERL_DRV_ERROR_ERRNO = @import("std").zig.c_translation.cast(ErlDrvData, -@as(c_int, 2));
pub const ERL_DRV_ERROR_BADARG = @import("std").zig.c_translation.cast(ErlDrvData, -@as(c_int, 3));
pub const ERL_DRV_BUSY_MSGQ_DISABLED = ~@import("std").zig.c_translation.cast(ErlDrvSizeT, @as(c_int, 0));
pub const ERL_DRV_BUSY_MSGQ_READ_ONLY = @import("std").zig.c_translation.cast(ErlDrvSizeT, @as(c_int, 0));
pub const ERL_DRV_BUSY_MSGQ_LIM_MAX = ERL_DRV_BUSY_MSGQ_DISABLED - @as(c_int, 1);
pub const ERL_DRV_BUSY_MSGQ_LIM_MIN = @import("std").zig.c_translation.cast(ErlDrvSizeT, @as(c_int, 1));
pub const DRIVER_CALL_KEEP_BUFFER = @as(c_int, 0x1);
pub inline fn TERM_DATA(x: anytype) ErlDrvTermData {
    return @import("std").zig.c_translation.cast(ErlDrvTermData, x);
}
pub const ERL_DRV_NIL = @import("std").zig.c_translation.cast(ErlDrvTermData, @as(c_int, 1));
pub const ERL_DRV_ATOM = @import("std").zig.c_translation.cast(ErlDrvTermData, @as(c_int, 2));
pub const ERL_DRV_INT = @import("std").zig.c_translation.cast(ErlDrvTermData, @as(c_int, 3));
pub const ERL_DRV_PORT = @import("std").zig.c_translation.cast(ErlDrvTermData, @as(c_int, 4));
pub const ERL_DRV_BINARY = @import("std").zig.c_translation.cast(ErlDrvTermData, @as(c_int, 5));
pub const ERL_DRV_STRING = @import("std").zig.c_translation.cast(ErlDrvTermData, @as(c_int, 6));
pub const ERL_DRV_TUPLE = @import("std").zig.c_translation.cast(ErlDrvTermData, @as(c_int, 7));
pub const ERL_DRV_LIST = @import("std").zig.c_translation.cast(ErlDrvTermData, @as(c_int, 8));
pub const ERL_DRV_STRING_CONS = @import("std").zig.c_translation.cast(ErlDrvTermData, @as(c_int, 9));
pub const ERL_DRV_PID = @import("std").zig.c_translation.cast(ErlDrvTermData, @as(c_int, 10));
pub const ERL_DRV_FLOAT = @import("std").zig.c_translation.cast(ErlDrvTermData, @as(c_int, 11));
pub const ERL_DRV_EXT2TERM = @import("std").zig.c_translation.cast(ErlDrvTermData, @as(c_int, 12));
pub const ERL_DRV_UINT = @import("std").zig.c_translation.cast(ErlDrvTermData, @as(c_int, 13));
pub const ERL_DRV_BUF2BINARY = @import("std").zig.c_translation.cast(ErlDrvTermData, @as(c_int, 14));
pub const ERL_DRV_INT64 = @import("std").zig.c_translation.cast(ErlDrvTermData, @as(c_int, 15));
pub const ERL_DRV_UINT64 = @import("std").zig.c_translation.cast(ErlDrvTermData, @as(c_int, 16));
pub const ERL_DRV_MAP = @import("std").zig.c_translation.cast(ErlDrvTermData, @as(c_int, 17));
pub const ErlNifSelectFlags = enum_ErlNifSelectFlags;
pub const erl_drv_binary = struct_erl_drv_binary;
pub const _erl_drv_data = struct__erl_drv_data;
pub const _erl_drv_event = struct__erl_drv_event;
pub const _erl_drv_port = struct__erl_drv_port;
pub const erl_io_vec = struct_erl_io_vec;
pub const ErlDrvTid_ = struct_ErlDrvTid_;
pub const ErlDrvMutex_ = struct_ErlDrvMutex_;
pub const ErlDrvCond_ = struct_ErlDrvCond_;
pub const ErlDrvRWLock_ = struct_ErlDrvRWLock_;
pub const erl_drv_port_data_lock = struct_erl_drv_port_data_lock;
pub const erl_drv_entry = struct_erl_drv_entry;
