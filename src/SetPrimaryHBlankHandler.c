#include "global.h"
#include "proc.h"
#include "bm.h"
#include "ctc.h"
#include "hardware.h"

extern void (*sHBlankHandler1)(void);
extern void (*sHBlankHandler2)(void);

void SetPrimaryHBlankHandler(void (*hblankHandler)(void))
{
    sHBlankHandler1 = hblankHandler;
    UpdateHBlankHandlerState();
}
