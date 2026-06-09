	.syntax unified
	.set sub_80B8CF0, 0x080B8CF0 + 1
	.section .text.sub_80B9554, "ax", %progbits
@ sub_80B9554 @ JP 0x080B9554 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9554
	.thumb_func
sub_80B9554:
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x5c
	movs r0, #0
	strb r0, [r2]
	ldr r0, _080B956C @ =0x0000083D
	bl sub_80B8CF0
	pop {r0}
	bx r0
	.align 2, 0
_080B956C: .4byte 0x0000083D

