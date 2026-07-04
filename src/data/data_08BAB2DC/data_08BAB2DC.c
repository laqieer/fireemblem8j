#include "global.h"

/* Wave47: this is the Tsa_GameIntroNintendo TSA tilemap (the "Nintendo" game-intro
 * logo tilemap; an ABS baseline alias Tsa_GameIntroNintendo sits at this address).
 * Decomposed from the raw JP-LZ blob into the decompressed 30x20 TSA tilemap
 * graphics/misc_gfx2/Tsa_GameIntroNintendo.bin (committed) which the %.lz rule
 * recompresses byte-exact (gbagfx default -mindist). Symbol/section/placement kept.
 */

u8 Tsa_GameIntroNintendo[] __attribute__((section(".data.residue.08BAB2DC"))) = INCBIN_U8("graphics/misc_gfx2/Tsa_GameIntroNintendo.bin.lz");
