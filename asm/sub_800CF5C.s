	.syntax unified
	.set sub_80BD594, 0x080BD594 + 1
	.set sub_80BEF48, 0x080BEF48 + 1
	.section .text.sub_800CF5C, "ax", %progbits
@ sub_800CF5C @ JP 0x0800CF5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CF5C
	.thumb_func
sub_800CF5C:
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r1, [r0, #0x38]
	movs r2, #4
	ldrsh r4, [r1, r2]
	movs r6, #6
	ldrsh r5, [r1, r6]
	movs r2, #8
	ldrsh r3, [r1, r2]
	movs r6, #0xa
	ldrsh r2, [r1, r6]
	ldrh r0, [r0, #0x3c]
	lsrs r1, r0, #2
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _0800CFA2
	cmp r2, #0
	beq _0800CF96
	str r1, [sp]
	str r1, [sp, #4]
	str r3, [sp, #8]
	adds r0, r2, #0
	movs r1, #6
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_80BEF48
	b _0800CFA2
_0800CF96:
	lsls r2, r3, #0x10
	lsrs r2, r2, #0x10
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80BD594
_0800CFA2:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1

