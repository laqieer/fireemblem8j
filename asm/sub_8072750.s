	.syntax unified
	.set AddEkrDragonStatusAttr, 0x08072004 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8072750, "ax", %progbits
@ sub_8072750 @ JP 0x08072750 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8072750
	.thumb_func
sub_8072750:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	movs r1, #8
	bl AddEkrDragonStatusAttr
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0

