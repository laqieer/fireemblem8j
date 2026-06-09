	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set SkipGmNodeIconDisplay, 0x080C052C + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_80BDCDC, 0x080BDCDC + 1
	.set sub_80C70B4, 0x080C70B4 + 1
	.section .text.sub_80C6F04, "ax", %progbits
@ sub_80C6F04 @ JP 0x080C6F04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C6F04
	.thumb_func
sub_80C6F04:
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	mov sl, r0
	ldr r0, _080C6FF0 @ =0x08B1D16C
	ldr r1, _080C6FF4 @ =0x06005000
	bl sub_8013008
	ldr r4, _080C6FF8 @ =0x08AC1108
	adds r0, r4, #0
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldr r1, [r0, #0x4c]
	adds r1, #0x31
	ldrb r0, [r1]
	movs r2, #4
	mov r8, r2
	movs r2, #0
	mov sb, r2
	mov r2, r8
	orrs r0, r2
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldr r0, [r0, #0x4c]
	adds r0, #0x31
	ldrb r1, [r0]
	movs r5, #3
	orrs r1, r5
	strb r1, [r0]
	adds r0, r4, #0
	bl Proc_Find
	ldr r0, [r0, #0x48]
	bl SkipGmNodeIconDisplay
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	mov r0, sl
	bl sub_80C70B4
	ldr r4, _080C6FFC @ =0x03003020
	ldrb r2, [r4, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r0, [r4, #0x10]
	ands r1, r0
	movs r6, #1
	orrs r1, r6
	strb r1, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	orrs r0, r5
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	orrs r0, r5
	strb r0, [r4, #0x18]
	mov r0, sb
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
	ldrb r0, [r4, #1]
	orrs r0, r6
	movs r1, #2
	orrs r0, r1
	mov r1, r8
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
	ldr r2, _080C7000 @ =0x03005270
	ldrb r1, [r2]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	bl sub_80BDCDC
	bl sub_801569C
	mov r0, sb
	mov r2, sl
	strh r0, [r2, #0x2a]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C6FF0: .4byte 0x08B1D16C
_080C6FF4: .4byte 0x06005000
_080C6FF8: .4byte 0x08AC1108
_080C6FFC: .4byte 0x03003020
_080C7000: .4byte 0x03005270

