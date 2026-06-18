	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80146B4, 0x080146B4 + 1
	.set sub_8080CB8, 0x08080CB8 + 1
	.section .text.sub_807FE74, "ax", %progbits
@ WarpFlashy_Loop @ JP 0x0807FE74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global WarpFlashy_Loop
	.thumb_func
WarpFlashy_Loop:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	ldr r0, _0807FEDC @ =0x02023CA8
	ldr r1, [r7, #0x30]
	subs r1, #1
	ldr r2, [r7, #0x34]
	subs r2, #3
	ldr r3, _0807FEE0 @ =0x00004140
	movs r4, #4
	str r4, [sp]
	movs r4, #6
	str r4, [sp, #4]
	ldr r4, _0807FEE4 @ =0x08A1EB2C
	str r4, [sp, #8]
	ldr r6, _0807FEE8 @ =0x08A14294
	adds r5, r7, #0
	adds r5, #0x40
	ldrh r4, [r5]
	lsrs r4, r4, #1
	adds r4, r4, r6
	ldrb r4, [r4]
	str r4, [sp, #0xc]
	bl sub_80146B4
	movs r0, #4
	bl BG_EnableSyncByMask
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	ldrh r0, [r5]
	lsrs r0, r0, #1
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0807FEC4
	adds r0, r7, #0
	bl sub_8002DE4
_0807FEC4:
	bl sub_8080CB8
	movs r0, #1
	movs r1, #0xc
	movs r2, #0xc
	movs r3, #0
	bl SetBlendConfig
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807FEDC: .4byte 0x02023CA8
_0807FEE0: .4byte 0x00004140
_0807FEE4: .4byte 0x08A1EB2C
_0807FEE8: .4byte 0x08A14294

