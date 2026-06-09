	.syntax unified
	.set EfxDracoZombiePrepareTSA, 0x0807223C + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set SetAnimStateUnHidden, 0x0805B138 + 1
	.set sub_8059810, 0x08059810 + 1
	.section .text.sub_8072454, "ax", %progbits
@ sub_8072454 @ JP 0x08072454 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8072454
	.thumb_func
sub_8072454:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl EfxDracoZombiePrepareTSA
	ldr r0, [r4, #0x5c]
	movs r1, #0xc0
	bl sub_8059810
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateUnHidden
	ldr r1, _08072480 @ =0x0203E114
	movs r0, #0x15
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08072480: .4byte 0x0203E114

