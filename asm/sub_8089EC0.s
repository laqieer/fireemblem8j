	.syntax unified
	.set SetBlendBackdropB, 0x08001EB4 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.section .text.sub_8089EC0, "ax", %progbits
@ sub_8089EC0 @ JP 0x08089EC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8089EC0
	.thumb_func
sub_8089EC0:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _08089F34 @ =0x02003BFC
	movs r7, #0
	movs r4, #1
	movs r5, #1
	strb r5, [r0, #8]
	adds r1, r6, #0
	adds r1, #0x4c
	movs r0, #4
	strh r0, [r1]
	ldr r2, _08089F38 @ =0x03003020
	ldrb r1, [r2, #0xc]
	movs r3, #4
	rsbs r3, r3, #0
	adds r0, r3, #0
	ands r0, r1
	orrs r0, r4
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0x10]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x10]
	ldrb r1, [r2, #0x14]
	adds r0, r3, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r3, r0
	strb r3, [r2, #0x18]
	str r7, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	str r5, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetB
	movs r0, #0
	bl SetBlendBackdropB
	ldr r0, [r6, #0x38]
	cmp r0, #0
	ble _08089F3C
	str r7, [r6, #0x3c]
	movs r0, #0x3c
	rsbs r0, r0, #0
	b _08089F40
	.align 2, 0
_08089F34: .4byte 0x02003BFC
_08089F38: .4byte 0x03003020
_08089F3C:
	str r7, [r6, #0x3c]
	movs r0, #0x3c
_08089F40:
	str r0, [r6, #0x40]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

