#include "global.h"
#include "hardware.h"
#include "proc.h"
#include "bmlib.h"
#include "bm.h"

struct Unk807F860Proc
{
    PROC_HEADER;
    /* 29 */ STRUCT_PAD(0x29, 0x40);
    /* 40 */ u16 unk40;
    /* 42 */ u16 unk42;
};

extern const u8 Gfx_807F860[];
extern const u16 Pal_807F860[];

extern void SetDefaultMapAnimScreenConf(void);

// JP-only screen/BG init wrapper (worldmap/ending asset bank).
void sub_807F860(struct Unk807F860Proc * proc)
{
    SetDefaultMapAnimScreenConf();
    BG_SetPosition(2, 0, 0);

    Decompress(Gfx_807F860, (void *)(GetBackgroundTileDataOffset(2) + 0x06002800));
    CopyToPaletteBuffer(Pal_807F860, 0x80, 0x20);
    SetBlendConfig(1, 0x10, 0x10, 0);

    proc->unk40 = 0;
    proc->unk42 = 0;

    EnablePaletteSync();
}
