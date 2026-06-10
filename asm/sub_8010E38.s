	.syntax unified
	.set sub_800BF3C, 0x0800BF3C + 1
	.set sub_80831DC, 0x080831DC + 1
	.section .text.sub_8010E38, "ax", %progbits
@ sub_8010E38 @ JP 0x08010E38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8010E38
	.thumb_func
sub_8010E38:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08010E4C
	movs r0, #0
	b _08010E68
_08010E4C:
	ldr r0, [r4, #0x38]
	movs r1, #2
	ldrsh r0, [r0, r1]
	bl sub_800BF3C
	adds r1, r0, #0
	cmp r1, #0
	beq _08010E66
	adds r0, r4, #0
	bl sub_80831DC
	movs r0, #2
	b _08010E68
_08010E66:
	movs r0, #6
_08010E68:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

