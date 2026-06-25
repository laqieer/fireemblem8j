/* The JP build promotes the fade-step argument as a wider (declaration-order)
 * value, scheduling the gPaletteBuffer base load ahead of the argument's
 * extension. agbcc only reproduces that ordering when this TU compiles the
 * parameter as `short` rather than the shared hardware.h `u8` prototype. To
 * match JP codegen without editing the shared header, hide that one prototype
 * for this TU only: rename it via a macro across the global.h/hardware.h
 * include, then restore the real name for our own `short` declaration and
 * definition below. */
#define ColorFadeSetupFromColorToBlack ColorFadeSetupFromColorToBlack_u8_proto_hidden
#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"
#undef ColorFadeSetupFromColorToBlack

void ColorFadeSetupFromColorToBlack(short a)
{
    int i;
    int j;
    u8 new_var;

    for (i = 31; i >= 0; i--)
    {
        new_var = a;
        gFadeComponentStep[i] = new_var;
        for (j = 0; j < 16; j++)
        {
            gFadeComponents[(i * 16 + j) * 3 + 0] = RED_VALUE(gPaletteBuffer[i * 16 + j]) + 32;
            gFadeComponents[(i * 16 + j) * 3 + 1] = GREEN_VALUE(gPaletteBuffer[i * 16 + j]) + 32;
            gFadeComponents[(i * 16 + j) * 3 + 2] = BLUE_VALUE(gPaletteBuffer[i * 16 + j]) + 32;
        }
    }
}
