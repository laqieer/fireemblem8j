	.syntax unified
	.set StartArenaDialogue, 0x080BA788 + 1
	.section .text.sub_80BA614, "ax", %progbits
@ sub_80BA614 @ JP 0x080BA614 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BA614
	.thumb_func
sub_80BA614:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BA624 @ =0x00000873
	bl StartArenaDialogue
	pop {r0}
	bx r0
	.align 2, 0
_080BA624: .4byte 0x00000873

