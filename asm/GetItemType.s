	.syntax unified
	.section .text.GetItemType, "ax", %progbits
@ GetItemType @ JP 0x080172F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemType
	.thumb_func
GetItemType:
	push {lr}
	cmp r0, #0
	beq _0801730C
	movs r1, #0xff
	ands r1, r0
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08017308 @ =0x0885E068
	adds r0, r0, r1
	ldrb r0, [r0, #7]
	b _0801730E
	.align 2, 0
_08017308: .4byte 0x0885E068
_0801730C:
	movs r0, #0xff
_0801730E:
	pop {r1}
	bx r1
	.align 2, 0

