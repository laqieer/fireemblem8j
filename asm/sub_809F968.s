	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set PutNumber, 0x08004A90 + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8005890, 0x08005890 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8099FA0, 0x08099FA0 + 1
	.section .text.sub_809F968, "ax", %progbits
@ PrepItemSupply_DrawConvoyHeader @ JP 0x0809F968 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PrepItemSupply_DrawConvoyHeader
	.thumb_func
PrepItemSupply_DrawConvoyHeader:
	push {r4, r5, r6, lr}
	sub sp, #8
	movs r0, #0
	bl SetTextFont
	ldr r6, _0809FA14 @ =0x02022D10
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _0809FA18 @ =0x00000523
	bl sub_8009FA8
	ldr r4, _0809FA1C @ =0x02013658
	adds r1, r6, #0
	adds r1, #0xda
	movs r5, #0
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #2
	bl sub_8004374
	adds r1, r6, #0
	subs r1, #0x26
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0xad
	movs r3, #2
	bl sub_8005890
	ldr r0, _0809FA20 @ =0x0000052B
	bl sub_8009FA8
	adds r4, #8
	subs r1, r6, #2
	str r5, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0
	movs r3, #4
	bl sub_8004374
	adds r5, r6, #0
	adds r5, #0xa
	bl sub_8099FA0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #2
	cmp r0, #0x64
	bne _0809F9DC
	movs r4, #4
_0809F9DC:
	bl sub_8099FA0
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutNumber
	adds r0, r6, #0
	adds r0, #0xc
	movs r1, #0
	movs r2, #0x16
	bl PutSpecialChar
	adds r0, r6, #0
	adds r0, #0x12
	movs r1, #2
	movs r2, #0x64
	bl PutNumber
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0809FA14: .4byte 0x02022D10
_0809FA18: .4byte 0x00000523
_0809FA1C: .4byte 0x02013658
_0809FA20: .4byte 0x0000052B

