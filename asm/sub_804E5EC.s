	.syntax unified
	.set CanUnitUseWeapon, 0x0801631C + 1
	.set GetItemAttributes, 0x08017314 + 1
	.set GetItemMinRange, 0x08017414 + 1
	.section .text.sub_804E5EC, "ax", %progbits
@ sub_804E5EC @ JP 0x0804E5EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804E5EC
	.thumb_func
sub_804E5EC:
	push {r4, r5, lr}
	ldr r5, _0804E618 @ =0x03004DF0
	ldr r0, [r5]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0804E62E
	adds r0, r4, #0
	bl GetItemMinRange
	cmp r0, #2
	ble _0804E61C
	movs r0, #2
	b _0804E630
	.align 2, 0
_0804E618: .4byte 0x03004DF0
_0804E61C:
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804E62E
	movs r0, #1
	b _0804E630
_0804E62E:
	movs r0, #3
_0804E630:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

