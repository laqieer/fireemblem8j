	.syntax unified
	.set RemoveSioPid, 0x080975F4 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80945E8, 0x080945E8 + 1
	.set sub_80976D0, 0x080976D0 + 1
	.section .text.sub_8093560, "ax", %progbits
@ sub_8093560 @ JP 0x08093560 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8093560
	.thumb_func
sub_8093560:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_80976D0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080935E4
	ldr r0, [r4, #0xc]
	movs r1, #0xa
	orrs r0, r1
	str r0, [r4, #0xc]
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl RemoveSioPid
	ldrh r0, [r5, #0x3e]
	lsrs r4, r0, #4
	adds r0, r4, #6
	adds r6, r5, #0
	adds r6, #0x3b
	b _080935B0
_08093592:
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r3, [r0]
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	ldr r2, _080935D8 @ =0x02022CA8
	bl sub_80945E8
	adds r4, #1
	ldrh r0, [r5, #0x3e]
	lsrs r0, r0, #4
	adds r0, #6
_080935B0:
	cmp r4, r0
	bge _080935BC
	ldr r0, _080935DC @ =0x0200F158
	ldrb r0, [r0]
	cmp r4, r0
	blt _08093592
_080935BC:
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	ldr r0, _080935E0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080935F6
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080935F6
	.align 2, 0
_080935D8: .4byte 0x02022CA8
_080935DC: .4byte 0x0200F158
_080935E0: .4byte 0x0202BCEC
_080935E4:
	ldr r0, _08093600 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080935F6
	movs r0, #0x6c
	bl m4aSongNumStart
_080935F6:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08093600: .4byte 0x0202BCEC

