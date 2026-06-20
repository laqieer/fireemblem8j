#include "global.h"
#include "proc.h"
#include "soundwrapper.h"
void sub_80BCE68(void *proc) {
    void *o = *(void **)0x085775CC;
    if (*(u16 *)((char *)o + 8) & 0xb) { Sound_FadeOutBGM(-1); Proc_Break(proc); }
}
