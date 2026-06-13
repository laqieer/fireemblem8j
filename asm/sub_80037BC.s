	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.section .text.ClearDBG, "ax", %progbits
@ ClearDBG @ JP 0x080037BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ClearDBG
	.thumb_func
ClearDBG:
	push {r4, r5, r6, lr}
	movs r1, #0
	ldr r2, _080037F8 @ =0x02026E30
	ldr r6, _080037FC @ =0x02023CA8
	movs r5, #0xff
	adds r4, r2, #0
	adds r4, #0x14
	movs r3, #0
_080037CC:
	adds r0, r1, #0
	ands r0, r5
	lsls r0, r0, #5
	adds r0, r0, r4
	strb r3, [r0]
	adds r1, #1
	cmp r1, #0xff
	ble _080037CC
	movs r0, #0
	str r0, [r2, #8]
	str r0, [r2, #0xc]
	adds r0, r6, #0
	movs r1, #0
	bl sub_80011D0
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080037F8: .4byte 0x02026E30
_080037FC: .4byte 0x02023CA8

