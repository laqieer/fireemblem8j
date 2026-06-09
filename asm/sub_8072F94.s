	.syntax unified
	.set GetEkrDragonStatusAttr, 0x08071FF8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8072F94, "ax", %progbits
@ sub_8072F94 @ JP 0x08072F94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8072F94
	.thumb_func
sub_8072F94:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetEkrDragonStatusAttr
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08072FB4
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	bl sub_8002DE4
_08072FB4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

