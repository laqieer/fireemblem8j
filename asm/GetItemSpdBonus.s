	.syntax unified
	.section .text.GetItemSpdBonus, "ax", %progbits
@ GetItemSpdBonus @ JP 0x08016228 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemSpdBonus
	.thumb_func
GetItemSpdBonus:
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _08016244
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016248 @ =0x0885E068
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _0801624C
_08016244:
	movs r0, #0
	b _08016252
	.align 2, 0
_08016248: .4byte 0x0885E068
_0801624C:
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_08016252:
	pop {r1}
	bx r1
	.align 2, 0

