	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set sub_8025364, 0x08025364 + 1
	.section .text.sub_802286C, "ax", %progbits
@ sub_802286C @ JP 0x0802286C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802286C
	.thumb_func
sub_802286C:
	push {lr}
	ldr r0, _08022898 @ =0x03004DF0
	ldr r2, [r0]
	ldr r1, [r2, #0xc]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0802289C
	movs r0, #0x81
	lsls r0, r0, #4
	ands r1, r0
	cmp r1, #0
	bne _0802289C
	adds r0, r2, #0
	bl sub_8025364
	bl GetSelectTargetCount
	cmp r0, #0
	beq _0802289C
	movs r0, #1
	b _0802289E
	.align 2, 0
_08022898: .4byte 0x03004DF0
_0802289C:
	movs r0, #3
_0802289E:
	pop {r1}
	bx r1
	.align 2, 0

