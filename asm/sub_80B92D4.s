	.syntax unified
	.set sub_80B8CF0, 0x080B8CF0 + 1
	.section .text.sub_80B92D4, "ax", %progbits
@ sub_80B92D4 @ JP 0x080B92D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B92D4
	.thumb_func
sub_80B92D4:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B92E4 @ =0x0000086D
	bl sub_80B8CF0
	pop {r0}
	bx r0
	.align 2, 0
_080B92E4: .4byte 0x0000086D

