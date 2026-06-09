	.syntax unified
	.set AiIsInShortList, 0x0803AD18 + 1
	.set AreUnitsAllied, 0x08024D3C + 1
	.section .text.sub_803C83C, "ax", %progbits
@ sub_803C83C @ JP 0x0803C83C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803C83C
	.thumb_func
sub_803C83C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803C874 @ =0x030017C8
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl AiIsInShortList
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803C86E
	ldr r0, _0803C878 @ =0x03004DF0
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803C87C
_0803C86E:
	movs r0, #1
	b _0803C87E
	.align 2, 0
_0803C874: .4byte 0x030017C8
_0803C878: .4byte 0x03004DF0
_0803C87C:
	movs r0, #0
_0803C87E:
	pop {r4}
	pop {r1}
	bx r1

