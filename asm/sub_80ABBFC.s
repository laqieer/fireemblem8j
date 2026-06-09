	.syntax unified
	.set sub_80C206C, 0x080C206C + 1
	.section .text.sub_80ABBFC, "ax", %progbits
@ sub_80ABBFC @ JP 0x080ABBFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80ABBFC
	.thumb_func
sub_80ABBFC:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080ABC0C @ =0x03005270
	bl sub_80C206C
	pop {r0}
	bx r0
	.align 2, 0
_080ABC0C: .4byte 0x03005270

