/* #143 shiftability repro: R-on-map stat-screen crash (comment #33, bug 2).
 *
 * Deterministic libmgba A/B harness. Boots a save, drives the cursor onto a unit
 * on the chapter map, presses R to open the unit stat screen, then cycles pages
 * (R/L) while dumping framebuffer FNV hashes and hooking illegal opcodes.
 *
 * On the +0x40000 shifted ROM (build via scripts/shiftcheck/build_shifted_rom.sh)
 * this used to jump into gMUGfxBuffer and crash (hit=1, hitpc in IWRAM) because a
 * raw stat-screen page-function pointer table (DisplayPage0/1/2 in
 * src/data/frontier_df4_misc_lo/frontier_df4_misc_lo.c) was un-relocatable. After
 * symbolizing that table, vanilla and shifted framehashes match exactly (hit=0).
 *
 * Build: cc scripts/shiftcheck/repro_stats_r.c -o /path/repro -lmgba
 * Run:   ./repro <rom.gba> [cursorX cursorY]   (defaults 4 4)
 * A/B:   diff <(./repro fireemblem8.gba|grep FRAMEHASH) \
 *             <(./repro shifted.gba   |grep FRAMEHASH)   # empty == pass
 */
#include <mgba/core/core.h>
#include <mgba/internal/gba/gba.h>
#include <mgba/internal/arm/arm.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
enum{K_A=1<<0,K_B=1<<1,K_SELECT=1<<2,K_START=1<<3,K_RIGHT=1<<4,K_LEFT=1<<5,K_UP=1<<6,K_DOWN=1<<7,K_R=1<<8,K_L=1<<9};
static struct ARMCore* cpu; static int hit=0; static uint32_t hitop, hitpc; static color_t* vid; static unsigned vw,vh;
static uint32_t v32(uint32_t a){return GBAView32(cpu,a);} static uint16_t v16(uint32_t a){return GBAView16(cpu,a);} static uint8_t v8(uint32_t a){return GBAView8(cpu,a);}
static int16_t s16(uint32_t a){return (int16_t)v16(a);}
static uint32_t hitregs[16];
static void illegal(struct ARMCore*c,uint32_t op){hit=1;hitop=op;hitpc=(uint32_t)c->gprs[ARM_PC]-(c->executionMode==MODE_THUMB?4:8); for(int i=0;i<16;i++)hitregs[i]=(uint32_t)c->gprs[i];}
static uint32_t boot_keys(int f){ if(f<120)return 0; int p=(f-120)%27; if(p==0||p==2||p==6)return K_START; if(p==1||p==3||p==5)return K_A; if(p==4)return K_B; return 0; }
static int cx(){return s16(0x0202bcac+0x14);} static int cy(){return s16(0x0202bcac+0x16);} static int lock(){return v8(0x0202bcac+1);} static uint32_t active(){return v32(0x03004df0);}
static uint32_t pc(){return (uint32_t)cpu->gprs[ARM_PC]-(cpu->executionMode==MODE_THUMB?4:8);}
static int units_loaded(){uint32_t mu=v32(0x0202e4d4); if(!mu) return 0; uint32_t row4=v32(mu+4*4), row5=v32(mu+4*5); return row4 && row5 && v8(row4+4)==1 && v8(row5+9)==2;}
static uint32_t move_towards(int tx,int ty){ if(cx()<tx)return K_RIGHT; if(cx()>tx)return K_LEFT; if(cy()<ty)return K_DOWN; if(cy()>ty)return K_UP; return 0; }
static void dump(int f,int phase,const char* note){ fprintf(stdout,"F %05d phase=%d %-12s pc=%08X lock=%d cur=(%d,%d) active=%08X hit=%d\n",f,phase,note,pc(),lock(),cx(),cy(),active(),hit); fflush(stdout); }
static void hash_frame(int f){ uint32_t h=2166136261u; for(unsigned i=0;i<vw*vh;i++){ h^=(uint32_t)vid[i]; h*=16777619u; } printf("FRAMEHASH f=%d fnv=%08X\n",f,h); fflush(stdout); }
int main(int argc,char**argv){ if(argc<2){fprintf(stderr,"usage: %s rom.gba\n",argv[0]); return 2;}
 int tx=4,ty=4; if(argc>=4){tx=atoi(argv[2]); ty=atoi(argv[3]);}
 struct mCore* core=mCoreFind(argv[1]); core->init(core); mCoreInitConfig(core,NULL); if(!mCoreLoadFile(core,argv[1])) return 2; core->desiredVideoDimensions(core,&vw,&vh); vid=calloc((size_t)vw*vh,sizeof(color_t)); core->setVideoBuffer(core,vid,vw); core->reset(core); struct GBA* gba=(struct GBA*)core->board; cpu=gba->cpu; cpu->irqh.hitIllegal=illegal;
 int phase=0, wait=0, stable=-1; uint32_t key=0; const char* note="boot"; int rframe=-1;
 for(int f=0; f<12000 && !hit; f++){
   key=0; note="";
   if(phase==0){ key=boot_keys(f); note="boot"; if(units_loaded() && f>3000){phase=1; wait=30; dump(f,phase,"map-ready");}}
   else if(wait>0){ wait--; note="wait"; }
   else if(phase==1){ uint32_t m=move_towards(tx,ty); if(!m){phase=2; wait=30; dump(f,phase,"at-unit");} else if(!lock()){key=m; wait=10; note="move-unit";} }
   else if(phase==2){ /* press R to open stats */ key=K_R; phase=3; wait=1; rframe=f; dump(f,phase,"press-R"); }
   else if(phase==3){ /* hold nothing, let stats open; run for a while */ if(wait==0){phase=4; wait=600; dump(f,phase,"stats-open");} }
   else if(phase==4){ if(wait==0){phase=5; dump(f,phase,"stats-settled");} }
   else { note="watch"; if((f%60)==0) key=K_R; else if((f%60)==20) key=K_L; }
   core->setKeys(core,key); core->runFrame(core);
   if(phase!=stable){ dump(f,phase,note); stable=phase; }
   if(rframe>=0 && f>rframe && (f-rframe)%120==0) hash_frame(f);
 }
 printf("RESULT hit=%d hitpc=%08X op=%08X final_phase=%d pc=%08X cur=(%d,%d) active=%08X rframe=%d\n",hit,hitpc,hitop,phase,pc(),cx(),cy(),active(),rframe);
 if(hit){ for(int i=0;i<16;i++) printf("R%02d=%08X%s",i,hitregs[i],(i%4==3)?"\n":" "); }
 core->deinit(core); free(vid); return hit?1:0; }
