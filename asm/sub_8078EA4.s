	.syntax unified
	.set AddEkrDragonStatusAttr, 0x08072004 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8078EC4, 0x08078EC4 + 1
	.section .text.sub_8078EA4, "ax", %progbits
@ sub_8078EA4 @ JP 0x08078EA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8078EA4
	.thumb_func
sub_8078EA4:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_8078EC4
	str r0, [r4, #0x50]
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl AddEkrDragonStatusAttr
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0

