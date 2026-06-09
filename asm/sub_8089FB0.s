	.syntax unified
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.section .text.sub_8089FB0, "ax", %progbits
@ sub_8089FB0 @ JP 0x08089FB0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8089FB0
	.thumb_func
sub_8089FB0:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x4c
	movs r6, #0
	movs r4, #1
	strh r4, [r0]
	ldr r2, _0808A010 @ =0x03003020
	ldrb r1, [r2, #0xc]
	movs r3, #4
	rsbs r3, r3, #0
	adds r0, r3, #0
	ands r0, r1
	movs r1, #1
	orrs r0, r1
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
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetB
	ldr r0, [r5, #0x38]
	cmp r0, #0
	ble _0808A014
	movs r0, #0x3c
	b _0808A018
	.align 2, 0
_0808A010: .4byte 0x03003020
_0808A014:
	movs r0, #0x3c
	rsbs r0, r0, #0
_0808A018:
	str r0, [r5, #0x3c]
	str r6, [r5, #0x40]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

