	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_80463D8, "ax", %progbits
@ sub_80463D8 @ JP 0x080463D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80463D8
	.thumb_func
sub_80463D8:
	push {lr}
	ldr r0, _080463F0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080463EC
	movs r0, #0x7e
	bl m4aSongNumStart
_080463EC:
	pop {r0}
	bx r0
	.align 2, 0
_080463F0: .4byte 0x0202BCEC

