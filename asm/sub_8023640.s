	.syntax unified
	.set CanUnitUseWeapon, 0x0801631C + 1
	.set GetItemAttributes, 0x08017314 + 1
	.set GetItemType, 0x080172F0 + 1
	.set GetItemUseEffect, 0x080174E4 + 1
	.set sub_802881C, 0x0802881C + 1
	.section .text.sub_8023640, "ax", %progbits
@ sub_8023640 @ JP 0x08023640 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023640
	.thumb_func
sub_8023640:
	push {r4, r5, lr}
	ldr r5, _08023690 @ =0x03004DF0
	ldr r1, [r5]
	ldr r0, _08023694 @ =0x0203A954
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r4, [r1]
	adds r0, r4, #0
	bl GetItemUseEffect
	cmp r0, #0
	beq _0802368C
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #4
	beq _0802368C
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #0xc
	beq _0802368C
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08023698
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08023698
_0802368C:
	movs r0, #3
	b _080236AE
	.align 2, 0
_08023690: .4byte 0x03004DF0
_08023694: .4byte 0x0203A954
_08023698:
	ldr r0, _080236B4 @ =0x03004DF0
	ldr r0, [r0]
	adds r1, r4, #0
	bl sub_802881C
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _080236AC
	movs r1, #1
_080236AC:
	adds r0, r1, #0
_080236AE:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080236B4: .4byte 0x03004DF0

