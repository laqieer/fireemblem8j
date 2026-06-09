	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8070F94, 0x08070F94 + 1
	.section .text.sub_8071A2C, "ax", %progbits
@ sub_8071A2C @ JP 0x08071A2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071A2C
	.thumb_func
sub_8071A2C:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08071A5C @ =0x08604094
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _08071A60 @ =0x085FF1C0
	adds r0, r5, #0
	movs r1, #0
	adds r2, r3, #0
	bl sub_8070F94
	str r0, [r4, #0x60]
	ldrh r1, [r0, #2]
	subs r1, #0x38
	strh r1, [r0, #2]
	ldrh r1, [r0, #4]
	subs r1, #4
	strh r1, [r0, #4]
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08071A5C: .4byte 0x08604094
_08071A60: .4byte 0x085FF1C0

