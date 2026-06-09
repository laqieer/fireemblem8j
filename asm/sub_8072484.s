	.syntax unified
	.set AddEkrDragonStatusAttr, 0x08072004 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetEkrDragonStatusAttr, 0x08071FF8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8072484, "ax", %progbits
@ sub_8072484 @ JP 0x08072484 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8072484
	.thumb_func
sub_8072484:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	bl GetEkrDragonStatusAttr
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	beq _080724A8
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl AddEkrDragonStatusAttr
	adds r0, r4, #0
	bl sub_8002DE4
_080724A8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

