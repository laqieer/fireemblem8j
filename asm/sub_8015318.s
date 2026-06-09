	.syntax unified
	.set ClearSprites, 0x080052AC + 1
	.set Proc_Run, 0x08002DD4 + 1
	.set sub_800139C, 0x0800139C + 1
	.set sub_8005360, 0x08005360 + 1
	.set sub_80153A4, 0x080153A4 + 1
	.set sub_80D63D8, 0x080D63D8 + 1
	.section .text.sub_8015318, "ax", %progbits
@ sub_8015318 @ JP 0x08015318 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8015318
	.thumb_func
sub_8015318:
	push {r4, lr}
	ldr r0, _08015374 @ =0x085775CC
	ldr r0, [r0]
	bl sub_800139C
	bl ClearSprites
	ldr r4, _08015378 @ =0x02026A70
	ldr r0, [r4, #4]
	bl Proc_Run
	bl sub_80153A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0801533E
	ldr r0, [r4, #8]
	bl Proc_Run
_0801533E:
	ldr r0, [r4, #0xc]
	bl Proc_Run
	ldr r0, [r4, #0x14]
	bl Proc_Run
	movs r0, #0
	bl sub_8005360
	ldr r0, [r4, #0x10]
	bl Proc_Run
	movs r0, #0xd
	bl sub_8005360
	ldr r1, _0801537C @ =0x0202BCAC
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08015380 @ =0x04000006
	ldrh r0, [r0]
	strh r0, [r1, #6]
	bl sub_80D63D8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08015374: .4byte 0x085775CC
_08015378: .4byte 0x02026A70
_0801537C: .4byte 0x0202BCAC
_08015380: .4byte 0x04000006

