#include "global.h"
#include "proc.h"

extern const u8 data_085C66D8[];
void InitSubtitleHelpText(void); void BlankTilesetConfigTiles(void);
void sub_803581C(void *p) {
    void *q = Proc_StartBlocking((const struct ProcCmd *)data_085C66D8, (ProcPtr)p);
    *(int *)((char *)q + 0x2c) = 0;
    InitSubtitleHelpText();
    BlankTilesetConfigTiles();
    { u16 *m = (u16 *)0x0202BCAC; m[0x15] += 0x10; }
}
