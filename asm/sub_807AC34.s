	.syntax unified
	.set sub_8014B50, 0x08014B50 + 1
	.section .text.sub_807AC34, "ax", %progbits
@ sub_807AC34 @ JP 0x0807AC34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807AC34
	.thumb_func
sub_807AC34:
	push {lr}
	ldr r2, [r0, #0x58]
	adds r0, #0x64
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r0, r2, #0
	bl sub_8014B50
	pop {r0}
	bx r0

