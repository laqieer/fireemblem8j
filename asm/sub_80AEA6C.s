	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80B0664, 0x080B0664 + 1
	.section .text.sub_80AEA6C, "ax", %progbits
@ sub_80AEA6C @ JP 0x080AEA6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AEA6C
	.thumb_func
sub_80AEA6C:
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	movs r2, #2
	bl sub_80B0664
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0

