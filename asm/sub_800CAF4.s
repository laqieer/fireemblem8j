	.syntax unified
	.set sub_80C81F4, 0x080C81F4 + 1
	.set sub_80C823C, 0x080C823C + 1
	.section .text.sub_800CAF4, "ax", %progbits
@ sub_800CAF4 @ JP 0x0800CAF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CAF4
	.thumb_func
sub_800CAF4:
	push {r4, lr}
	ldr r1, [r0, #0x38]
	movs r2, #4
	ldrsh r4, [r1, r2]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800CB1E
	adds r0, r4, #0
	bl sub_80C823C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800CB1A
	adds r0, r4, #0
	bl sub_80C81F4
_0800CB1A:
	movs r0, #0
	b _0800CB30
_0800CB1E:
	adds r0, r4, #0
	bl sub_80C823C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800CB2E
	movs r0, #3
	b _0800CB30
_0800CB2E:
	movs r0, #2
_0800CB30:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

