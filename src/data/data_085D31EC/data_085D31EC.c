#include "global.h"
#include "proc.h"

/* #148 proc-script decomp-completeness: data_085D31EC (SIO big-transfer scripts).
 *
 * Five proc scripts previously existed ONLY as raw `.4byte` residue words in the
 * `.data.residue.085D31EC` blob (opcode/imm/ptr words invisible to
 * `make shiftcheck`, and reachable only via baseline `.set NAME, 0xADDR` aliases
 * in the generated asm/jp_syms.s). Each table is decoded (from JP bytes, pointers
 * resolved against the freshly-built ELF) into its OWN 4-aligned
 * `.rodata.dat_NAME_ref` section that the carved_rom layout places at its exact
 * JP address; the redundant baseline aliases are dropped in
 * layout/baseline_syms_drop.d/procscr_data_085D31EC_148.tsv so the real typed
 * symbols (referenced by sio.h / sio_core.h consumers) win.
 *
 * Every pointer word becomes an R_ARM_ABS32 relocation. FUNC targets are bare
 * (NO addend -- ld ORs the Thumb bit); the PROC_NAME string pointers use
 * byte-exact (u8*) arithmetic into the shared data_080DD3D0 name blob (all three
 * offsets land inside [0x080DD3D0,0x080DD41C), i.e. mid-resource, not another
 * resource's START -> not a shiftcheck HIGH). The 28-byte tail [0x085D32A4,
 * 0x085D32C0) -- one raw EWRAM word plus an un-named 3-command script whose two
 * ROM func pointers must stay RELOCATED -- is kept byte-identical as an inline
 * `.4byte` slice (leaving it as INCBIN would turn those func pointers into
 * un-relocated hardcoded ROM pointers = HIGH). REGION_SAME; the ONLY correctness
 * oracle is `make compare` (sha1).
 */

extern u8 data_080DD3D0[];
extern void SioBigSend_Init();
extern void SioBigSend_Loop();
extern void SioBigReceive_Init();
extern void SioBigReceive_RecvHeader();
extern void SioBigReceive_Loop();
extern void SioInit();
extern void SioPollingMsgAndAck();
extern void SioVsync_Loop();
extern void SioMain_Loop();

struct ProcCmd gProcScr_SioBigSend[] __attribute__((section(".rodata.dat_gProcScr_SioBigSend_ref"))) = {
    PROC_SLEEP(0),
    PROC_CALL(SioBigSend_Init),
    PROC_REPEAT(SioBigSend_Loop),
    PROC_END,
};

struct ProcCmd gProcScr_SioBigReceive[] __attribute__((section(".rodata.dat_gProcScr_SioBigReceive_ref"))) = {
    PROC_SLEEP(0),
    PROC_CALL(SioBigReceive_Init),
    PROC_REPEAT(SioBigReceive_RecvHeader),
    PROC_REPEAT(SioBigReceive_Loop),
    PROC_END,
};

struct ProcCmd ProcScr_SIOCON[] __attribute__((section(".rodata.dat_ProcScr_SIOCON_ref"))) = {
    PROC_NAME((void*)((u8*)data_080DD3D0 + 0x30)),
    PROC_15,
    PROC_CALL(SioInit),
    PROC_REPEAT(SioPollingMsgAndAck),
    PROC_END,
};

struct ProcCmd ProcScr_SIOVSYNC[] __attribute__((section(".rodata.dat_ProcScr_SIOVSYNC_ref"))) = {
    PROC_NAME((void*)((u8*)data_080DD3D0 + 0x38)),
    PROC_15,
    PROC_SLEEP(0),
    PROC_REPEAT(SioVsync_Loop),
    PROC_END,
};

struct ProcCmd ProcScr_SIOMAIN[] __attribute__((section(".rodata.dat_ProcScr_SIOMAIN_ref"))) = {
    PROC_NAME((void*)((u8*)data_080DD3D0 + 0x44)),
    PROC_15,
    PROC_REPEAT(SioMain_Loop),
    PROC_END,
};

/* Tail [0x085D32A4,0x085D32C0): raw EWRAM word (0x02020188) + un-named 3-command
 * proc script (CALL/REPEAT/END) whose two func pointers stay relocated. */
__asm__(
"\t.section .data.residue.085D32A4, \"aw\", %progbits\n"
"\t.global data_085D32A4\n"
"data_085D32A4:\n"
"\t.4byte 0x02020188\n"
"\t.4byte 0x00000002\n"
"\t.4byte Sio_LoadingBlendPulse_Init + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte Sio_LoadingBlendPulse_Loop + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
