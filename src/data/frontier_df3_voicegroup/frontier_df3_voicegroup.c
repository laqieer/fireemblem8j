#include "global.h"

/* Migrated from asm/frontier_df3_voicegroup.s (region-different voicegroup
 * residue: the bytes BETWEEN the editable sound/voicegroups/*.s tables.
 * Byte-identical via INCBIN_U8; baserom.gba NOT in this chain (self-contained).
 */

/* frontier_df3_voicegroup_000_1F70E8 (ROM 0x081F70E8) is the m4a extended-command
 * dispatch table gXcmdTable: 12 Thumb-function pointers to the ply_x* handlers
 * (identical order to fe8u src/m4a_tables.s gXcmdTable) + 8 bytes of trailing
 * zero padding. Carved from the raw INCBIN to relocatable `.4byte ply_x*`
 * references (ld ORs the Thumb bit -> byte-exact 0x080D62xx|1; now shiftable). */
__asm__(
"\t.section .data.frontier_df3_voicegroup.gap0, \"aw\", %progbits\n"
"\t.global frontier_df3_voicegroup_000_1F70E8\n"
"\t.type frontier_df3_voicegroup_000_1F70E8, %object\n"
"frontier_df3_voicegroup_000_1F70E8:\n"
"\t.4byte ply_xxx\n"    /* gXcmdTable[0]  */
"\t.4byte ply_xwave\n"  /* [1] */
"\t.4byte ply_xtype\n"  /* [2] */
"\t.4byte ply_xxx\n"    /* [3] */
"\t.4byte ply_xatta\n"  /* [4] */
"\t.4byte ply_xdeca\n"  /* [5] */
"\t.4byte ply_xsust\n"  /* [6] */
"\t.4byte ply_xrele\n"  /* [7] */
"\t.4byte ply_xiecv\n"  /* [8] */
"\t.4byte ply_xiecl\n"  /* [9] */
"\t.4byte ply_xleng\n"  /* [10] */
"\t.4byte ply_xswee\n"  /* [11] */
"\t.4byte 0\n"
"\t.4byte 0\n"
"\t.size frontier_df3_voicegroup_000_1F70E8, 56\n"
);
/* gap1 now holds only the 537-byte prefix residue (0x202C07-0x202E20): the
 * 3-byte-misaligned tail of the voicegroup035 region. The remainder of this
 * blob (0x202E20-0x2031D4) is voicegroup036, now built from the editable
 * sound/voicegroups/voicegroup036.s voice_* macro table (S2). */
u8 frontier_df3_voicegroup_001_202C07[] __attribute__((section(".data.frontier_df3_voicegroup.gap1"))) = INCBIN_U8("data/sound/frontier_df3_voicegroup_001_202C07.bin", 0, 537);
