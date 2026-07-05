#include "global.h"
#include "proc.h"

/* #148 proc-script decomp-completeness: data_085B8F80 (face proc scripts).
 *
 * Five opaque proc scripts inside the `.data.residue.085B8F80` blob are decoded
 * (structure ported from fe8u src/face.c, pointers resolved against the JP ELF)
 * into typed `struct ProcCmd NAME[]` in their OWN 4-aligned
 * `.rodata.dat_NAME_ref` sections at their exact JP addresses:
 *   - gProcScr_Face_0           (6 ProcCmd)  @0x085B8F9C
 *   - gProcScr_FaceEndIn8Frames (3 ProcCmd)  @0x085B8FCC
 *   - gProcScr_Face_1           (3 ProcCmd)  @0x085B8FE4
 *   - gProcScr_FaceBlink        (20 ProcCmd) @0x085B8FFC
 *   - gProcScr_Face_2           (7 ProcCmd)  @0x085B909C
 * Their redundant baseline `.set NAME,0xADDR` aliases are dropped so the typed
 * symbols win. The 28-byte lead [0x085B8F80,0x085B8F9C) is non-pointer gfx/OAM
 * template data (no relocations) kept byte-identical as raw `.4byte` under its
 * original data_085B8F80 label. fe8j uses sub_8006228 / gap_00006274 /
 * gap_000062C0 where fe8u names FaceBlink_CloseEyesInit / _HalfCloseInit /
 * _WinkInit -- the fe8j symbols are used (make compare verifies addresses).
 * FUNC targets are bare (ld ORs the Thumb bit). REGION_SAME; the ONLY
 * correctness oracle is `make compare` (sha1).
 */

extern void FaceBgBlink_Init();
extern void FaceBgBlink_WaitLoop();
extern void FaceBgBlink_AnimLoop();
extern void EndFacePtr();
extern void FaceMouth_Init();
extern void FaceMouth_Loop();
extern void FaceBlink_Init();
extern void FaceBlink_WaitLoop();
extern void FaceBlink_AnimLoop();
extern void sub_8006228();
extern void FaceBlink_CloseEyesLoop();
extern u8 gap_00006274[];   /* OBJECT (not FUNC): Thumb bit must be added by hand */
extern void FaceBlink_HalfCloseLoop();
extern u8 gap_000062C0[];   /* OBJECT (not FUNC): Thumb bit must be added by hand */
extern void FaceBlink_WinkLoop();
extern void FaceChange_LockChildProcs();
extern void FaceChange_LoadGfx();
extern void FaceChange_Finish();

/* Lead [0x085B8F80,0x085B8F9C) (28 B): non-pointer gfx/OAM data, byte-identical. */
__asm__(
"\t.section .data.residue.085B8F80, \"aw\", %progbits\n"
"\t.global data_085B8F80\n"
"data_085B8F80:\n"
"\t.4byte 0x40000002\n"
"\t.4byte 0x00008000\n"
"\t.4byte 0x80004010\n"
"\t.4byte 0x00020004\n"
"\t.4byte 0x90004000\n"
"\t.4byte 0x40100000\n"
"\t.4byte 0x00049000\n"
);

struct ProcCmd gProcScr_Face_0[] __attribute__((section(".rodata.dat_gProcScr_Face_0_ref"))) = {
    PROC_CALL(FaceBgBlink_Init),
    PROC_LABEL(0),
    PROC_REPEAT(FaceBgBlink_WaitLoop),
    PROC_REPEAT(FaceBgBlink_AnimLoop),
    PROC_GOTO(0),
    PROC_END,
};

struct ProcCmd gProcScr_FaceEndIn8Frames[] __attribute__((section(".rodata.dat_gProcScr_FaceEndIn8Frames_ref"))) = {
    PROC_SLEEP(8),
    PROC_CALL(EndFacePtr),
    PROC_END,
};

struct ProcCmd gProcScr_Face_1[] __attribute__((section(".rodata.dat_gProcScr_Face_1_ref"))) = {
    PROC_CALL(FaceMouth_Init),
    PROC_REPEAT(FaceMouth_Loop),
    PROC_END,
};

struct ProcCmd gProcScr_FaceBlink[] __attribute__((section(".rodata.dat_gProcScr_FaceBlink_ref"))) = {
    PROC_LABEL(0),
    PROC_CALL(FaceBlink_Init),
    PROC_LABEL(0),
    PROC_REPEAT(FaceBlink_WaitLoop),
    PROC_LABEL(1),
    PROC_REPEAT(FaceBlink_AnimLoop),
    PROC_LABEL(2),
    PROC_CALL(sub_8006228),
    PROC_REPEAT(FaceBlink_CloseEyesLoop),
    PROC_REPEAT(FaceBlink_WaitLoop),
    PROC_LABEL(3),
    PROC_CALL((void *)(gap_00006274 + 1)),
    PROC_REPEAT(FaceBlink_HalfCloseLoop),
    PROC_REPEAT(FaceBlink_WaitLoop),
    PROC_LABEL(4),
    PROC_CALL((void *)(gap_000062C0 + 1)),
    PROC_REPEAT(FaceBlink_WinkLoop),
    PROC_LABEL(97),
    PROC_REPEAT(FaceBlink_CloseEyesLoop),
    PROC_END,
};

struct ProcCmd gProcScr_Face_2[] __attribute__((section(".rodata.dat_gProcScr_Face_2_ref"))) = {
    PROC_SLEEP(0),
    PROC_CALL(FaceChange_LockChildProcs),
    PROC_SLEEP(2),
    PROC_CALL(FaceChange_LoadGfx),
    PROC_SLEEP(0),
    PROC_CALL(FaceChange_Finish),
    PROC_END,
};
