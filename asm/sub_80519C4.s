	.syntax unified
	.set sub_8078338, 0x08078338 + 1
	.section .text.sub_80519C4, "ax", %progbits
@ sub_80519C4 @ JP 0x080519C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80519C4
	.thumb_func
sub_80519C4:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_8078338
	ldr r0, _080519D8 @ =sub_80519DC
	str r0, [r4, #0xc]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080519D8: .4byte 0x080519DD  @ sub_80519DC

