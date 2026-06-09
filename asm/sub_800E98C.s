	.syntax unified
	.set StartTalk, 0x08006974 + 1
	.section .text.sub_800E98C, "ax", %progbits
@ sub_800E98C @ JP 0x0800E98C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800E98C
	.thumb_func
sub_800E98C:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x12
	movs r2, #1
	ands r0, r2
	cmp r0, #0
	bne _0800E9C6
	lsrs r3, r1, #0x13
	ands r3, r2
	cmp r3, #0
	bne _0800E9C6
	ldr r0, [r4, #0x38]
	ldrh r1, [r0, #2]
	ldrb r0, [r0, #2]
	lsrs r1, r1, #8
	ldr r2, _0800E9D0 @ =0x03000428
	adds r0, #8
	strb r0, [r2]
	movs r0, #0x80
	strb r0, [r2, #1]
	adds r1, #0xa
	strb r1, [r2, #2]
	strb r3, [r2, #3]
	movs r0, #0
	movs r1, #0
	bl StartTalk
_0800E9C6:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800E9D0: .4byte 0x03000428

