	.syntax unified
	.set StartArenaDialogue, 0x080BA788 + 1
	.section .text.sub_80BA600, "ax", %progbits
@ sub_80BA600 @ JP 0x080BA600 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BA600
	.thumb_func
sub_80BA600:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BA610 @ =0x00000875
	bl StartArenaDialogue
	pop {r0}
	bx r0
	.align 2, 0
_080BA610: .4byte 0x00000875

