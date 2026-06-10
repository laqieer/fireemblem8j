	.syntax unified
	.set GetItemAttributes, 0x08017314 + 1
	.set sub_8022C6C, 0x08022C6C + 1
	.set sub_802881C, 0x0802881C + 1
	.section .text.sub_802339C, "ax", %progbits
@ sub_802339C @ JP 0x0802339C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802339C
	.thumb_func
sub_802339C:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r7, _080233B8 @ =0x03004DF0
	ldr r0, [r7]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _080233BC
	movs r0, #3
	b _080233E6
	.align 2, 0
_080233B8: .4byte 0x03004DF0
_080233BC:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080233D2
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_8022C6C
_080233D2:
	ldr r0, [r7]
	adds r1, r4, #0
	bl sub_802881C
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _080233E4
	movs r1, #1
_080233E4:
	adds r0, r1, #0
_080233E6:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

