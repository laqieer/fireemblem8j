	.syntax unified
	.set GetSaveReadAddr, 0x080A7B58 + 1
	.set sub_80ABB50, 0x080ABB50 + 1
	.section .text.sub_80A9C8C, "ax", %progbits
@ sub_80A9C8C @ JP 0x080A9C8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A9C8C
	.thumb_func
sub_80A9C8C:
	push {r4, lr}
	adds r4, r1, #0
	bl GetSaveReadAddr
	ldr r1, _080A9CA4 @ =0x00000D8C
	adds r0, r0, r1
	adds r1, r4, #0
	bl sub_80ABB50
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9CA4: .4byte 0x00000D8C

