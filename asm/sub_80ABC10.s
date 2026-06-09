	.syntax unified
	.set sub_80C207C, 0x080C207C + 1
	.section .text.sub_80ABC10, "ax", %progbits
@ sub_80ABC10 @ JP 0x080ABC10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80ABC10
	.thumb_func
sub_80ABC10:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080ABC20 @ =0x03005270
	bl sub_80C207C
	pop {r0}
	bx r0
	.align 2, 0
_080ABC20: .4byte 0x03005270

