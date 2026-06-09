	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_804E5A0, 0x0804E5A0 + 1
	.section .text.sub_8044340, "ax", %progbits
@ sub_8044340 @ JP 0x08044340 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8044340
	.thumb_func
sub_8044340:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x55
	movs r0, #1
	strb r0, [r1]
	bl sub_804E5A0
	adds r0, r5, #0
	adds r0, #0x48
	ldrb r1, [r0]
	ldr r0, [r5, #0x40]
	subs r0, r0, r1
	cmp r0, #2
	ble _08044364
	lsls r0, r0, #1
	subs r0, #2
	b _08044368
_08044364:
	lsls r0, r0, #1
	adds r0, #5
_08044368:
	str r0, [r5, #0x58]
	ldr r4, _080443B4 @ =0x0203DAAC
	adds r0, r4, #0
	bl sub_8003CF8
	ldr r0, _080443B8 @ =0x000007C1
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8003F28
	adds r0, r4, #0
	movs r1, #0x26
	bl sub_8003D84
	ldr r0, _080443BC @ =0x000007C3
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8003F28
	ldr r1, [r5, #0x58]
	adds r1, #4
	lsls r1, r1, #6
	ldr r0, _080443C0 @ =0x02022CC6
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080443B4: .4byte 0x0203DAAC
_080443B8: .4byte 0x000007C1
_080443BC: .4byte 0x000007C3
_080443C0: .4byte 0x02022CC6

