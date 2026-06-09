	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set CheckInLinkArena, 0x08042E1C + 1
	.set PutText, 0x08003DA0 + 1
	.section .text.sub_8097E74, "ax", %progbits
@ sub_8097E74 @ JP 0x08097E74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8097E74
	.thumb_func
sub_8097E74:
	push {r4, r5, lr}
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	movs r5, #0
	rsbs r1, r1, #0
	adds r4, r1, #7
_08097E8A:
	lsls r0, r5, #3
	ldr r1, _08097EB0 @ =0x020111A4
	adds r0, r0, r1
	lsls r1, r4, #6
	ldr r2, _08097EB4 @ =0x02023CC2
	adds r1, r1, r2
	bl PutText
	adds r4, #2
	adds r5, #1
	cmp r5, #4
	ble _08097E8A
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08097EB0: .4byte 0x020111A4
_08097EB4: .4byte 0x02023CC2

