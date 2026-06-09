	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set SupportSubScreen_BackupTilemaps, 0x080A58BC + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80B2004, 0x080B2004 + 1
	.section .text.sub_80A6474, "ax", %progbits
@ sub_80A6474 @ JP 0x080A6474 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A6474
	.thumb_func
sub_80A6474:
	push {r4, r5, lr}
	sub sp, #4
	adds r0, #0x3a
	movs r5, #0
	strb r5, [r0]
	bl sub_80B2004
	ldr r2, _080A64F4 @ =0x03003020
	ldrb r1, [r2, #0xc]
	movs r3, #4
	rsbs r3, r3, #0
	adds r0, r3, #0
	ands r0, r1
	movs r4, #1
	orrs r0, r4
	strb r0, [r2, #0xc]
	ldrb r0, [r2, #0x10]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x10]
	ldrb r1, [r2, #0x14]
	adds r0, r3, #0
	ands r0, r1
	orrs r0, r4
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r3, r0
	strb r3, [r2, #0x18]
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetB
	bl SupportSubScreen_BackupTilemaps
	ldr r0, _080A64F8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A64EA
	movs r0, #0xc8
	bl m4aSongNumStart
_080A64EA:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A64F4: .4byte 0x03003020
_080A64F8: .4byte 0x0202BCEC

