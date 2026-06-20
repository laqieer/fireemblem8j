#include "global.h"
#include "functions.h"
void StartUnitInventoryInfoWindow(void *);
void StartSubtitleHelp(void *, const char *);
void sub_80241D4(void *p) { StartUnitInventoryInfoWindow(p); StartSubtitleHelp(p, GetStringFromIndex(0x7EB)); }
