	.syntax unified
	.section .text.GetItemMaxCost, "ax", %progbits
@ GetItemMaxCost @ JP 0x08017514 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemMaxCost
	.thumb_func
GetItemMaxCost:
	push {lr}
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801753C @ =0x0885E068
	adds r2, r1, r0
	ldr r0, [r2, #8]
	movs r1, #8
	ands r0, r1
	movs r1, #0xff
	cmp r0, #0
	bne _08017532
	ldrb r1, [r2, #0x14]
_08017532:
	ldrh r0, [r2, #0x1a]
	muls r0, r1, r0
	pop {r1}
	bx r1
	.align 2, 0
_0801753C: .4byte 0x0885E068

