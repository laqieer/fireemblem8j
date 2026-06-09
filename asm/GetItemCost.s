	.syntax unified
	.section .text.GetItemCost, "ax", %progbits
@ GetItemCost @ JP 0x080173E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemCost
	.thumb_func
GetItemCost:
	push {lr}
	adds r3, r0, #0
	movs r0, #0xff
	ands r0, r3
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017404 @ =0x0885E068
	adds r2, r1, r0
	ldr r0, [r2, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08017408
	ldrh r0, [r2, #0x1a]
	b _0801740E
	.align 2, 0
_08017404: .4byte 0x0885E068
_08017408:
	asrs r0, r3, #8
	ldrh r1, [r2, #0x1a]
	muls r0, r1, r0
_0801740E:
	pop {r1}
	bx r1
	.align 2, 0

