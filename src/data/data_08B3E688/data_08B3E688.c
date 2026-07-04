#include "global.h"

/* Wave47: this is the OpSubtitle_02 TSA tilemap (gTsa_OpSubtitle_02) — the
 * missing 02 of the gTsa_OpSubtitle_00/01/_/03/04/05 sequence, referenced by
 * frontier_df4_voice.c's subtitle asset table. Decomposed from the raw JP-LZ
 * blob into the decompressed 30x20 TSA tilemap graphics/misc_gfx2/gTsa_OpSubtitle_02.bin
 * (committed) which the %.lz rule recompresses byte-exact (gbagfx default -mindist).
 * Symbol/section/placement kept identical for the external reference.
 */

u8 gTsa_OpSubtitle_02[] __attribute__((section(".data.residue.08B3E688"))) = INCBIN_U8("graphics/misc_gfx2/gTsa_OpSubtitle_02.bin.lz");
