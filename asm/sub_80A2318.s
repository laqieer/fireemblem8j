	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetTextFont, 0x08003C68 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8005890, 0x08005890 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80A2318, "ax", %progbits
@ sub_80A2318 @ JP 0x080A2318 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A2318
	.thumb_func
sub_80A2318:
	push {r4, lr}
	sub sp, #8
	movs r0, #0
	bl SetTextFont
	ldr r4, _080A236C @ =0x02022D10
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _080A2370 @ =0x00000523
	bl sub_8009FA8
	ldr r3, _080A2374 @ =0x02013658
	adds r1, r4, #0
	adds r1, #0xda
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #2
	bl sub_8004374
	subs r4, #0x26
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0xad
	adds r1, r4, #0
	movs r3, #2
	bl sub_8005890
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A236C: .4byte 0x02022D10
_080A2370: .4byte 0x00000523
_080A2374: .4byte 0x02013658

