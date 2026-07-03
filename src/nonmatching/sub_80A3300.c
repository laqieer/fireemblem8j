/* NON_MATCHING: byte source is asm/sub_80A3300.s @ JP 0x080A3300 (JP-unique augury/
 * divination rank-sprite OAM emitter; no fe8u twin). This C DOCUMENTS the reconstruction
 * and is NOT in make-compare: compiled only by `make nonmatching`; the carved_rom row
 * still points at asm/sub_80A3300.o so the shipped bytes come from asm.
 *
 * Residual = agbcc reg-coloring tie-break (same class as sibling src/nonmatching/sub_80A2E64.c).
 * Status: canon-diff 27 (of 106 insns), permuter score 285 (from base 1850). The hard spill
 * barrier IS cracked here — see `(new_var = gUnk_08A95478)[col]` below, which defeats agbcc's
 * GCSE-hoist + strength-reduction of the gUnk base and forces per-iteration pool
 * rematerialisation (matching the oracle's `ldr rN,=0x08A95478` each inner iteration), so the
 * function no longer spills i+1 to the stack (`sub sp,#8` not `#12`).
 *
 * The ONLY remaining diff is a stubborn call-saved register swap in the inner loop:
 *   oracle: xr=r4, col=r5   |   agbcc-here: col=r4, xr=r5
 * This cascades ~10 insns (the x-base scratch reg, the xr copy `adds r4,r2,#0`, the y
 * `adds #25` scheduling, and a trailing 2-byte `.short` pool slot). It resists every
 * in-domain lever tried: register pins (`register T asm("rN")` -> worse, 33), decl-order,
 * for-init order (col-first vs xr-first), pulling `xr=x` out of the for-init, and dropping
 * the explicit xr (agbcc then won't emit the r2->r4 copy). Per-TU flags (-fno-gcse etc.)
 * rotate other regs without reaching 0 and are out of the carve's file domain anyway.
 *
 * Graduate: let tools/decomp-permuter grind from this seed (it is descending), or hand off
 * to decomp.me scratch `UbRNK` when network is available, then move to src/, add the
 * carved_rom.d handdecomp row + gUnk_08A95478 data alias, drop asm/. */
// sub_80A3300: JP-only divination/augury rank-sprite OAM emitter for DivinationSpriteProc.
// Reconstructed from asm/sub_80A3300.s (verified vs the ldrsh/ands/pool-load mnemonics).
// gUnk_08A95478 needs a data-split at 0x08A95478 for the real carve (shared with sub_80A2E64);
// here it is an extern const u16*const[] alias.
#include "global.h"
#include "proc.h"
#include "ctc.h"
#include "hardware.h"

extern const u16 *const gUnk_08A95478[];

struct DivinationSpriteProc
{
    /* 00 */ PROC_HEADER;
    /* 2C */ int unk2C;
    STRUCT_PAD(0x30, 0x34);
    /* 34 */ u8 rowCounts[5];
    STRUCT_PAD(0x39, 0x3B);
    /* 3B */ u8 unk3B;
    STRUCT_PAD(0x3C, 0x3E);
    /* 3E */ u8 unk3E;
    STRUCT_PAD(0x3F, 0x52);
    /* 52 */ s16 spriteX;
    /* 54 */ s16 spriteY;
};

void sub_80A3300(struct DivinationSpriteProc * proc)
{
    int i;
    int col;
    int x;
    int y;
    int xr;
    const u16 *const *new_var;

    if (proc->unk3B == 0)
        return;

    for (i = 0; i <= 4; i++)
    {
        if (proc->rowCounts[i] != 0xFF)
        {
            /* col is reused as an x-base scratch (near-match form) before the inner loop */
            col = proc->spriteX + 0x34;
            x = col & 0x1FF;
            y = proc->spriteY + (i << 4);
            y = (y + 0x19) & 0xFF;

            for (col = 0, xr = x; col <= proc->rowCounts[i]; col++)
            {
                PutSpriteExt(13, xr, y, (new_var = gUnk_08A95478)[col], 0xF380);
                xr += 0xA;
            }
        }
    }

    if (proc->unk3E != 0)
        PutSpriteExt(13, (proc->spriteX + 0xC0) & 0x1FF,
                     (proc->spriteY + 0x1C) & 0xFF,
                     gUnk_08A95478[0], 0xF380);
}
