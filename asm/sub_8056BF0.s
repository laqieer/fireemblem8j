	.syntax unified
	.set AnimUpdateAll, 0x08004D48 + 1
	.set ClearSprites, 0x080052AC + 1
	.set Proc_Run, 0x08002DD4 + 1
	.set sub_800139C, 0x0800139C + 1
	.set sub_8005360, 0x08005360 + 1
	.set sub_80153A4, 0x080153A4 + 1
	.set sub_80599F8, 0x080599F8 + 1
	.set sub_80D63D8, 0x080D63D8 + 1
	.section .text.sub_8056BF0, "ax", %progbits
@ sub_8056BF0 @ JP 0x08056BF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8056BF0
	.thumb_func
sub_8056BF0:
	push {r4, lr}
	ldr r0, _08056C54 @ =0x085775CC
	ldr r0, [r0]
	bl sub_800139C
	bl ClearSprites
	ldr r4, _08056C58 @ =0x02026A70
	ldr r0, [r4, #4]
	bl Proc_Run
	bl sub_80153A4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08056C16
	ldr r0, [r4, #8]
	bl Proc_Run
_08056C16:
	ldr r0, [r4, #0xc]
	bl Proc_Run
	ldr r0, [r4, #0x14]
	bl Proc_Run
	movs r0, #0
	bl sub_8005360
	ldr r0, [r4, #0x10]
	bl Proc_Run
	bl AnimUpdateAll
	bl sub_80599F8
	movs r0, #0xd
	bl sub_8005360
	ldr r1, _08056C5C @ =0x0202BCAC
	movs r0, #1
	strb r0, [r1]
	ldr r0, _08056C60 @ =0x04000006
	ldrh r0, [r0]
	strh r0, [r1, #6]
	bl sub_80D63D8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08056C54: .4byte 0x085775CC
_08056C58: .4byte 0x02026A70
_08056C5C: .4byte 0x0202BCAC
_08056C60: .4byte 0x04000006

