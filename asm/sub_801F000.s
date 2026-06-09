	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_800125C, 0x0800125C + 1
	.set sub_80012CC, 0x080012CC + 1
	.section .text.sub_801F000, "ax", %progbits
@ sub_801F000 @ JP 0x0801F000 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801F000
	.thumb_func
sub_801F000:
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	ldr r6, _0801F0DC @ =0x03003020
	ldrb r0, [r6, #1]
	movs r1, #0x20
	mov sb, r1
	mov r2, sb
	orrs r0, r2
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
	adds r0, r6, #0
	adds r0, #0x2d
	movs r4, #0
	mov r8, r4
	mov r1, r8
	strb r1, [r0]
	adds r0, #4
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	movs r2, #0x34
	adds r2, r2, r6
	mov sl, r2
	ldrb r1, [r2]
	movs r2, #1
	orrs r1, r2
	subs r0, #0xa3
	ands r1, r0
	movs r5, #4
	orrs r1, r5
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	adds r6, #0x36
	ldrb r0, [r6]
	orrs r0, r2
	movs r2, #2
	orrs r0, r2
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	mov r4, sb
	orrs r1, r4
	mov r2, sl
	strb r1, [r2]
	orrs r0, r4
	strb r0, [r6]
	ldr r2, _0801F0E0 @ =0x0202BCAC
	adds r0, r2, #0
	adds r0, #0x3a
	mov r4, r8
	strb r4, [r0]
	adds r3, r2, #0
	adds r3, #0x3b
	movs r1, #0x10
	strb r1, [r3]
	subs r0, #2
	strb r4, [r0]
	adds r0, #1
	strb r1, [r0]
	ldrb r2, [r3]
	movs r0, #1
	movs r1, #0
	movs r3, #0
	bl SetBlendConfig
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	bl sub_80012CC
	ldr r0, _0801F0E4 @ =sub_801E8BC
	bl sub_800125C
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801F0DC: .4byte 0x03003020
_0801F0E0: .4byte 0x0202BCAC
_0801F0E4: .4byte 0x0801E8BD  @ sub_801E8BC

