	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_805A78C, 0x0805A78C + 1
	.set sub_805AE20, 0x0805AE20 + 1
	.section .text.sub_8059810, "ax", %progbits
@ sub_8059810 @ JP 0x08059810 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8059810
	.thumb_func
sub_8059810:
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r4, r1, #0x10
	asrs r4, r4, #0x10
	bl GetAnimPosition
	ldr r1, _08059838 @ =0x0203E17E
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	bl sub_805A78C
	adds r0, r5, #0
	movs r1, #6
	bl sub_805AE20
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08059838: .4byte 0x0203E17E

