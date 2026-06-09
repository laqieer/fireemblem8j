	.syntax unified
	.set sub_80B8CF0, 0x080B8CF0 + 1
	.section .text.sub_80B8F30, "ax", %progbits
@ sub_80B8F30 @ JP 0x080B8F30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B8F30
	.thumb_func
sub_80B8F30:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B8F40 @ =0x00000843
	bl sub_80B8CF0
	pop {r0}
	bx r0
	.align 2, 0
_080B8F40: .4byte 0x00000843

