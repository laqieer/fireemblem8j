#include "global.h"
#include "proc.h"
#include "cgtext.h"
#include "prepscreen.h"
#include "face.h"
#include "sysutil.h"
#include "hardware.h"
void sub_80A4544(ProcPtr proc) {
    EndCgText();
    EndAllProcChildren(proc);
    EndMuralBackground_();
    EndFaceById(0);
    SetPrimaryHBlankHandler(0);
}
