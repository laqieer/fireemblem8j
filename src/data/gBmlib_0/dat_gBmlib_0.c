#include "global.h"
#include "proc.h"
#include "bmlib.h"

struct FadeKindEnt {
    ProcPtr (* spawn_proc)(const struct ProcCmd* script, ProcPtr parent);
    void (* setup_color_fade)(u8 component_step);
    int unit;
};

extern ProcPtr Proc_Start(const struct ProcCmd*, ProcPtr);
extern ProcPtr Proc_StartBlocking(const struct ProcCmd*, ProcPtr);
extern void ColorFadeSetupFromBlack(u8);
extern void ColorFadeSetupFromColorToBlack(u8);
extern void ColorFadeSetupFromWhite(u8);
extern void ColorFadeSetupFromColorToWhite(u8);

struct FadeKindEnt const gBmlib_0[] __attribute__((section(".rodata.dat_gBmlib_0"))) = {
    { Proc_Start,         ColorFadeSetupFromBlack,        +1 },
    { Proc_Start,         ColorFadeSetupFromColorToBlack, -1 },
    { Proc_StartBlocking, ColorFadeSetupFromBlack,        +1 },
    { Proc_StartBlocking, ColorFadeSetupFromColorToBlack, -1 },
    { Proc_Start,         ColorFadeSetupFromWhite,        -1 },
    { Proc_Start,         ColorFadeSetupFromColorToWhite, +1 },
    { Proc_StartBlocking, ColorFadeSetupFromWhite,        -1 },
    { Proc_StartBlocking, ColorFadeSetupFromColorToWhite, +1 },
};
