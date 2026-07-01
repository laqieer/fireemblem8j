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
/* frontier_df3_voicegroup_001_202C07 (ROM 0x08202C07, first 537 B used): the
 * voicegroup035 DirectSound key-split table -- 12-byte records
 * [DirectSoundData_* pointer][0x00FF00FF][0x00003C00] for the horse SFX bank.
 * All 41 sample pointers resolve to named DirectSoundData_horse*_m1_13k8b globals
 * (like the wave30 gXcmdTable). Carved to relocatable .4byte Sym; the object base
 * is 3-byte-misaligned so a single leading .byte precedes the .4byte word stream.
 * Byte-exact; 0 unresolved ROM pointers (shiftable, 0 HIGH). */
__asm__(
"\t.section .data.frontier_df3_voicegroup.gap1, \"aw\", %progbits\n"
"\t.global frontier_df3_voicegroup_001_202C07\n"
"frontier_df3_voicegroup_001_202C07:\n"
"\t.byte 0x00\n"
"\t.4byte DirectSoundData_horse2_b2_grass1_m1_13k8b, 0x00FF00FF, 0x00003C00, DirectSoundData_horse2_t1_grass1_m1_13k8b, 0x00FF00FF, 0x00003C00\n"
"\t.4byte DirectSoundData_horse3_f1_grass1_m1_13k8b, 0x00FF00FF, 0x00003C00, DirectSoundData_horse3_b1_grass1_m1_13k8b, 0x00FF00FF, 0x00003C00\n"
"\t.4byte DirectSoundData_horse3_t3_grass1_m1_13k8b, 0x00FF00FF, 0x00003C01, 0x00000002, 0x000F0000, 0x00003C00\n"
"\t.4byte DirectSoundData_horse1_f1_dart1_m1_13k8b, 0x00FF00FF, 0x00003C00, DirectSoundData_horse1_b1_dart1_m1_13k8b, 0x00FF00FF, 0x00003C00\n"
"\t.4byte DirectSoundData_horse1_t2_dart1_m1_13k8b, 0x00FF00FF, 0x00003C00, DirectSoundData_horse2_f1_dart1_m1_13k8b, 0x00FF00FF, 0x00003C00\n"
"\t.4byte DirectSoundData_horse2_b2_dart1_m1_13k8b, 0x00FF00FF, 0x00003C00, DirectSoundData_horse2_t1_dart1_m1_13k8b, 0x00FF00FF, 0x00003C00\n"
"\t.4byte DirectSoundData_horse3_f1_dart1_m1_13k8b, 0x00FF00FF, 0x00003C00, DirectSoundData_horse3_b1_dart1_m1_13k8b, 0x00FF00FF, 0x00003C00\n"
"\t.4byte DirectSoundData_horse3_t3_dart1_m1_13k8b, 0x00FF00FF, 0x00003C01, 0x00000002, 0x000F0000, 0x00003C00\n"
"\t.4byte DirectSoundData_horse1_f1_sand1_m1_13k8b, 0x00FF00FF, 0x00003C00, DirectSoundData_horse1_b1_sand1_m1_13k8b, 0x00FF00FF, 0x00003C00\n"
"\t.4byte DirectSoundData_horse1_t1_sand1_m1_13k8b, 0x00FF00FF, 0x00003C00, DirectSoundData_horse2_f1_sand1_m1_13k8b, 0x00FF00FF, 0x00003C00\n"
"\t.4byte DirectSoundData_horse2_b1_sand1_m1_13k8b, 0x00FF00FF, 0x00003C00, DirectSoundData_horse2_t1_sand1_m1_13k8b, 0x00FF00FF, 0x00003C00\n"
"\t.4byte DirectSoundData_horse3_f1_sand1_m1_13k8b, 0x00FF00FF, 0x00003C00, DirectSoundData_horse3_b1_sand1_m1_13k8b, 0x00FF00FF, 0x00003C00\n"
"\t.4byte DirectSoundData_horse3_t1_sand1_m1_13k8b, 0x00FF00FF, 0x00003C01, 0x00000002, 0x000F0000, 0x00003C00\n"
"\t.4byte DirectSoundData_horse1_f1_wood1_m1_13k8b, 0x00FF00FF, 0x00003C00, DirectSoundData_horse1_b1_wood1_m1_13k8b, 0x00FF00FF, 0x00003C00\n"
"\t.4byte DirectSoundData_horse1_t2_wood1_m1_13k8b, 0x00FF00FF, 0x00003C00, DirectSoundData_horse2_f1_wood1_m1_13k8b, 0x00FF00FF, 0x00003C00\n"
"\t.4byte DirectSoundData_horse2_b2_wood1_m1_13k8b, 0x00FF00FF, 0x00003C00, DirectSoundData_horse2_t1_wood1_m1_13k8b, 0x00FF00FF, 0x00003C00\n"
"\t.4byte DirectSoundData_horse3_f1_wood1_m1_13k8b, 0x00FF00FF, 0x00003C00, DirectSoundData_horse3_b1_wood1_m1_13k8b, 0x00FF00FF, 0x00003C00\n"
"\t.4byte DirectSoundData_horse3_t3_wood1_m1_13k8b, 0x00FF00FF, 0x00003C01, 0x00000002, 0x000F0000, 0x00003C00\n"
"\t.4byte DirectSoundData_horse1_f1_stone1_m2_13k8b, 0x00FF00FF, 0x00003C00, DirectSoundData_horse1_b1_stone1_m2_13k8b, 0x00FF00FF, 0x00003C00\n"
"\t.4byte DirectSoundData_horse1_t1_stone1_m2_13k8b, 0x00FF00FF, 0x00003C00, DirectSoundData_horse2_f1_stone1_m2_13k8b, 0x00FF00FF, 0x00003C00\n"
"\t.4byte DirectSoundData_horse2_b1_stone1_m2_13k8b, 0x00FF00FF, 0x00003C00, DirectSoundData_horse2_t1_stone1_m2_13k8b, 0x00FF00FF, 0x00003C00\n"
"\t.4byte DirectSoundData_horse3_f1_stone1_m2_13k8b, 0x00FF00FF, 0x00003C00, DirectSoundData_horse3_b1_stone1_m2_13k8b, 0x00FF00FF, 0x00003C00\n"
"\t.4byte DirectSoundData_horse3_t1_stone1_m2_13k8b, 0x00FF00FF\n"
);
