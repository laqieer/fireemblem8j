#include "global.h"
#include "proc.h"
void GmapRm_SetPosition(int x, int y) {
    int xx = (s16)x;
    int yy = (s16)y;
    char * q;
    ProcPtr p = Proc_Find((const struct ProcCmd *)0x08AC2510);
    int b;
    int a;
    if (p) {
        a = xx;
        q = (char *)p;
        do {
            b = yy;
            *((s16 *)(q + 0x2e)) = a;
        } while (0);
        *((s16 *)(q + 0x30)) = b;
    }
}
