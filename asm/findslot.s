	.syntax unified
	.section .text.findslot, "ax", %progbits
@ findslot @ JP 0x080DA3C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global findslot
	.thumb_func
findslot:
	adds r3, r0, #0
	movs r1, #0
	ldr r2, _080DA3D0 @ =0x03002B40
	b _080DA3DC
	.align 2, 0
_080DA3D0: .4byte 0x03002B40
_080DA3D4:
	adds r2, #8
	adds r1, #1
	cmp r1, #0x13
	bgt _080DA3E2
_080DA3DC:
	ldr r0, [r2]
	cmp r0, r3
	bne _080DA3D4
_080DA3E2:
	adds r0, r1, #0
	bx lr
	.align 2, 0

