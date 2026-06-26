#include "global.h"

/* De-pointered event script EventScr_Ch16A_1: command 0x0A40 takes a pointer
 * operand in the following word. Offset 0x24 -> data_085B9BBC+0x168 (data ref),
 * offset 0x30 -> EventScr_Ch16A_1+0x54 (self jump target, a valid command
 * boundary). Both are real, interior-within-size pointers -> emitted as .4byte sym
 * relocations so the script is shiftable. Bytecode kept raw. Byte-exact (make compare). */

__asm__(
"\t.section .rodata.dat_EventScr_Ch16A_1_ref, \"a\", %progbits\n"
"\t.global EventScr_Ch16A_1\n"
"EventScr_Ch16A_1:\n"
"\t.4byte 0x002A0620\n"
"\t.4byte 0x00001860\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0A061862\n"
"\t.4byte 0x02000000\n"
"\t.4byte 0x02000200\n"
"\t.4byte 0x00801722\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_085B9BBC + 0x168\n"
"\t.4byte 0x00041020\n"
"\t.4byte 0x00000A40\n"
"\t.4byte EventScr_Ch16A_1 + 0x54\n"
"\t.4byte 0x7FFF1324\n"
"\t.4byte 0x00001A21\n"
"\t.4byte 0x00A20620\n"
"\t.4byte 0xFFFF2140\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00041722\n"
"\t.4byte 0x00001020\n"
"\t.4byte 0x00000120\n"
"\t.4byte 0x00001920\n"
"\t.4byte 0x00010540\n"
);
