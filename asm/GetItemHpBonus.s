	.syntax unified
	.section .text.GetItemHpBonus, "ax", %progbits
@ GetItemHpBonus @ JP 0x08016198 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemHpBonus
	.thumb_func
GetItemHpBonus:
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _080161B4
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080161B8 @ =0x0885E068
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _080161BC
_080161B4:
	movs r0, #0
	b _080161C2
	.align 2, 0
_080161B8: .4byte 0x0885E068
_080161BC:
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080161C2:
	pop {r1}
	bx r1
	.align 2, 0

