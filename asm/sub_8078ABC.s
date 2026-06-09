	.syntax unified
	.set AddEkrDragonStatusAttr, 0x08072004 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set SetAnimStateUnHidden, 0x0805B138 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8059810, 0x08059810 + 1
	.set sub_80789BC, 0x080789BC + 1
	.section .text.sub_8078ABC, "ax", %progbits
@ sub_8078ABC @ JP 0x08078ABC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8078ABC
	.thumb_func
sub_8078ABC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_80789BC
	cmp r0, #0
	beq _08078AD4
	ldr r0, [r4, #0x5c]
	movs r1, #0xc2
	bl sub_8059810
	b _08078ADC
_08078AD4:
	ldr r0, [r4, #0x5c]
	movs r1, #0xc1
	bl sub_8059810
_08078ADC:
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateUnHidden
	ldr r1, _08078B00 @ =0x0203E114
	movs r0, #0x40
	strh r0, [r1]
	ldr r0, [r4, #0x5c]
	movs r1, #2
	bl AddEkrDragonStatusAttr
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08078B00: .4byte 0x0203E114

