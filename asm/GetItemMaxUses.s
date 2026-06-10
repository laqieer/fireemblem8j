	.syntax unified
	.section .text.GetItemMaxUses, "ax", %progbits
@ GetItemMaxUses @ JP 0x08017358 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemMaxUses
	.thumb_func
GetItemMaxUses:
	push {lr}
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017378 @ =0x0885E068
	adds r2, r1, r0
	ldr r0, [r2, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0801737C
	ldrb r0, [r2, #0x14]
	b _0801737E
	.align 2, 0
_08017378: .4byte 0x0885E068
_0801737C:
	movs r0, #0xff
_0801737E:
	pop {r1}
	bx r1
	.align 2, 0

