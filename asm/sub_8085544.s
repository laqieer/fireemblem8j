	.syntax unified
	.set sub_8085528, 0x08085528 + 1
	.set sub_808639C, 0x0808639C + 1
	.section .text.sub_8085544, "ax", %progbits
@ sub_8085544 @ JP 0x08085544 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8085544
	.thumb_func
sub_8085544:
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8085528
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08085564
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_808639C
_08085564:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

