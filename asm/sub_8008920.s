	.syntax unified
	.set strcpy, 0x080D69BC + 1
	.section .text.sub_8008920, "ax", %progbits
@ sub_8008920 @ JP 0x08008920 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8008920
	.thumb_func
sub_8008920:
	push {lr}
	adds r1, r0, #0
	ldr r0, _08008934 @ =0x085B90D4
	ldr r0, [r0]
	adds r0, #0x60
	bl strcpy
	pop {r0}
	bx r0
	.align 2, 0
_08008934: .4byte 0x085B90D4

