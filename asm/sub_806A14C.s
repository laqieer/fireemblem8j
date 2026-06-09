	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set Proc_End, 0x08002CBC + 1
	.set __modsi3, 0x080D6690 + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056214, 0x08056214 + 1
	.set sub_8056708, 0x08056708 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_8056890, 0x08056890 + 1
	.section .text.sub_806A14C, "ax", %progbits
@ sub_806A14C @ JP 0x0806A14C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806A14C
	.thumb_func
sub_806A14C:
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r1, #0x32
	ldrsh r0, [r4, r1]
	adds r0, #4
	movs r1, #0xf0
	bl __modsi3
	strh r0, [r4, #0x32]
	ldrh r1, [r4, #0x32]
	movs r0, #1
	movs r2, #0
	bl BG_SetPosition
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _0806A1A0
	ldr r1, [r4, #0x4c]
	ldr r5, [r4, #0x54]
	ldr r0, [r4, #0x5c]
	lsls r4, r2, #2
	adds r1, r4, r1
	ldr r1, [r1]
	movs r2, #0x20
	movs r3, #0x14
	bl sub_8056708
	adds r4, r4, r5
	ldr r0, [r4]
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	b _0806A1BE
_0806A1A0:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	bne _0806A1BE
	bl sub_8056130
	ldr r1, _0806A1C4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bl sub_8056214
	adds r0, r4, #0
	bl Proc_End
_0806A1BE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806A1C4: .4byte 0x0201774C

