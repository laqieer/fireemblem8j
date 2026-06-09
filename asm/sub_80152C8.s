	.syntax unified
	.set FlushLCDControl, 0x08000E4C + 1
	.set IncrementGameClock, 0x08000CF0 + 1
	.set Proc_Run, 0x08002DD4 + 1
	.set m4aSoundMain, 0x080D4EE8 + 1
	.set m4aSoundVSync, 0x080D4814 + 1
	.set sub_80010FC, 0x080010FC + 1
	.set sub_8001FD8, 0x08001FD8 + 1
	.set sub_8002088, 0x08002088 + 1
	.set sub_80020CC, 0x080020CC + 1
	.section .text.sub_80152C8, "ax", %progbits
@ sub_80152C8 @ JP 0x080152C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80152C8
	.thumb_func
sub_80152C8:
	push {lr}
	ldr r1, _0801530C @ =0x03007FF8
	movs r0, #1
	strh r0, [r1]
	bl IncrementGameClock
	bl m4aSoundVSync
	ldr r0, _08015310 @ =0x02026A70
	ldr r0, [r0]
	bl Proc_Run
	bl sub_80020CC
	ldr r1, _08015314 @ =0x0202BCAC
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08015302
	movs r0, #0
	strb r0, [r1]
	bl FlushLCDControl
	bl sub_80010FC
	bl sub_8001FD8
	bl sub_8002088
_08015302:
	bl m4aSoundMain
	pop {r0}
	bx r0
	.align 2, 0
_0801530C: .4byte 0x03007FF8
_08015310: .4byte 0x02026A70
_08015314: .4byte 0x0202BCAC

