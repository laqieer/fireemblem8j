	.syntax unified
	.section .text.GetItemSklBonus, "ax", %progbits
@ GetItemSklBonus @ JP 0x080161F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemSklBonus
	.thumb_func
GetItemSklBonus:
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _08016214
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08016218 @ =0x0885E068
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _0801621C
_08016214:
	movs r0, #0
	b _08016222
	.align 2, 0
_08016218: .4byte 0x0885E068
_0801621C:
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_08016222:
	pop {r1}
	bx r1
	.align 2, 0

