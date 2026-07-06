/* Hand-profiled CBMC harness for m2c-trust Bridge A: sub_80A3300.
 * Observable: ordered PutSpriteExt call trace. No modeled mutable globals are written.
 */
typedef unsigned char u8; typedef signed short s16; typedef int s32;
int nondet_int(void); unsigned char nondet_uchar(void);
#define ASSUME(x) __CPROVER_assume(x)
#define ASSERT(x,m) __CPROVER_assert((x),(m))
struct P { u8 rowCounts[5]; u8 unk3B; u8 unk3E; s16 spriteX; s16 spriteY; };
static s32 gUnk_08A95478[256];
static int call_count_i, call_count_r;
static int tr_layer[1400], tr_x[1400], tr_y[1400], tr_obj[1400], tr_attr[1400];
static void impl_PutSpriteExt(int layer,int x,int y,s32 obj,int attr){int n=call_count_i++; ASSUME(n<1400); tr_layer[n]=layer; tr_x[n]=x; tr_y[n]=y; tr_obj[n]=obj; tr_attr[n]=attr;}
static void ref_PutSpriteExt(int layer,int x,int y,s32 obj,int attr){int n=call_count_r++; ASSUME(n<1400); ASSERT(n<call_count_i,"ref call order in range"); ASSERT(tr_layer[n]==layer,"layer"); ASSERT(tr_x[n]==x,"x"); ASSERT(tr_y[n]==y,"y"); ASSERT(tr_obj[n]==obj,"obj"); ASSERT(tr_attr[n]==attr,"attr");}
static void impl_sub_80A3300(struct P *proc){int i,col,x,y,xr; if(proc->unk3B==0) return; for(i=0;i<=4;i++){ if(proc->rowCounts[i]!=0xFF){ col=proc->spriteX+0x34; x=col&0x1FF; y=proc->spriteY+(i<<4); y=(y+0x19)&0xFF; for(col=0,xr=x; col<=proc->rowCounts[i]; col++){ impl_PutSpriteExt(13,xr,y,gUnk_08A95478[col],0xF380); xr+=0xA; } } } if(proc->unk3E!=0) impl_PutSpriteExt(13,(proc->spriteX+0xC0)&0x1FF,(proc->spriteY+0x1C)&0xFF,gUnk_08A95478[0],0xF380);}
static void ref_sub_80A3300(struct P *arg0){u8 *sp4; s32 var_r4; s32 var_r5; s32 var_r8; u8 *temp_r3; u8 temp_r6; u8 *temp_r1; if(arg0->unk3B!=0){var_r8=0; temp_r1=&arg0->rowCounts[0]; sp4=&arg0->unk3E; do{temp_r3=temp_r1+var_r8; if(*temp_r3!=0xFF){temp_r6=arg0->spriteY+((var_r8*0x10)+0x19); var_r5=0; if((s32)*temp_r3>=0){var_r4=(arg0->spriteX+0x34)&0x1FF; do{ref_PutSpriteExt(0xD,var_r4,temp_r6,gUnk_08A95478[var_r5],0xF380); var_r4+=0xA; var_r5+=1;}while(var_r5 <= (s32)*(temp_r1+var_r8));}} var_r8+=1;}while(var_r8<=4); if(*sp4!=0){ref_PutSpriteExt(0xD,(arg0->spriteX+0xC0)&0x1FF,(u8)(arg0->spriteY+0x1C),gUnk_08A95478[0],0xF380);}}}
int main(void){struct P p; unsigned i; for(i=0;i<5;i++) p.rowCounts[i]=nondet_uchar(); p.unk3B=nondet_uchar(); p.unk3E=nondet_uchar(); p.spriteX=nondet_int(); p.spriteY=nondet_int(); for(i=0;i<256;i++) gUnk_08A95478[i]=nondet_int(); impl_sub_80A3300(&p); ref_sub_80A3300(&p); ASSERT(call_count_i==call_count_r,"same call count"); return 0;}
