#include "global.h"
#include "proc.h"
#include "soundwrapper.h"

extern u8 data_085775CC[];
void sub_80BCE68(void *proc) {
    void *o = *(void **)data_085775CC;
    if (*(u16 *)((char *)o + 8) & 0xb) { Sound_FadeOutBGM(-1); Proc_Break(proc); }
}
