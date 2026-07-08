#include "global.h"

/* Byte-neutral SPLIT of the former data_08908228 REDA blob (120 B, region-same)
 * into 13 named REDA sub-objects. Each keeps the exact word stream and its own
 * .data.residue.<ADDR> section so the linker places it contiguously in address
 * order (make compare is the oracle). Consumers (UnitDef_Event_Prologue*) repoint
 * their .redas from data_08908228+0xNN to these names. */

u32 REDAs_PrologueMessager[] __attribute__((section(".data.residue.08908228"))) = {
    0x000002C9, 0x0000FFFF, 0x000002CD, 0x0000FFFF, 0x0000018D, 0x0000FFFF,
};
u32 REDAs_PrologueGradoRoyals1[] __attribute__((section(".data.residue.08908240"))) = {
    0x0000C18D, 0x0000FFFF,
};
u32 REDAs_PrologueGradoRoyals2[] __attribute__((section(".data.residue.08908248"))) = {
    0x0000C1CC, 0x0000FFFF,
};
u32 REDA_PrologueGradoShamans0[] __attribute__((section(".data.residue.08908250"))) = {
    0x00000107, 0x0000FFFF,
};
u32 REDA_PrologueGradoShamans1[] __attribute__((section(".data.residue.08908258"))) = {
    0x00000186, 0x0000FFFF,
};
u32 REDA_PrologueGradoShamans2[] __attribute__((section(".data.residue.08908260"))) = {
    0x000000D3, 0x0000FFFF,
};
u32 REDA_PrologueGradoShamans3[] __attribute__((section(".data.residue.08908268"))) = {
    0x00000194, 0x0000FFFF,
};
u32 REDA_PrologueGradoCavalry0[] __attribute__((section(".data.residue.08908270"))) = {
    0x0001010A, 0x0000FFFF,
};
u32 REDA_PrologueGradoCavalry1[] __attribute__((section(".data.residue.08908278"))) = {
    0x00010110, 0x0000FFFF,
};
u32 REDA_PrologueGradoCavalry2[] __attribute__((section(".data.residue.08908280"))) = {
    0x0001018A, 0x0028FFFF,
};
u32 REDA_PrologueGradoCavalry3[] __attribute__((section(".data.residue.08908288"))) = {
    0x00010190, 0x0028FFFF,
};
u32 REDA_PrologueGradoCavalry4[] __attribute__((section(".data.residue.08908290"))) = {
    0x8301020A, 0x0000FFFF,
};
u32 REDA_PrologueGradoCavalry5[] __attribute__((section(".data.residue.08908298"))) = {
    0x83010210, 0x0000FFFF,
};
