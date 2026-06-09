	.syntax unified
	.set GetUnitItemSlot, 0x08016DD4 + 1
	.section .text.sub_8085D90, "ax", %progbits
@ sub_8085D90 @ JP 0x08085D90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8085D90
	.thumb_func
sub_8085D90:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r5, [r4]
	ldrb r1, [r5, #8]
	ldrb r2, [r5, #9]
	ldrh r6, [r5, #0xa]
	movs r0, #0x18
	ldrsb r0, [r4, r0]
	cmp r1, r0
	bne _08085DD4
	movs r0, #0x19
	ldrsb r0, [r4, r0]
	cmp r2, r0
	bne _08085DD4
	cmp r6, #0x18
	bne _08085DC2
	ldr r0, _08085DD0 @ =0x03004DF0
	ldr r0, [r0]
	movs r1, #0x72
	bl GetUnitItemSlot
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _08085DD4
_08085DC2:
	ldr r0, [r5, #4]
	str r0, [r4, #4]
	ldrh r0, [r5, #2]
	str r0, [r4, #8]
	str r6, [r4, #0xc]
	movs r0, #1
	b _08085DD6
	.align 2, 0
_08085DD0: .4byte 0x03004DF0
_08085DD4:
	movs r0, #0
_08085DD6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

