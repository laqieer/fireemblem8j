	.syntax unified
	.set strcpy, 0x080D69BC + 1
	.section .text.sub_8031438, "ax", %progbits
@ sub_8031438 @ JP 0x08031438 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8031438
	.thumb_func
sub_8031438:
	push {lr}
	adds r1, r0, #0
	ldr r0, _08031448 @ =0x0202BD0C
	bl strcpy
	pop {r0}
	bx r0
	.align 2, 0
_08031448: .4byte 0x0202BD0C

