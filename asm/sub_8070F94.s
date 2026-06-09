	.syntax unified
	.set AnimCreate, 0x08004E50 + 1
	.set sub_8070F08, 0x08070F08 + 1
	.section .text.sub_8070F94, "ax", %progbits
@ sub_8070F94 @ JP 0x08070F94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8070F94
	.thumb_func
sub_8070F94:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	bl sub_8070F08
	mov r8, r0
	cmp r4, #0
	bne _08070FB4
	adds r0, r7, #0
	b _08070FB6
_08070FB4:
	adds r0, r6, #0
_08070FB6:
	movs r1, #0x78
	bl AnimCreate
	adds r2, r0, #0
	mov r1, r8
	ldrh r0, [r1, #0x10]
	lsls r0, r0, #0xc
	ldrh r1, [r1, #0xe]
	orrs r0, r1
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2, #8]
	ldrh r0, [r5, #2]
	strh r0, [r2, #2]
	ldrh r0, [r5, #4]
	strh r0, [r2, #4]
	adds r0, r2, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

