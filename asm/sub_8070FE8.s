	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set EfxTmCpyBG, 0x080733B8 + 1
	.set sub_8070F08, 0x08070F08 + 1
	.set sub_80733E8, 0x080733E8 + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_8070FE8, "ax", %progbits
@ sub_8070FE8 @ JP 0x08070FE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8070FE8
	.thumb_func
sub_8070FE8:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r2, #0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	adds r5, r3, #0
	bl sub_8070F08
	adds r4, r0, #0
	cmp r5, #1
	bne _0807100A
	ldr r1, [r4, #0x1c]
	adds r0, r6, #0
	bl sub_80D6394
_0807100A:
	adds r2, r6, #0
	cmp r5, #1
	bne _08071012
	ldr r2, [r4, #0x1c]
_08071012:
	cmp r7, #0
	bne _0807102C
	ldr r1, [r4, #0x14]
	ldrh r0, [r4, #0xc]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl sub_80733E8
	b _08071040
_0807102C:
	ldr r1, [r4, #0x14]
	ldrh r0, [r4, #0xc]
	str r0, [sp]
	ldrh r0, [r4, #0xa]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
_08071040:
	movs r0, #1
	ldrh r4, [r4, #0x12]
	lsls r0, r4
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

