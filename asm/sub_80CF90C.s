	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set Proc_EndEach, 0x08002FC8 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.section .text.sub_80CF90C, "ax", %progbits
@ sub_80CF90C @ JP 0x080CF90C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CF90C
	.thumb_func
sub_80CF90C:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	sub sp, #4
	ldr r0, _080CF9CC @ =0x08B3F670
	bl Proc_EndEach
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r3, _080CF9D0 @ =0x03003020
	ldrb r1, [r3, #1]
	movs r2, #2
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	movs r5, #3
	rsbs r5, r5, #0
	ands r0, r5
	movs r4, #5
	rsbs r4, r4, #0
	ands r0, r4
	movs r1, #8
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	movs r6, #0x10
	orrs r0, r6
	movs r1, #0x21
	rsbs r1, r1, #0
	mov sb, r1
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r3, #1]
	movs r0, #0x37
	adds r0, r0, r3
	mov ip, r0
	ldrb r1, [r0]
	adds r0, r2, #0
	ands r0, r1
	ands r0, r5
	ands r0, r4
	mov r1, r8
	orrs r0, r1
	orrs r0, r6
	adds r3, #0x36
	ldrb r1, [r3]
	ands r2, r1
	ands r2, r5
	ands r2, r4
	movs r1, #9
	rsbs r1, r1, #0
	ands r2, r1
	subs r1, #8
	ands r2, r1
	movs r1, #0x20
	orrs r0, r1
	mov r1, ip
	strb r0, [r1]
	mov r0, sb
	ands r2, r0
	strb r2, [r3]
	movs r0, #1
	movs r1, #4
	movs r2, #8
	movs r3, #8
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CF9CC: .4byte 0x08B3F670
_080CF9D0: .4byte 0x03003020

