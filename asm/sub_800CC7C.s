	.syntax unified
	.set sub_80C6CD0, 0x080C6CD0 + 1
	.section .text.sub_800CC7C, "ax", %progbits
@ sub_800CC7C @ JP 0x0800CC7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CC7C
	.thumb_func
sub_800CC7C:
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	ldr r1, [r0, #0x38]
	movs r2, #4
	ldrsh r4, [r1, r2]
	movs r3, #6
	ldrsh r5, [r1, r3]
	movs r7, #8
	ldrsh r6, [r1, r7]
	movs r3, #0xa
	ldrsh r2, [r1, r3]
	mov ip, r2
	movs r7, #0xc
	ldrsh r2, [r1, r7]
	movs r7, #0xe
	ldrsh r3, [r1, r7]
	ldrh r0, [r0, #0x3c]
	lsrs r1, r0, #2
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	bne _0800CCBA
	str r2, [sp]
	str r3, [sp, #4]
	str r1, [sp, #8]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	mov r3, ip
	bl sub_80C6CD0
_0800CCBA:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

