	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set sub_80253F0, 0x080253F0 + 1
	.section .text.sub_80228D8, "ax", %progbits
@ sub_80228D8 @ JP 0x080228D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80228D8
	.thumb_func
sub_80228D8:
	push {lr}
	ldr r0, _08022904 @ =0x03004DF0
	ldr r2, [r0]
	ldr r1, [r2, #0xc]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022908
	movs r0, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08022908
	adds r0, r2, #0
	bl sub_80253F0
	bl GetSelectTargetCount
	cmp r0, #0
	beq _08022908
	movs r0, #1
	b _0802290A
	.align 2, 0
_08022904: .4byte 0x03004DF0
_08022908:
	movs r0, #3
_0802290A:
	pop {r1}
	bx r1
	.align 2, 0

