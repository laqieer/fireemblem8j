	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_806C7F0, "ax", %progbits
@ sub_806C7F0 @ JP 0x0806C7F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806C7F0
	.thumb_func
sub_806C7F0:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0806C844 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806C848 @ =0x08602EE4
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0806C84C @ =0x080E421C
	str r0, [r5, #0x48]
	ldr r0, _0806C850 @ =0x08602EC4
	str r0, [r5, #0x4c]
	ldr r0, _0806C854 @ =0x086E2624
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	ldr r0, _0806C858 @ =0x086E2A84
	movs r1, #0x20
	bl sub_80567E0
	ldr r0, _0806C85C @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0806C870
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806C860
	movs r0, #1
	movs r1, #0x18
	b _0806C864
	.align 2, 0
_0806C844: .4byte 0x0201774C
_0806C848: .4byte 0x08602EE4
_0806C84C: .4byte 0x080E421C
_0806C850: .4byte 0x08602EC4
_0806C854: .4byte 0x086E2624
_0806C858: .4byte 0x086E2A84
_0806C85C: .4byte 0x0203E11C
_0806C860:
	ldr r1, _0806C86C @ =0x0000FFE8
	movs r0, #1
_0806C864:
	movs r2, #0
	bl BG_SetPosition
	b _0806C87A
	.align 2, 0
_0806C86C: .4byte 0x0000FFE8
_0806C870:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_0806C87A:
	bl sub_8056158
	pop {r4, r5}
	pop {r0}
	bx r0

