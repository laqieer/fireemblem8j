	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_807D044, "ax", %progbits
@ sub_807D044 @ JP 0x0807D044 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807D044
	.thumb_func
sub_807D044:
	push {lr}
	ldr r0, _0807D05C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807D058
	movs r0, #0xa0
	bl m4aSongNumStart
_0807D058:
	pop {r0}
	bx r0
	.align 2, 0
_0807D05C: .4byte 0x0202BCEC

