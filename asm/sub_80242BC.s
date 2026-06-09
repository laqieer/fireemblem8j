	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set IsItemStealable, 0x08016DFC + 1
	.section .text.sub_80242BC, "ax", %progbits
@ sub_80242BC @ JP 0x080242BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80242BC
	.thumb_func
sub_80242BC:
	push {r4, r5, lr}
	adds r4, r1, #0
	ldr r5, _080242D8 @ =0x0203A954
	ldrb r0, [r5, #0xd]
	bl GetUnit
	lsls r4, r4, #1
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0
	bne _080242DC
	movs r0, #3
	b _080242F8
	.align 2, 0
_080242D8: .4byte 0x0203A954
_080242DC:
	ldrb r0, [r5, #0xd]
	bl GetUnit
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r0, [r0]
	bl IsItemStealable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080242F6
	movs r0, #1
	b _080242F8
_080242F6:
	movs r0, #2
_080242F8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

