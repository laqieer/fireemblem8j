	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8076FC8, 0x08076FC8 + 1
	.section .text.sub_807643C, "ax", %progbits
@ sub_807643C @ JP 0x0807643C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807643C
	.thumb_func
sub_807643C:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0xa0
	movs r1, #1
	bl sub_8076FC8
	ldr r1, _08076464 @ =0x020200B8
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x1c
_08076450:
	str r2, [r0]
	subs r0, #4
	cmp r0, r1
	bge _08076450
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08076464: .4byte 0x020200B8

