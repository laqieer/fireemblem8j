	.syntax unified
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_80280A0, 0x080280A0 + 1
	.section .text.sub_8035C44, "ax", %progbits
@ sub_8035C44 @ JP 0x08035C44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8035C44
	.thumb_func
sub_8035C44:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	ldr r0, _08035CE4 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_80280A0
	ldr r3, _08035CE8 @ =0x03003020
	ldrb r2, [r3, #1]
	movs r1, #0x21
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	movs r2, #0x41
	rsbs r2, r2, #0
	ands r0, r2
	movs r2, #0x80
	orrs r0, r2
	strb r0, [r3, #1]
	movs r0, #0x36
	adds r0, r0, r3
	mov ip, r0
	ldrb r0, [r0]
	ands r1, r0
	adds r3, #0x37
	ldrb r0, [r3]
	movs r2, #0x20
	orrs r0, r2
	movs r2, #2
	rsbs r2, r2, #0
	ands r1, r2
	movs r6, #3
	rsbs r6, r6, #0
	ands r1, r6
	movs r5, #5
	rsbs r5, r5, #0
	ands r1, r5
	movs r4, #8
	orrs r1, r4
	movs r2, #0x10
	orrs r1, r2
	mov r7, ip
	strb r1, [r7]
	movs r1, #1
	orrs r0, r1
	ands r0, r6
	ands r0, r5
	orrs r0, r4
	orrs r0, r2
	strb r0, [r3]
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	movs r0, #0x4c
	add r8, r0
	movs r0, #0x40
	mov r1, r8
	strh r0, [r1]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08035CE4: .4byte 0x03004DF0
_08035CE8: .4byte 0x03003020

