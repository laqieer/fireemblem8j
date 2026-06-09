	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80AFDD4, "ax", %progbits
@ sub_80AFDD4 @ JP 0x080AFDD4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AFDD4
	.thumb_func
sub_80AFDD4:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AFDE4 @ =0x08A9D5D4
	bl sub_8002BCC
	pop {r1}
	bx r1
	.align 2, 0
_080AFDE4: .4byte 0x08A9D5D4

