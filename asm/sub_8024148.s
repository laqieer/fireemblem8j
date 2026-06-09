	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set sub_8025BA4, 0x08025BA4 + 1
	.section .text.sub_8024148, "ax", %progbits
@ sub_8024148 @ JP 0x08024148 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024148
	.thumb_func
sub_8024148:
	push {r4, lr}
	ldr r4, _0802417C @ =0x03004DF0
	ldr r2, [r4]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08024178
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08024178
	adds r0, r2, #0
	bl sub_8025BA4
	bl GetSelectTargetCount
	cmp r0, #0
	bne _08024180
_08024178:
	movs r0, #3
	b _08024190
	.align 2, 0
_0802417C: .4byte 0x03004DF0
_08024180:
	ldr r0, [r4]
	bl GetUnitItemCount
	cmp r0, #5
	beq _0802418E
	movs r0, #1
	b _08024190
_0802418E:
	movs r0, #2
_08024190:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

