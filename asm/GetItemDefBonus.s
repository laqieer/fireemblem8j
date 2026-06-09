	.syntax unified
	.section .text.GetItemDefBonus, "ax", %progbits
@ GetItemDefBonus @ JP 0x08016258 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemDefBonus
	.thumb_func
GetItemDefBonus:
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _08016274
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016278 @ =0x0885E068
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _0801627C
_08016274:
	movs r0, #0
	b _08016282
	.align 2, 0
_08016278: .4byte 0x0885E068
_0801627C:
	ldrb r0, [r0, #4]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_08016282:
	pop {r1}
	bx r1
	.align 2, 0

