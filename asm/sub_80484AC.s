	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80483F0, 0x080483F0 + 1
	.set sub_8088DE8, 0x08088DE8 + 1
	.section .text.sub_80484AC, "ax", %progbits
@ sub_80484AC @ JP 0x080484AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80484AC
	.thumb_func
sub_80484AC:
	push {r4, r5, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r5, #0x3c
	adds r0, #0x3b
	ldrb r1, [r5]
	ldrb r0, [r0]
	cmp r1, r0
	bhs _08048504
	ldr r0, _0804850C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080484D0
	movs r0, #0x7d
	bl m4aSongNumStart
_080484D0:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	ldr r0, _08048510 @ =0x0203DA84
	ldr r1, _08048514 @ =0x080DEEE0
	ldrb r2, [r5]
	bl sub_80483F0
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r2, _08048518 @ =0x02023084
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
_08048504:
	add sp, #0xc
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804850C: .4byte 0x0202BCEC
_08048510: .4byte 0x0203DA84
_08048514: .4byte 0x080DEEE0
_08048518: .4byte 0x02023084

