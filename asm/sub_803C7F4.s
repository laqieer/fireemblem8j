	.syntax unified
	.set AiIsInShortList, 0x0803AD18 + 1
	.set AreUnitsAllied, 0x08024D3C + 1
	.section .text.sub_803C7F4, "ax", %progbits
@ sub_803C7F4 @ JP 0x0803C7F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803C7F4
	.thumb_func
sub_803C7F4:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0803C82C @ =0x030017C8
	ldr r0, [r0]
	ldr r0, [r0, #8]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl AiIsInShortList
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803C834
	ldr r0, _0803C830 @ =0x03004DF0
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803C834
	movs r0, #1
	b _0803C836
	.align 2, 0
_0803C82C: .4byte 0x030017C8
_0803C830: .4byte 0x03004DF0
_0803C834:
	movs r0, #0
_0803C836:
	pop {r4}
	pop {r1}
	bx r1

