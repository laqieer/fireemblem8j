#include "global.h"

#include "fontgrp.h"
#include "hardware.h"
#include "ctc.h"
#include "bmlib.h"
#include "savemenu.h"

struct Proc8A21568 {
    /* 00 */ PROC_HEADER;

    /* 29 */ u8 pad[0x58-0x29];
    /* 58 */ int unk_58;
};

extern u16 gMenuMainObjs_4[]; // pal
extern u8 gMenuMainObjs_2[]; // gfx
extern u8 gMenuMainObjs_3[];

//! FE8U = 0x080B05C4
void ExtramenuUnk_DrawIconLoop(struct Proc8A21568* proc) {
    if (proc->unk_58 >= 0) {
        PutSpriteExt(4, 56, 8, Sprite_Savedraw_0, 0x2000);
        PutSpriteExt(4, 64, 16, SpriteArray_SavemenuData_0[proc->unk_58], 0x3000);
    }
    return;
}
