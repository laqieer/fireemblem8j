	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendBackdropB, 0x08001EB4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_80C9644, 0x080C9644 + 1
	.set sub_80C96A8, 0x080C96A8 + 1
	.set sub_80C9B0C, 0x080C9B0C + 1
	.set sub_80C9F80, 0x080C9F80 + 1
	.section .text.sub_80C9FD0, "ax", %progbits
@ sub_80C9FD0 @ JP 0x080C9FD0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C9FD0
	.thumb_func
sub_80C9FD0:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r0
	bl sub_80C9F80
	ldr r4, _080CA0D0 @ =0x03003020
	ldrb r1, [r4]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4]
	ldrb r1, [r4, #0xc]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	movs r6, #1
	orrs r0, r6
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	ands r2, r0
	strb r2, [r4, #0x18]
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r5, #0
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	str r5, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r2, _080CA0D4 @ =0x0000FFFD
	movs r0, #1
	adds r1, r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #3
	bl sub_80C9644
	movs r0, #3
	bl sub_80C96A8
	ldr r0, _080CA0D8 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080CA0DC @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #0xe
	bl BG_EnableSyncByMask
	movs r0, #2
	bl sub_80C9B0C
	ldrb r0, [r4, #1]
	orrs r0, r6
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r4, #1]
	mov r1, r8
	adds r1, #0x29
	movs r0, #2
	strb r0, [r1]
	movs r0, #0x78
	mov r1, r8
	strh r0, [r1, #0x2a]
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CA0D0: .4byte 0x03003020
_080CA0D4: .4byte 0x0000FFFD
_080CA0D8: .4byte 0x020234A8
_080CA0DC: .4byte 0x02023CA8

