	.syntax unified
	.set sub_80B8CF0, 0x080B8CF0 + 1
	.section .text.sub_80B9540, "ax", %progbits
@ sub_80B9540 @ JP 0x080B9540 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9540
	.thumb_func
sub_80B9540:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B9550 @ =0x0000084F
	bl sub_80B8CF0
	pop {r0}
	bx r0
	.align 2, 0
_080B9550: .4byte 0x0000084F

