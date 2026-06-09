	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8029E64, "ax", %progbits
@ sub_8029E64 @ JP 0x08029E64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029E64
	.thumb_func
sub_8029E64:
	push {lr}
	ldr r0, _08029E84 @ =0x085C3F18
	movs r1, #3
	bl sub_8002BCC
	ldr r0, _08029E88 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08029E80
	movs r0, #0x6a
	bl m4aSongNumStart
_08029E80:
	pop {r0}
	bx r0
	.align 2, 0
_08029E84: .4byte 0x085C3F18
_08029E88: .4byte 0x0202BCEC

