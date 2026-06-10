	.syntax unified
	.set sub_80C7D78, 0x080C7D78 + 1
	.section .text.sub_800CD70, "ax", %progbits
@ sub_800CD70 @ JP 0x0800CD70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CD70
	.thumb_func
sub_800CD70:
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r1, [r0, #0x38]
	movs r2, #4
	ldrsh r3, [r1, r2]
	movs r2, #6
	ldrsh r4, [r1, r2]
	movs r2, #8
	ldrsh r5, [r1, r2]
	movs r2, #0xa
	ldrsh r6, [r1, r2]
	ldr r2, [r1, #0xc]
	ldrh r0, [r0, #0x3c]
	lsrs r1, r0, #2
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _0800CDA4
	str r2, [sp]
	str r1, [sp, #4]
	adds r0, r3, #0
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl sub_80C7D78
_0800CDA4:
	movs r0, #0
	add sp, #8
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

