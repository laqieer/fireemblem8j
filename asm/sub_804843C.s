	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80483F0, 0x080483F0 + 1
	.set sub_8088DE8, 0x08088DE8 + 1
	.section .text.sub_804843C, "ax", %progbits
@ sub_804843C @ JP 0x0804843C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804843C
	.thumb_func
sub_804843C:
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r5, #0x3c
	adds r0, #0x3b
	ldrb r1, [r5]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _08048494
	ldr r0, _0804849C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08048460
	movs r0, #0x7d
	bl m4aSongNumStart
_08048460:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r0, _080484A0 @ =0x0203DA84
	ldr r1, _080484A4 @ =0x080DEED8
	ldrb r2, [r5]
	bl sub_80483F0
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, _080484A8 @ =0x02023084
	movs r3, #0xc0
	lsls r3, r3, #7
	movs r4, #0x64
	str r4, [sp]
	ldrb r1, [r5]
	str r1, [sp, #4]
	ldrb r1, [r5]
	subs r4, r4, r1
	str r4, [sp, #8]
	movs r1, #0xe
	bl sub_8088DE8
	movs r0, #1
	bl BG_EnableSyncByMask
_08048494:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804849C: .4byte 0x0202BCEC
_080484A0: .4byte 0x0203DA84
_080484A4: .4byte 0x080DEED8
_080484A8: .4byte 0x02023084

