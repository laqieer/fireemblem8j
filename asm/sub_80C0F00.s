	.syntax unified
	.set BG_EnableSync, 0x08001F0C + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.section .text.sub_80C0F00, "ax", %progbits
@ sub_80C0F00 @ JP 0x080C0F00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C0F00
	.thumb_func
sub_80C0F00:
	push {r4, lr}
	adds r4, r0, #0
	adds r4, #0x35
	ldrb r0, [r4]
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	ldrb r0, [r4]
	bl BG_EnableSync
	ldr r0, _080C0F34 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080C0F2C
	movs r0, #0xc4
	lsls r0, r0, #2
	bl m4aSongNumStart
_080C0F2C:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C0F34: .4byte 0x0202BCEC

