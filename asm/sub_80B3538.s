	.syntax unified
	.set strcpy, 0x080D69BC + 1
	.set strlen, 0x080D6A08 + 1
	.section .text.sub_80B3538, "ax", %progbits
@ sub_80B3538 @ JP 0x080B3538 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B3538
	.thumb_func
sub_80B3538:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl strcpy
	adds r0, r5, #0
	bl strlen
	adds r4, r4, r0
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

