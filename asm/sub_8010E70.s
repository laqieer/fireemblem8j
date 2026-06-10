	.syntax unified
	.set sub_800BF3C, 0x0800BF3C + 1
	.set sub_8012DB4, 0x08012DB4 + 1
	.section .text.sub_8010E70, "ax", %progbits
@ sub_8010E70 @ JP 0x08010E70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8010E70
	.thumb_func
sub_8010E70:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08010E84
	movs r0, #0
	b _08010E9E
_08010E84:
	ldr r0, [r4, #0x38]
	movs r1, #2
	ldrsh r0, [r0, r1]
	bl sub_800BF3C
	cmp r0, #0
	beq _08010E9C
	adds r1, r4, #0
	bl sub_8012DB4
	movs r0, #2
	b _08010E9E
_08010E9C:
	movs r0, #6
_08010E9E:
	pop {r4}
	pop {r1}
	bx r1

