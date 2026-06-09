	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.section .text.sub_8003988, "ax", %progbits
@ sub_8003988 @ JP 0x08003988 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003988
	.thumb_func
sub_8003988:
	push {r4, r5, r6, r7, lr}
	ldr r0, _080039D4 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r2, #0
	ldr r7, _080039D8 @ =0x02026E30
	movs r0, #0x14
	adds r0, r0, r7
	mov ip, r0
	movs r6, #0xff
_0800399E:
	lsls r1, r2, #6
	ldr r0, _080039D4 @ =0x02023CA8
	adds r3, r1, r0
	ldr r0, [r7, #0x10]
	adds r0, r2, r0
	ands r0, r6
	lsls r0, r0, #5
	add r0, ip
	ldrb r0, [r0]
	adds r5, r2, #1
	cmp r0, #0
	beq _080039F4
	ldr r4, _080039D8 @ =0x02026E30
	ldr r0, [r4, #0x10]
	adds r0, r2, r0
	ands r0, r6
	lsls r0, r0, #5
	adds r1, r4, #0
	adds r1, #0x14
	adds r1, r0, r1
_080039C6:
	ldrb r2, [r1]
	cmp r2, #0x60
	bls _080039DC
	adds r0, r2, #0
	subs r0, #0x40
	b _080039E0
	.align 2, 0
_080039D4: .4byte 0x02023CA8
_080039D8: .4byte 0x02026E30
_080039DC:
	adds r0, r2, #0
	subs r0, #0x20
_080039E0:
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldrh r0, [r4, #6]
	adds r0, r2, r0
	strh r0, [r3]
	adds r3, #2
	adds r1, #1
	ldrb r0, [r1]
	cmp r0, #0
	bne _080039C6
_080039F4:
	adds r2, r5, #0
	cmp r2, #0x13
	ble _0800399E
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

