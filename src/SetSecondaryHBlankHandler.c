#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

extern void (*sHBlankHandler1)(void);
extern void (*sHBlankHandler2)(void);

void SetSecondaryHBlankHandler(void (*hblankHandler)(void))
{
    sHBlankHandler2 = hblankHandler;
    UpdateHBlankHandlerState();
}
