#include "global.h"
#include "proc.h"
#include "scene.h"
#include "bmlib.h"
#include "hardware.h"

extern u8 Img_TalkBubbleOpening_A[];
extern u8 Img_TalkBubbleOpening_B[];
extern u8 Img_TalkBubbleOpening_C[];
extern u8 Img_TalkBubbleOpening_D[];
extern u8 Img_TalkBubbleOpening_E[];
extern u8 Img_TalkBubble[];

void TalkBubbleOpen_OnIdle(struct Proc* proc) {
    const void * const imgList[] = {
        Img_TalkBubbleOpening_A,
        Img_TalkBubbleOpening_B,
        Img_TalkBubbleOpening_C,
        Img_TalkBubbleOpening_D,
        Img_TalkBubbleOpening_E,
        Img_TalkBubble,

        NULL,
    };

    if (proc->unk64++ & 1) {
        return;
    }

    Decompress(imgList[proc->unk64 >> 1], (void*)(GetBackgroundTileDataOffset(1) + 0x06000200));

    if (imgList[(proc->unk64 >> 1) + 1] == NULL) {
        Proc_Break(proc);
    }

    return;
}
