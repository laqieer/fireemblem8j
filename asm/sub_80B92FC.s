	.syntax unified
	.set sub_80B8CF0, 0x080B8CF0 + 1
	.section .text.sub_80B92FC, "ax", %progbits
@ sub_80B92FC @ JP 0x080B92FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B92FC
	.thumb_func
sub_80B92FC:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B930C @ =0x00000849
	bl sub_80B8CF0
	pop {r0}
	bx r0
	.align 2, 0
_080B930C: .4byte 0x00000849

