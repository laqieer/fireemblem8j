	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set IsItemHammernable, 0x08016E28 + 1
	.section .text.sub_80299D8, "ax", %progbits
@ sub_80299D8 @ JP 0x080299D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80299D8
	.thumb_func
sub_80299D8:
	push {r4, lr}
	adds r4, r1, #0
	ldr r0, _080299F4 @ =0x0203A954
	ldrb r0, [r0, #0xd]
	bl GetUnit
	lsls r4, r4, #1
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r0, [r0]
	cmp r0, #0
	bne _080299F8
	movs r0, #3
	b _08029A08
	.align 2, 0
_080299F4: .4byte 0x0203A954
_080299F8:
	bl IsItemHammernable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08029A06
	movs r0, #1
	b _08029A08
_08029A06:
	movs r0, #2
_08029A08:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

