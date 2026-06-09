	.syntax unified
	.set GmTmConfront_LoadPositions, 0x080C5330 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_80C53A8, "ax", %progbits
@ sub_80C53A8 @ JP 0x080C53A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C53A8
	.thumb_func
sub_80C53A8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080C53D0 @ =0x081F65C8
	bl GmTmConfront_LoadPositions
	movs r0, #5
	strh r0, [r4, #0x2c]
	ldr r0, _080C53D4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080C53C8
	ldr r0, _080C53D8 @ =0x00000313
	bl m4aSongNumStart
_080C53C8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C53D0: .4byte 0x081F65C8
_080C53D4: .4byte 0x0202BCEC
_080C53D8: .4byte 0x00000313

