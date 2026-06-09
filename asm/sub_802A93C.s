	.syntax unified
	.set GetUnitSupportBonuses, 0x08028544 + 1
	.section .text.sub_802A93C, "ax", %progbits
@ sub_802A93C @ JP 0x0802A93C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802A93C
	.thumb_func
sub_802A93C:
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, _0802A9A8 @ =0x0203A4D0
	ldrh r1, [r0]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0802A956
	ldr r0, _0802A9AC @ =0x0202BCEC
	ldrb r0, [r0, #0x15]
	cmp r0, #0
	beq _0802A9A0
_0802A956:
	mov r4, sp
	adds r0, r5, #0
	mov r1, sp
	bl GetUnitSupportBonuses
	adds r2, r5, #0
	adds r2, #0x5a
	ldrb r1, [r4, #1]
	ldrh r0, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	adds r2, #2
	ldrb r1, [r4, #2]
	ldrh r0, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	adds r2, #4
	ldrb r1, [r4, #3]
	ldrh r0, [r2]
	adds r0, r0, r1
	strh r0, [r2]
	adds r1, r5, #0
	adds r1, #0x62
	ldrh r0, [r1]
	ldrb r2, [r4, #4]
	adds r0, r0, r2
	strh r0, [r1]
	adds r1, #4
	ldrh r0, [r1]
	ldrb r2, [r4, #5]
	adds r0, r0, r2
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r1]
	ldrb r4, [r4, #6]
	adds r0, r0, r4
	strh r0, [r1]
_0802A9A0:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802A9A8: .4byte 0x0203A4D0
_0802A9AC: .4byte 0x0202BCEC

