	.syntax unified
	.set sub_80C7D78, 0x080C7D78 + 1
	.section .text.sub_800CDB0, "ax", %progbits
@ sub_800CDB0 @ JP 0x0800CDB0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CDB0
	.thumb_func
sub_800CDB0:
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r1, [r0, #0x38]
	movs r2, #4
	ldrsh r6, [r1, r2]
	movs r2, #6
	ldrsh r7, [r1, r2]
	movs r2, #8
	ldrsh r3, [r1, r2]
	movs r2, #0xa
	ldrsh r5, [r1, r2]
	ldrh r0, [r0, #0x3c]
	lsrs r4, r0, #2
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	bne _0800CE08
	add r2, sp, #8
	lsls r1, r3, #5
	ldr r0, _0800CE14 @ =0x081F5D7C
	adds r1, r1, r0
	ldrh r0, [r1, #0x18]
	strh r0, [r2]
	mov r3, sp
	adds r3, #0xa
	ldrh r0, [r1, #0x1a]
	strh r0, [r3]
	adds r0, r2, #0
	movs r1, #0
	ldrsh r2, [r0, r1]
	lsrs r0, r2, #0x1f
	adds r2, r2, r0
	asrs r2, r2, #1
	movs r0, #0
	ldrsh r3, [r3, r0]
	lsrs r0, r3, #0x1f
	adds r3, r3, r0
	asrs r3, r3, #1
	str r5, [sp]
	str r4, [sp, #4]
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_80C7D78
_0800CE08:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800CE14: .4byte 0x081F5D7C

