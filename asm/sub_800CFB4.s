	.syntax unified
	.set EndFaceById, 0x08005660 + 1
	.set sub_80BD70C, 0x080BD70C + 1
	.set sub_80BEF48, 0x080BEF48 + 1
	.section .text.sub_800CFB4, "ax", %progbits
@ sub_800CFB4 @ JP 0x0800CFB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CFB4
	.thumb_func
sub_800CFB4:
	push {r4, lr}
	sub sp, #0xc
	ldr r1, [r0, #0x38]
	ldrh r2, [r1, #2]
	ldrh r4, [r1, #4]
	ldrh r3, [r1, #6]
	ldrh r0, [r0, #0x3c]
	lsrs r1, r0, #2
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0800CFD4
	adds r0, r2, #0
	bl EndFaceById
	b _0800CFF2
_0800CFD4:
	cmp r3, #0
	beq _0800CFEA
	str r1, [sp]
	str r1, [sp, #4]
	str r4, [sp, #8]
	adds r0, r3, #0
	movs r1, #7
	movs r3, #0
	bl sub_80BEF48
	b _0800CFF2
_0800CFEA:
	adds r1, r4, #0
	adds r0, r2, #0
	bl sub_80BD70C
_0800CFF2:
	movs r0, #0
	add sp, #0xc
	pop {r4}
	pop {r1}
	bx r1

