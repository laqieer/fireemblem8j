#include "global.h"

/* Migrated from asm/data_08BB8E94.s (newlib malloc-region data (NOT graphics: not tile-aligned, JP-divergent); head 0x3C lib-linked).
 * Head shrunk by 0x3C (0x08BB8E94-0x08BB8ED0): those 60 bytes are the newlib
 * malloc globals (__malloc_trim_threshold/__malloc_top_pad/__malloc_sbrk_base/
 * __malloc_max_sbrked_mem/__malloc_max_total_mem/__malloc_current_mallinfo), now
 * provided by the lib-linked mallocr.o(.data). See D289.
 */

u8 data_08BB8ED0[] __attribute__((section(".data.residue.08BB8E94"))) = INCBIN_U8("data/residual/data_08BB8ED0.bin");
